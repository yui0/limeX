/*
 * Copyright (c) 2000, 2001, 2003, 2010 Greg Haerr <greg@censoft.com>
 * Portions Copyright (c) 2002 Koninklijke Philips Electronics
 * Copyright (c) 1999 Tony Rogvall <tony@bluetail.com>
 * 	Rewritten to avoid multiple function calls by Greg Haerr
 *      Alpha blending added by Erik Hill
 *      (brought to life in a dark laboratory on a stormy night
 *      in an ancient castle by Dr. Frankenstein)
 *
 * X11 screen driver for Microwindows
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
//#include <X11/extensions/xf86dga.h>
#include <assert.h>
#include "device.h"
#include "fb.h"
#include "genmem.h"
#include "genfont.h"

/* SCREEN_WIDTH, SCREEN_HEIGHT and MWPIXEL_FORMAT define server X window*/
#ifndef SCREEN_WIDTH
#error SCREEN_WIDTH not defined
#endif

#ifndef SCREEN_HEIGHT
#error SCREEN_HEIGHT not defined
#endif

#ifndef MWPIXEL_FORMAT
#error MWPIXEL_FORMAT not defined
#endif

/* SCREEN_DEPTH is used only for palette modes*/
#if !defined(SCREEN_DEPTH) && (MWPIXEL_FORMAT == MWPF_PALETTE)
#error SCREEN_DEPTH not defined - must be set for palette modes
#endif

/* externally set override values from nanox/srvmain.c*/
MWCOORD	nxres;			/* requested server x res*/
MWCOORD	nyres;			/* requested server y res*/

/* specific x11 driver entry points*/
static PSD X11_open(PSD psd);
static void X11_close(PSD psd);
static void X11_getscreeninfo(PSD psd, PMWSCREENINFO psi);
static void X11_setpalette(PSD psd, int first, int count, MWPALENTRY * pal);
static void X11_preselect(PSD psd);
static void X11_update(PSD psd, MWCOORD x, MWCOORD y, MWCOORD width, MWCOORD height);

SCREENDEVICE scrdev = {
	0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0,
	gen_fonts,
	X11_open,
	X11_close,
	X11_setpalette,
	X11_getscreeninfo,
	gen_allocatememgc,
	gen_mapmemgc,
	gen_freememgc,
	gen_setportrait,
	X11_update,
	X11_preselect,
};

/* called from keyboard/mouse/screen */
Display *x11_dpy;
int x11_scr;
Visual *x11_vis;
Colormap x11_colormap;
Window x11_win;
GC x11_gc;
unsigned int x11_event_mask;

static int x11_width, x11_height;
static int x11_depth;		/* Screen depth in bpp */

static int x11_is_palette;	/* Nonzero for palette, zero for true color */

/* For a truecolor X11 system, the following constants define the colors */
static int x11_r_shift;
static unsigned long x11_r_mask;
static int x11_g_shift;
static unsigned long x11_g_mask;
static int x11_b_shift;
static unsigned long x11_b_mask;

static int x11_colormap_installed = 0;

/* color palette for color indexe */
static XColor x11_palette[256];
static int x11_pal_max = 0;

#if MWPIXEL_FORMAT != MWPF_PALETTE
/* Color cache for true color lookups */
#define COLOR_CACHE_SIZE 1001
struct color_cache {
	int init;		/* 1 if first use */
	unsigned short r;
	unsigned short g;
	unsigned short b;
	XColor c;
};
static struct color_cache ccache[COLOR_CACHE_SIZE];

/* called from mou_x11.c*/
void x11_handle_event(XEvent * ev);
int x11_setup_display(void);

