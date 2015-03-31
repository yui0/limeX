/*
 * Copyright (c) 1999, 2000, 2001, 2002, 2007,2010 Greg Haerr <greg@censoft.com>
 * Portions Copyright (c) 2002 Koninklijke Philips Electronics
 *
 * Microwindows Screen Driver for Linux kernel framebuffers
 *
 * Portions used from Ben Pfaff's BOGL <pfaffben@debian.org>
 * 
 * Note: modify select_fb_driver() to add new framebuffer subdrivers
 */
#define _GNU_SOURCE 1
#include <assert.h>
#include <fcntl.h>
#include <limits.h>
#include <linux/fb.h>
#include <linux/kd.h>
#include <linux/vt.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include "device.h"
#include "genfont.h"
#include "genmem.h"
#include "fb.h"

#define PATH_FRAMEBUFFER	"/dev/fb0"	/* real framebuffer*/

/* frame buffer emulator defaults - not used with real framebuffer*/
#define PATH_EMULATORFB		"/tmp/fb0"	/* framebuffer emulator when used*/
#define XRES				800			/* default fb emulator xres*/
#define YRES				600			/* default fb emulator yres*/
#define BPP					32			/* default bpp, 1,2,4,8,15,16,24,32, use 15 for 16bpp 5/5/5*/

#define EMBEDDEDPLANET	0	/* =1 for kluge embeddedplanet ppc framebuffer*/

#ifndef FB_TYPE_VGA_PLANES
#define FB_TYPE_VGA_PLANES 4
#endif

static PSD  fb_open(PSD psd);
static void fb_close(PSD psd);
static void fb_setpalette(PSD psd,int first, int count, MWPALENTRY *palette);

SCREENDEVICE	scrdev = {
	0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0,
	gen_fonts,
	fb_open,
	fb_close,
	fb_setpalette,
	gen_getscreeninfo,
	gen_allocatememgc,
	gen_mapmemgc,
	gen_freememgc,
	gen_setportrait,
	NULL,				/* Update*/
	NULL				/* PreSelect*/
};

/* framebuffer info defaults for emulator*/
static struct fb_fix_screeninfo  fb_fix = {
	  .type = FB_TYPE_PACKED_PIXELS,
#if BPP == 1
	  .visual = FB_VISUAL_MONO10,
	  .line_length = XRES / (8 / BPP),
#elif BPP <= 8
	  .visual = FB_VISUAL_PSEUDOCOLOR,
	  .line_length = XRES / (8 / BPP),
#else /* 15,16,24,32bpp*/
	  .visual = FB_VISUAL_TRUECOLOR,
	  .line_length = XRES * ((BPP+1)/8),	/* +1 to make 15bpp work*/
#endif
	  .accel = FB_ACCEL_NONE,
};

static struct fb_var_screeninfo fb_var = {
	  .xres = XRES,
	  .yres = YRES,
	  .xres_virtual = XRES,
	  .yres_virtual = YRES,
	  .bits_per_pixel = BPP,
#if BPP <= 8
	  /* offset, length, msb_right*/
	  .red = { 0, BPP, 0 },
	  .green = { 0, BPP, 0 },
	  .blue = { 0, BPP, 0 },
#elif BPP == 15
	  .red = { 0, 5, 0 },
	  .green = { 0, 5, 0 },		/* green.length is checked for MWPF_TRUECOLOR555*/
	  .blue = { 0, 5, 0 },
#elif BPP == 16
	  .red = { 0, 5, 0 },
	  .green = { 0, 6, 0 },
	  .blue = { 0, 5, 0 },
#else
	  .red = { 0, 8, 0 },
	  .green = { 0, 8, 0 },
	  .blue = { 0, 8, 0 },
#endif
	  .transp = { 0, 0, 0 },	/* transp.length == 8 indicates alpha channel*/
};

/* static variables*/
static int fb;			/* Framebuffer file handle. */
static int status;		/* 0=never inited, 1=once inited, 2=inited. */
static short saved_red[16];	/* original hw palette*/
static short saved_green[16];
static short saved_blue[16];

/* local functions*/
static void	set_directcolor_palette(PSD psd);

/* init framebuffer*/
static PSD
fb_open(PSD psd)
{
	char *	env;
	int	type, visual;
	PSUBDRIVER subdriver;

	assert(status < 2);

	/* locate and open framebuffer, get info*/
	if((env = getenv("FRAMEBUFFER")) != NULL)
		fb = open(env, O_RDWR);
	else {
		/* try /dev/fb0 then /dev/fb/0 */
		fb = open(PATH_FRAMEBUFFER, O_RDWR);
		if (fb < 0)
			fb = open("/dev/fb/0", O_RDWR);
	}
	if(fb < 0) {
		EPRINTF("Error opening %s: %m. Check kernel config\n", env? env: PATH_FRAMEBUFFER);
		return NULL;
	}

	/* get framebuffer info*/
	if (ioctl(fb, FBIOGET_FSCREENINFO, &fb_fix) == -1 ||
		ioctl(fb, FBIOGET_VSCREENINFO, &fb_var) == -1) {
			/* allow framebuffer emulator to fail ioctl*/
			if (env && strcmp(env, PATH_EMULATORFB) != 0) {
				EPRINTF("Error reading screen info: %m\n");
				goto fail;
			}
	}

	/* setup screen device from framebuffer info*/
	type = fb_fix.type;
	visual = fb_fix.visual;

	psd->portrait = MWPORTRAIT_NONE;
#ifdef ARCH_LINUX_SPARC
	psd->xres = psd->xvirtres = fb_var.xres_virtual;
	psd->yres = psd->yvirtres = fb_var.yres_virtual;
#else
	psd->xres = psd->xvirtres = fb_var.xres;
	psd->yres = psd->yvirtres = fb_var.yres;
#endif

	/* set planes from fb type*/
	if (type == FB_TYPE_VGA_PLANES)
		psd->planes = 4;
	else if (type == FB_TYPE_PACKED_PIXELS)
		psd->planes = 1;
	else psd->planes = 0;	/* force error later*/

	psd->bpp = fb_var.bits_per_pixel;
	psd->ncolors = (psd->bpp >= 24)? (1 << 24): (1 << psd->bpp);
	if (psd->bpp == 15)		/* allow 15bpp for static fb emulator init only*/
		psd->bpp = 16;

	psd->pitch = fb_fix.line_length;
	psd->size = psd->yres * psd->pitch;
    psd->flags = PSF_SCREEN;

	/* set pixel format*/
	if(visual == FB_VISUAL_TRUECOLOR || visual == FB_VISUAL_DIRECTCOLOR) {
		switch(psd->bpp) {
		case 8:
			psd->pixtype = MWPF_TRUECOLOR332;
			break;
		case 16:
			if (fb_var.green.length == 5)
				psd->pixtype = MWPF_TRUECOLOR555;	// FIXME must also set MWPF_PIXELFORMAT in config
			else
				psd->pixtype = MWPF_TRUECOLOR565;
			break;
		case 18:
		case 24:
			psd->pixtype = MWPF_TRUECOLOR888;
			break;
		case 32:
#if MWPIXEL_FORMAT == MWPF_TRUECOLORABGR
			psd->pixtype = MWPF_TRUECOLOR8888;
#else
			psd->pixtype = MWPF_TRUECOLORABGR;
#endif
			break;
		default:
			EPRINTF("Unsupported %d color (%d bpp) truecolor framebuffer\n", psd->ncolors, psd->bpp);
			goto fail;
		}
	} else 
		psd->pixtype = MWPF_PALETTE;

	/* set standard data format from bpp and pixtype*/
	psd->data_format = set_data_format(psd);

	EPRINTF("%dx%dx%dbpp pitch %d type %d visual %d colors %d pixtype %d\n", psd->xres, psd->yres,
		(psd->pixtype == MWPF_TRUECOLOR555)? 15: psd->bpp, psd->pitch, type, visual,
		psd->ncolors, psd->pixtype);

	/* select a framebuffer subdriver based on planes and bpp*/
	subdriver = select_fb_subdriver(psd);
	if (!subdriver) {
		EPRINTF("No driver for screen type %d visual %d bpp %d\n", type, visual, psd->bpp);
		goto fail;
	}

	/* set subdriver into screen driver*/
	set_subdriver(psd, subdriver);

#if HAVE_TEXTMODE
	{
	/* open tty, enter graphics mode*/
	int tty = open ("/dev/tty0", O_RDWR);
	if(tty < 0) {
		EPRINTF("Error can't open /dev/tty0: %m\n");
		goto fail;
	}
	if(ioctl (tty, KDSETMODE, KD_GRAPHICS) == -1) {
		EPRINTF("Error setting graphics mode: %m\n");
		close(tty);
		goto fail;
	}
	close(tty);
	}
#endif

	/* mmap framebuffer into this address space*/
	psd->size = (psd->size + getpagesize() - 1) / getpagesize() * getpagesize();

#ifdef ARCH_LINUX_SPARC
#define CG3_MMAP_OFFSET 0x4000000
#define CG6_RAM    		0x70016000
#define TCX_RAM8BIT		0x00000000
#define TCX_RAM24BIT	0x01000000
	switch (fb_fix.accel) {
	case FB_ACCEL_SUN_CGTHREE:
	psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,MAP_SHARED,fb,CG3_MMAP_OFFSET);
		break;
	case FB_ACCEL_SUN_CGSIX:
		psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,MAP_SHARED,fb,CG6_RAM);
		break;
	case FB_ACCEL_SUN_TCX:
		psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,MAP_SHARED,fb,TCX_RAM24BIT);
 		break;
	default:
		EPRINTF("Don't know how to mmap %s with accel %d\n", env, fb_fix.accel);
		goto fail;
	}
#elif defined(BLACKFIN)
	psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_FILE,fb,0);
#elif defined(__uClinux__)
	psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,0,fb,0);
#else
	psd->addr = mmap(NULL, psd->size, PROT_READ|PROT_WRITE,MAP_SHARED,fb,0);