static unsigned long
lookup_color(unsigned short r, unsigned short g, unsigned short b)
{
	int ix = ((r << 16) + (g << 8) + b) % COLOR_CACHE_SIZE;

	if (ccache[ix].init || (ccache[ix].r != r) || (ccache[ix].g != g)
	    || (ccache[ix].b != b)) {
		char spec[20];
		XColor exact;
		XColor def;

		ccache[ix].init = 0;
		ccache[ix].r = r;
		ccache[ix].g = g;
		ccache[ix].b = b;
		sprintf(spec, "#%02x%02x%02x", r, g, b);
		XLookupColor(x11_dpy, x11_colormap, spec, &exact, &def);
		XAllocColor(x11_dpy, x11_colormap, &def);
		ccache[ix].c = def;

		/* DPRINTF("lookup: exact(%d,%d,%d) = %d, def(%d,%d,%d)=%d\n",
		   exact.red>>8, exact.green>>8, exact.blue>>8, exact.pixel,
		   def.red>>8, def.green>>8, def.blue>>8, def.pixel); */
	}
	return (unsigned long) ccache[ix].c.pixel;
}
#endif /* MWPIXEL_FORMAT != MWPF_PALETTE */


#if MWPIXEL_FORMAT != MWPF_PALETTE

#if (MWPIXEL_FORMAT == MWPF_TRUECOLOR888) || (MWPIXEL_FORMAT == MWPF_TRUECOLOR8888)
#define PIXEL2RED8(p)           PIXEL888RED8(p)
#define PIXEL2GREEN8(p)         PIXEL888GREEN8(p)
#define PIXEL2BLUE8(p)          PIXEL888BLUE8(p)
#define PIXEL2RED32(p)          PIXEL888RED32(p)
#define PIXEL2GREEN32(p)        PIXEL888GREEN32(p)
#define PIXEL2BLUE32(p)         PIXEL888BLUE32(p)
#elif MWPIXEL_FORMAT == MWPF_TRUECOLORABGR
#define PIXEL2RED8(p)           PIXELABGRRED8(p)
#define PIXEL2GREEN8(p)         PIXELABGRGREEN8(p)
#define PIXEL2BLUE8(p)          PIXELABGRBLUE8(p)
#define PIXEL2RED32(p)          PIXELABGRRED32(p)
#define PIXEL2GREEN32(p)        PIXELABGRGREEN32(p)
#define PIXEL2BLUE32(p)         PIXELABGRBLUE32(p)
#elif MWPIXEL_FORMAT == MWPF_TRUECOLOR565
#define PIXEL2RED8(p)           PIXEL565RED8(p)
#define PIXEL2GREEN8(p)         PIXEL565GREEN8(p)
#define PIXEL2BLUE8(p)          PIXEL565BLUE8(p)
#define PIXEL2RED32(p)          PIXEL565RED32(p)
#define PIXEL2GREEN32(p)        PIXEL565GREEN32(p)
#define PIXEL2BLUE32(p)         PIXEL565BLUE32(p)
#elif MWPIXEL_FORMAT == MWPF_TRUECOLOR555
#define PIXEL2RED8(p)           PIXEL555RED8(p)
#define PIXEL2GREEN8(p)         PIXEL555GREEN8(p)
#define PIXEL2BLUE8(p)          PIXEL555BLUE8(p)
#define PIXEL2RED32(p)          PIXEL555RED32(p)
#define PIXEL2GREEN32(p)        PIXEL555GREEN32(p)
#define PIXEL2BLUE32(p)         PIXEL555BLUE32(p)
#elif MWPIXEL_FORMAT == MWPF_TRUECOLOR332
#define PIXEL2RED8(p)           PIXEL332RED8(p)
#define PIXEL2GREEN8(p)         PIXEL332GREEN8(p)
#define PIXEL2BLUE8(p)          PIXEL332BLUE8(p)
#define PIXEL2RED32(p)          PIXEL332RED32(p)
#define PIXEL2GREEN32(p)        PIXEL332GREEN32(p)
#define PIXEL2BLUE32(p)         PIXEL332BLUE32(p)
#endif

/* calc truecolor conversions directly */
#define PIXELVAL_to_pixel(c) (x11_is_palette                                \
            ? lookup_color(PIXEL2RED8(c), PIXEL2GREEN8(c), PIXEL2BLUE8(c))  \
            : ( ((PIXEL2RED32(c)   >> x11_r_shift) & x11_r_mask)            \
              | ((PIXEL2GREEN32(c) >> x11_g_shift) & x11_g_mask)            \
              | ((PIXEL2BLUE32(c)  >> x11_b_shift) & x11_b_mask) ) )

#else /* MWPIXEL_FORMAT == MWPF_PALETTE */
#define PIXELVAL_to_pixel(c) ((unsigned)(c) > (unsigned)x11_pal_max ? 0 : x11_palette[c].pixel)
#endif

/* called from mou_x11 (handles x11_event_mask events) */
void
x11_handle_event(XEvent * ev)
{
	static int inited = 0;

	if (ev->type == ColormapNotify) {
		if (ev->xcolormap.window == x11_win) {
			if (ev->xcolormap.state == ColormapInstalled) {
				DPRINTF("colormap uninstalled\n");
				x11_colormap_installed = 0;
			} else if (ev->xcolormap.state == ColormapInstalled) {
				x11_colormap_installed = 1;
				DPRINTF("colormap installed\n");
			}
		}
	} else if (ev->type == FocusIn) {
		if (!x11_colormap_installed) {
			DPRINTF("setting colormap\n");
			XInstallColormap(x11_dpy, x11_colormap);
			inited = 1;
		}
	} else if (ev->type == MappingNotify) {
		DPRINTF("Refreshing keyboard mapping\n");
		XRefreshKeyboardMapping(&ev->xmapping);
	}
#if 0
	else if (ev->type == EnterNotify) {
		if (inited)
			GdShowCursor(&scrdev);
	} else if (ev->type == LeaveNotify) {
		if (inited)
			GdHideCursor(&scrdev);
	}
#endif

#if USE_EXPOSURE
	else if (ev->type == Expose) {
		scrdev.Update(&scrdev, ev->xexpose.x, ev->xexpose.y, ev->xexpose.width, ev->xexpose.height);
	}
#endif
}

static int
x11_error(Display * dpy, XErrorEvent * ev)
{
	char err_string[256];

	XGetErrorText(dpy, ev->error_code, err_string, 256);
	EPRINTF("X11 error: %s\n", err_string);
	return 0;
}

static const char * const classnm[] = {
	"StaticGray", "GrayScale", "StaticColor",
	"PseudoColor", "TrueColor", "DirectColor"
};

static void
show_visual(Visual * v)
{
	const char *name = ((v->class < 0) || (v->class > 5)) ? "???" : classnm[v->class];
	DPRINTF("  Visual  class: %s (%d)\n", name, v->class);
	DPRINTF("             id: %ld\n", v->visualid);
	DPRINTF("   bits_per_rgb: %d\n", v->bits_per_rgb);
	DPRINTF("    map_entries: %d\n", v->map_entries);
	DPRINTF("       red_mask: 0x%08lx\n", v->red_mask);
	DPRINTF("     green_mask: 0x%08lx\n", v->green_mask);
	DPRINTF("      blue_mask: 0x%08lx\n", v->blue_mask);
}

static Visual *
select_visual(Display * dpy, int scr)
{
	Visual *vis = XDefaultVisual(dpy, scr);
#if MWPIXEL_FORMAT != MWPF_PALETTE	/* Patch by Jon to try for 8-bit TrueColor */
	Visual *vis2 = NULL;
#endif
	Screen *screen = XScreenOfDisplay(dpy, scr);
	int d;

//	DPRINTF("XDefaultVisual:\n");
//	show_visual(vis);
//	DPRINTF("Screen RootDepth: %d\n", screen->root_depth);
//	DPRINTF("Screen RootVisual\n");
//	show_visual(screen->root_visual);

	/* print all depths/visuals */
	for (d = 0; d < screen->ndepths; d++) {
		Depth *dp = screen->depths + d;
		int v;
		Visual *cur_vis;
//		DPRINTF("Depth: %d\n", dp->depth);
		for (v = 0; v < dp->nvisuals; v++) {
//			DPRINTF("Visual: %d\n", v);
			cur_vis = dp->visuals + v;
//			show_visual(cur_vis);
#if MWPIXEL_FORMAT != MWPF_PALETTE	/* Patch by Jon to try for 8-bit TrueColor */
			if ((vis->class != TrueColor)
			    && (dp->depth == screen->root_depth)
			    && (cur_vis->class == TrueColor)) {
				/* Maybe useful... */
				if ((vis2 == NULL)
				    || (vis2->bits_per_rgb <
					cur_vis->bits_per_rgb)) {
					/* Better than what we had before */
					vis2 = cur_vis;
				}
			}
#endif
		}
	}
#if MWPIXEL_FORMAT != MWPF_PALETTE	/* Patch by Jon to try for 8-bit TrueColor */
	if ((vis->class != TrueColor) && (vis2 != NULL))
		vis = vis2;

	DPRINTF("Selected Visual:\n");
	show_visual(vis);
#endif

	return vis;
}