#endif
	if(psd->addr == NULL || psd->addr == (unsigned char *)-1) {
		EPRINTF("Error mmaping %s: %m\n", env);
		goto fail;
	}

	/* save original palette*/
	ioctl_getpalette(0, 16, saved_red, saved_green, saved_blue);

	/* setup direct color palette if required (ATI cards)*/
	if(visual == FB_VISUAL_DIRECTCOLOR)
		set_directcolor_palette(psd);

	status = 2;
	return psd;	/* success*/

fail:
	close(fb);
	return NULL;
}

/* close framebuffer*/
static void
fb_close(PSD psd)
{
	/* if not opened, return*/
	if(status != 2)
		return;
	status = 1;

  	/* reset hw palette*/
	ioctl_setpalette(0, 16, saved_red, saved_green, saved_blue);
  
	/* unmap framebuffer*/
	munmap(psd->addr, psd->size);
  
#if HAVE_TEXTMODE
	{
	/* enter text mode*/
	int tty = open ("/dev/tty0", O_RDWR);
	ioctl(tty, KDSETMODE, KD_TEXT);
	close(tty);
	}
#endif
	/* close framebuffer*/
	close(fb);
}

/* setup directcolor palette - required for ATI cards*/
static void
set_directcolor_palette(PSD psd)
{
	int i;
	short r[256];

	/* 16bpp uses 32 palette entries*/
	if(psd->bpp == 16) {
		for(i=0; i<32; ++i)
			r[i] = i<<11;
		ioctl_setpalette(0, 32, r, r, r);
	} else {
		/* 32bpp uses 256 entries*/
		for(i=0; i<256; ++i)
			r[i] = i<<8;
		ioctl_setpalette(0, 256, r, r, r);
	}
}

static int fade = 100;

/* convert Microwindows palette to framebuffer format and set it*/
static void
fb_setpalette(PSD psd,int first, int count, MWPALENTRY *palette)
{
	int 	i;
	short 	red[256];
	short 	green[256];
	short 	blue[256];

	if (count > 256)
		count = 256;

	/* convert palette to framebuffer format*/
	for(i=0; i < count; i++) {
		MWPALENTRY *p = &palette[i];

		/* grayscale computation:
		 * red[i] = green[i] = blue[i] =
		 *	(p->r * 77 + p->g * 151 + p->b * 28);
		 */
		red[i] = (p->r * fade / 100) << 8;
		green[i] = (p->g * fade / 100) << 8;
		blue[i] = (p->b * fade / 100) << 8;
	}
	ioctl_setpalette(first, count, red, green, blue);
}

/* get framebuffer palette*/
void
ioctl_getpalette(int start, int len, short *red, short *green, short *blue)
{
#if EMBEDDEDPLANET
	int 		i;
	unsigned short 	colors[256];

	ioctl(fb, 4, colors);
	for (i = start; ((i - start) < len) && (i < 256); i++) {
		red[i - start] = (colors[i] & 0xf00) << 4;
		green[i - start] = (colors[i] & 0x0f0) << 8;
		blue[i - start] = (colors[i] & 0x00f) << 12;
	}
#else
	struct fb_cmap cmap;

	cmap.start = start;
	cmap.len = len;
	cmap.red = (unsigned short *)red;
	cmap.green = (unsigned short *)green;
	cmap.blue = (unsigned short *)blue;
	cmap.transp = NULL;

	ioctl(fb, FBIOGETCMAP, &cmap);
#endif
}

/* set framebuffer palette*/
void
ioctl_setpalette(int start, int len, short *red, short *green, short *blue)
{
#if EMBEDDEDPLANET
	int 		i;
	unsigned short 	colors[256];

	ioctl(fb, 4, colors);
	for (i = start; ((i - start) < len) && (i < 256); i++) {
		colors[i] = ((red[i - start] & 0xf000) >> 4)
			| ((green[i - start] & 0xf000) >> 8)
			| ((blue[i - start] & 0xf000) >> 12);
	}
	ioctl(fb, 3, colors);
#else
	struct fb_cmap cmap;

	cmap.start = start;
	cmap.len = len;
	cmap.red = (unsigned short *)red;
	cmap.green = (unsigned short *)green;
	cmap.blue = (unsigned short *)blue;
	cmap.transp = NULL;

	ioctl(fb, FBIOPUTCMAP, &cmap);
#endif
}

/* experimental palette animation*/
void
setfadelevel(PSD psd, int f)
{
	int 		i;
	short 	r[256], g[256], b[256];
	extern MWPALENTRY gr_palette[256];

	if(psd->pixtype != MWPF_PALETTE)
		return;

	fade = f;
	if(fade > 100)
		fade = 100;
	for(i=0; i<256; ++i) {
		r[i] = (gr_palette[i].r * fade / 100) << 8;
		g[i] = (gr_palette[i].g * fade / 100) << 8;
		b[i] = (gr_palette[i].b * fade / 100) << 8;
	}
	ioctl_setpalette(0, 256, r, g, b);
}