int
x11_setup_display(void)
{
	static int setup_needed = 1;

	if (setup_needed) {
		char *name;
#if MWPIXEL_FORMAT != MWPF_PALETTE
		int i;
#endif

		if ((name = getenv("DISPLAY")) == NULL)
			name = ":0";
		if ((x11_dpy = XOpenDisplay(name)) == NULL)
			return -1;

		XSetErrorHandler(x11_error);
#if 0
{
	int	events, errors, major, minor;

	if (XDGAQueryExtension(x11_dpy, &events, &errors) &&
	    XDGAQueryVersion(x11_dpy, &major, &minor)) {
			if (major >= 2 && XDGAOpenFramebuffer(x11_dpy, DefaultScreen(x11_dpy))) {
				DPRINTF("GOT it!\n");
				XDGACloseFramebuffer(x11_dpy, DefaultScreen(x11_dpy));
			}
	}
}
#endif
		x11_width = nxres? nxres: SCREEN_WIDTH;
		x11_height = nyres? nyres: SCREEN_HEIGHT;
		x11_scr = XDefaultScreen(x11_dpy);
		x11_vis = select_visual(x11_dpy, x11_scr);

		if (x11_vis->class == StaticGray || x11_vis->class == GrayScale) {
			EPRINTF("Nano-X Error: Your X server appears to be grayscale only.\nThis is not supported.\n");
			return -1;
		} else if (x11_vis->class == DirectColor) {
			EPRINTF("Nano-X Error: Your X server appears to use the 'DirectColor' format.\nThis is not supported.\n");
			return -1;
		} else if (x11_vis->class == PseudoColor || x11_vis->class == StaticColor) {
			x11_is_palette = 1; 		/* Palette based. */
		} else if (x11_vis->class == TrueColor) {
			unsigned long mask;
			int shift;

			x11_is_palette = 0;

			/*
			 * What we want to do:
			 *
			 * Given the RGB components:
			 *   0 <= r <= 255,
			 *   0 <= g <= 255,
			 *   0 <= b <= 255
			 *
			 * We need to compute the X11 color, c:
			 *
			 *   xr = ((r << 24) >> r_shift) & r_mask;
			 *   xg = ((g << 24) >> g_shift) & g_mask;
			 *   xb = ((b << 24) >> b_shift) & b_mask;
			 *
			 *   c  = xr | xg | xb;
			 *
			 * This code computes appropriate values for r/g/b_shift, given
			 * the r/g/b_mask values (which are taken from the X11 Visual).
			 *
			 *
			 * The reason for doing the wierd <<24 before the >>r_shift is
			 * that without it we may have to shift in either direction (<< or
			 * >>).  You can't shift by a negative amount, so you end up with
			 * either an "if" (slow!) or two shifts.  The <<24 actually has no
			 * cost, since "r" is created using a shift, we just change that
			 * shift.
			 */

			x11_r_mask = x11_vis->red_mask;
			x11_g_mask = x11_vis->green_mask;
			x11_b_mask = x11_vis->blue_mask;

			/* Calculate red shift */
			mask = x11_r_mask;
			shift = 0;
			assert(mask);
			if (mask) {
				while ((mask & 0x80000000UL) == 0) {
					mask <<= 1;
					shift++;
				}
			}
			x11_r_shift = shift;

			/* Calculate green shift */
			mask = x11_g_mask;
			shift = 0;
			assert(mask);
			if (mask) {
				while ((mask & 0x80000000UL) == 0) {
					mask <<= 1;
					shift++;
				}
			}
			x11_g_shift = shift;

			/* Calculate blue shift */
			mask = x11_b_mask;
			shift = 0;
			assert(mask);
			if (mask) {
				while ((mask & 0x80000000UL) == 0) {
					mask <<= 1;
					shift++;
				}
			}
			x11_b_shift = shift;
		} else {
			assert(0);
			return -1;
		}

		x11_gc = XDefaultGC(x11_dpy, x11_scr);

#if MWPIXEL_FORMAT != MWPF_PALETTE
		for (i = 0; i < COLOR_CACHE_SIZE; i++)
			ccache[i].init = 1;
#endif

		XSetFunction(x11_dpy, x11_gc, GXcopy);

		setup_needed = 0;
	}
	return 0;
}

/* Note: only single screen */
static PSD
X11_open(PSD psd)
{
	XSetWindowAttributes attr;
	Pixmap cur_empty;
	unsigned long valuemask;
	unsigned int event_mask;
	XColor color;
	Cursor cursor;
	/*XEvent ev; */
	PSUBDRIVER subdriver;
	XSizeHints *sizehints;

	if (x11_setup_display() < 0)
		return NULL;

	x11_event_mask = ColormapChangeMask | FocusChangeMask;
	/*x11_event_mask |= EnterWindowMask | LeaveWindowMask;*/

	event_mask = x11_event_mask | ExposureMask | KeyPressMask |	/* handled by kbd_x11 */
		KeyReleaseMask |	/* handled by kbd_x11 */
		ButtonPressMask |	/* handled by mou_x11 */
		ButtonReleaseMask |	/* handled by mou_x11 */
		PointerMotionMask;	/* handled by mou_x11 */


#if USE_EXPOSURE
	valuemask = CWSaveUnder | CWEventMask;
#else
	valuemask = CWSaveUnder | CWEventMask | CWBackingStore;
#endif

	attr.backing_store = Always;	/* auto expose */
	attr.save_under = True;		/* popups ... */
	attr.event_mask = event_mask;

#if 1				/* Patch by Jon to try for 8-bit TrueColor */
	x11_colormap = XCreateColormap(x11_dpy, XDefaultRootWindow(x11_dpy), x11_vis, AllocNone);
	attr.colormap = x11_colormap;
	valuemask |= CWColormap;
#endif

	x11_win = XCreateWindow(x11_dpy, XDefaultRootWindow(x11_dpy), 100,	/* x */
				100,		/* y */
				x11_width,	/* width */
				x11_height,	/* height */
				2,		/* border */
				CopyFromParent,	/* depth */
				InputOutput,	/* class */
				x11_vis,	/* Visual */
				valuemask,	/* valuemask */
				&attr		/* attributes */
		);

	sizehints = XAllocSizeHints();
	if (sizehints != NULL) {
		sizehints->flags = PMinSize | PMaxSize;
		sizehints->min_width = x11_width;
		sizehints->min_height = x11_height;
		sizehints->max_width = x11_width;
		sizehints->max_height = x11_height;
		XSetWMNormalHints(x11_dpy, x11_win, sizehints);
		XFree(sizehints);
	}

	x11_depth = XDefaultDepth(x11_dpy, x11_scr);

	/* Create a new empty colormap, the colormap will be
	 ** filled by lookup_color in the case of
	 ** GrayScale, PseduoColor and DirectColor,
	 ** or looked up in the case of 
	 **  StaticGray, StaticColor and TrueColor
	 */

#if 0				/* REMOVED by Patch by Jon to try for 8-bit TrueColor */
	x11_colormap = XDefaultColormap(x11_dpy, x11_scr);
	if (x11_vis->class & 1)
		x11_colormap = XCopyColormapAndFree(x11_dpy, x11_colormap);
#endif

	/* If you need more colors, create it from scratch
	 *
	 * x11_colormap = XCreateColormap(x11_dpy, x11_win, x11_vis,
	 * AllocNone);  
	 *
	 * or: for same visual etc.
	 * x11_colormap = XCopyColormapAndFree(x11_dpy, x11_colormap);
	 */

	/* Create an empty (invisible) cursor.  This is because
	 * Microwindows will draw it's own cursor.
	 */
	cur_empty = XCreateBitmapFromData(x11_dpy, x11_win, "\0", 1, 1);
	cursor = XCreatePixmapCursor(x11_dpy, cur_empty, cur_empty, &color, &color, 0, 0);
	XDefineCursor(x11_dpy, x11_win, cursor);
	XStoreName(x11_dpy, x11_win, "Microwindows");

	XMapWindow(x11_dpy, x11_win);
	XFlush(x11_dpy);

	/*
	 * The following code insures that the colormap
	 * is installed before display
	 */
#if 0
	XMaskEvent(x11_dpy, x11_event_mask, &ev);
	XPutBackEvent(x11_dpy, &ev);
#endif
	XInstallColormap(x11_dpy, x11_colormap);

	psd->xres = psd->xvirtres = x11_width;
	psd->yres = psd->yvirtres = x11_height;
	psd->planes = 1;
	psd->pixtype = MWPIXEL_FORMAT;
	switch (psd->pixtype) {
#if MWPIXEL_FORMAT == MWPF_PALETTE
	case MWPF_PALETTE:
		psd->bpp = SCREEN_DEPTH;
		break;
#endif
	case MWPF_TRUECOLOR8888:
	case MWPF_TRUECOLORABGR:
	default:
		psd->bpp = 32;
		break;
	case MWPF_TRUECOLOR888:
		psd->bpp = 24;
		break;
	case MWPF_TRUECOLOR565:
	case MWPF_TRUECOLOR555:
		psd->bpp = 16;
		break;
	case MWPF_TRUECOLOR332:
		psd->bpp = 8;
		break;
	}

	/* set standard data format from bpp and pixtype*/
	psd->data_format = set_data_format(psd);

	/* Calculate size and pitch*/
	GdCalcMemGCAlloc(psd, psd->xres, psd->yres, psd->planes, psd->bpp,
		&psd->size, &psd->pitch);

	if ((psd->addr = malloc(psd->size)) == NULL)
		return NULL;
	psd->ncolors = psd->bpp >= 24? (1 << 24): (1 << psd->bpp);
	psd->flags = PSF_SCREEN | PSF_ADDRMALLOC;
	psd->portrait = MWPORTRAIT_NONE;
DPRINTF("x11 emulated bpp %d\n", psd->bpp);

	/* select an fb subdriver matching our planes and bpp for backing store*/
	subdriver = select_fb_subdriver(psd);
	if (!subdriver)
		return NULL;

	/* set subdriver into screen driver*/
	set_subdriver(psd, subdriver);

	return psd;
}

static void
X11_close(PSD psd)
{
	/* free framebuffer memory */
	free(psd->addr);

	XCloseDisplay(x11_dpy);
}

static void
X11_getscreeninfo(PSD psd, PMWSCREENINFO psi)
{
	gen_getscreeninfo(psd, psi);

	psi->xdpcm = (DisplayWidth(x11_dpy, x11_scr) * 10) / DisplayWidthMM(x11_dpy, x11_scr);
	psi->ydpcm = (DisplayHeight(x11_dpy, x11_scr) * 10) / DisplayHeightMM(x11_dpy, x11_scr);
	psi->fbdriver = FALSE;	/* not running fb driver, no direct map */
}

static void
X11_setpalette(PSD psd, int first, int count, MWPALENTRY * pal)
{
	int i;
	int n;

	for (i = 0; i < count; i++) {
		char spec[20];
		unsigned short r, g, b;
		XColor exact;
		XColor def;

		r = pal[i].r;
		g = pal[i].g;
		b = pal[i].b;
		sprintf(spec, "#%02x%02x%02x", r, g, b);
		XLookupColor(x11_dpy, x11_colormap, spec, &exact, &def);
		XAllocColor(x11_dpy, x11_colormap, &def);
		/* DPRINTF("lookup: exact(%d,%d,%d) = %d, def(%d,%d,%d)=%d\n",
		   exact.red, exact.green, exact.blue, exact.pixel,
		   def.red, def.green, def.blue, def.pixel); */
		x11_palette[first + i] = def;
	}
	n = first + count - 1;
	if (n > x11_pal_max)
		x11_pal_max = n;
}

/* perform pre-select() duties*/
static void
X11_preselect(PSD psd)
{
	XFlush(x11_dpy);
}

static void
update_from_savebits(PSD psd, unsigned int destx, unsigned int desty, int w, int h)
{
	XImage *img;
	unsigned int x, y;
	char *data;

	/* allocate buffer */
	if (x11_depth >= 24)
		data = malloc(w * 4 * h);
	else if (x11_depth > 8)	/* 15, 16 */
		data = malloc(w * 2 * h);
	else			/* 1,2,4,8 */
		data = malloc((w * x11_depth + 7) / 8 * h);

	/* copy from offscreen to screen */
	img = XCreateImage(x11_dpy, x11_vis, x11_depth, ZPixmap, 0, data, w, h, 8, 0);

	/* Use optimized loops for most common framebuffer modes */

#if MWPIXEL_FORMAT == MWPF_TRUECOLOR332
	{
		unsigned char *addr = psd->addr + desty * psd->pitch + destx;
		for (y = 0; y < h; y++) {
			for (x = 0; x < w; x++) {
				MWPIXELVAL c = addr[x];
				unsigned long pixel = PIXELVAL_to_pixel(c);
				XPutPixel(img, x, y, pixel);
			}
			addr += psd->pitch;
		}
	}
#elif (MWPIXEL_FORMAT == MWPF_TRUECOLOR565) || (MWPIXEL_FORMAT == MWPF_TRUECOLOR555)
	{
		unsigned char *addr = psd->addr + desty * psd->pitch + (destx << 1);
		for (y = 0; y < h; y++) {
			for (x = 0; x < w; x++) {
				MWPIXELVAL c = ((ADDR16)addr)[x];
				unsigned long pixel = PIXELVAL_to_pixel(c);
				XPutPixel(img, x, y, pixel);
			}
			addr += psd->pitch;
		}
	}
#elif MWPIXEL_FORMAT == MWPF_TRUECOLOR888
	{
		unsigned char *addr = psd->addr + desty * psd->pitch + destx * 3;
		unsigned int extra = psd->pitch - w * 3;
		for (y = 0; y < h; y++) {
			for (x = 0; x < w; x++) {
				MWPIXELVAL c = RGB2PIXEL888(addr[2], addr[1], addr[0]);
				unsigned long pixel = PIXELVAL_to_pixel(c);
				XPutPixel(img, x, y, pixel);
				addr += 3;
			}
			addr += extra;
		}
	}
#elif (MWPIXEL_FORMAT == MWPF_TRUECOLOR8888) || (MWPIXEL_FORMAT == MWPF_TRUECOLORABGR)
	{
		unsigned char *addr = psd->addr + desty * psd->pitch + (destx << 2);
		for (y = 0; y < h; y++) {
			for (x = 0; x < w; x++) {
				MWPIXELVAL c = ((ADDR32)addr)[x];
				unsigned long pixel = PIXELVAL_to_pixel(c);
				XPutPixel(img, x, y, pixel);
			}
			addr += psd->pitch;
		}
	}
#else /* MWPF_PALETTE*/
	{
		unsigned char *addr = psd->addr + desty * psd->pitch + destx;
		for (y = 0; y < h; y++) {
			for (x = 0; x < w; x++) {
				MWPIXELVAL c = addr[x];
				unsigned long pixel = PIXELVAL_to_pixel(c);
				XPutPixel(img, x, y, pixel);
			}
			addr += psd->pitch;
		}
	}
#endif

	XPutImage(x11_dpy, x11_win, x11_gc, img, 0, 0, destx, desty, w, h);
	XDestroyImage(img);
}

static void
X11_update(PSD psd, MWCOORD x, MWCOORD y, MWCOORD width, MWCOORD height)
{
	if (!width)
		width = psd->xres;
	if (!height)
		height = psd->yres;
	update_from_savebits(psd, x, y, width, height);
}
