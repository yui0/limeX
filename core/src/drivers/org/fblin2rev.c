/*
 * Copyright (c) 1999, 2010 Greg Haerr <greg@censoft.com>
 *
 * 2bpp Packed Linear Video Driver for Microwindows (LSB first bit order)
 * For Psion S5
 *
 * 	In this driver, psd->linelen is line byte length, not line pixel length
 */
/*#define NDEBUG*/
#include <assert.h>
#include <string.h>
#include "device.h"
#include "fb.h"

static const unsigned char notmask[4] = { 0xfc, 0xf3, 0xcf, 0x3f };

/* Calc linelen and mmap size, return 0 on fail*/
static int
linear2_init(PSD psd)
{
	if (!psd->size)
		psd->size = psd->yres * psd->linelen;
	/* linelen in bytes for bpp 1, 2, 4, 8 so no change*/
	return 1;
}

/* Set pixel at x, y, to pixelval c*/
static void
linear2_drawpixel(PSD psd, MWCOORD x, MWCOORD y, MWPIXELVAL c)
{
	ADDR8 addr = ((ADDR8)psd->addr) + (x>>2) + y * psd->linelen;
#if DEBUG
	assert (psd->addr != 0);
	assert (x >= 0 && x < psd->xres);
	assert (y >= 0 && y < psd->yres);
	assert (c < psd->ncolors);
#endif
	DRAWON;
	if(gr_mode == MWROP_XOR)
		*addr ^= c << ((x&3)<<1);
	else
		*addr = (*addr & notmask[x&3]) | (c << ((x&3)<<1));
	DRAWOFF;
}

/* Read pixel at x, y*/
static MWPIXELVAL
linear2_readpixel(PSD psd, MWCOORD x, MWCOORD y)
{
#if DEBUG
	assert (psd->addr != 0);
	assert (x >= 0 && x < psd->xres);
	assert (y >= 0 && y < psd->yres);
#endif
	return (((ADDR8)psd->addr)[(x>>2) + y * psd->linelen] >> ((x&3)<<1) ) & 0x03;
}

/* Draw horizontal line from x1,y to x2,y including final point*/
static void
linear2_drawhorzline(PSD psd, MWCOORD x1, MWCOORD x2, MWCOORD y, MWPIXELVAL c)
{
	ADDR8 addr = ((ADDR8)psd->addr) + (x1>>2) + y * psd->linelen;
#if DEBUG
	assert (psd->addr != 0);
	assert (x1 >= 0 && x1 < psd->xres);
	assert (x2 >= 0 && x2 < psd->xres);
	assert (x2 >= x1);
	assert (y >= 0 && y < psd->yres);
	assert (c < psd->ncolors);
#endif
	DRAWON;
	if(gr_mode == MWROP_XOR) {
		while(x1 <= x2) {
			*addr ^= c << ((x1&3)<<1);
			if((++x1 & 3) == 0)
				++addr;
		}
	} else {
		while(x1 <= x2) {
			*addr = (*addr & notmask[x1&3]) | (c << ((x1&3)<<1));
			if((++x1 & 3) == 0)
				++addr;
		}
	}
	DRAWOFF;
}

/* Draw a vertical line from x,y1 to x,y2 including final point*/
static void
linear2_drawvertline(PSD psd, MWCOORD x, MWCOORD y1, MWCOORD y2, MWPIXELVAL c)
{
	int	linelen = psd->linelen;
	ADDR8 addr = ((ADDR8)psd->addr) + (x>>2) + y1 * linelen;
#if DEBUG
	assert (psd->addr != 0);
	assert (x >= 0 && x < psd->xres);
	assert (y1 >= 0 && y1 < psd->yres);
	assert (y2 >= 0 && y2 < psd->yres);
	assert (y2 >= y1);
	assert (c < psd->ncolors);
#endif
	DRAWON;
	if(gr_mode == MWROP_XOR)
		while(y1++ <= y2) {
			*addr ^= c << ((x&3)<<1);
			addr += linelen;
		}
	else
		while(y1++ <= y2) {
			*addr = (*addr & notmask[x&3]) | (c << ((x&3)<<1));
			addr += linelen;
		}
	DRAWOFF;
}

/* srccopy bitblt, opcode is currently ignored*/
static void
linear2_blit(PSD dstpsd, MWCOORD dstx, MWCOORD dsty, MWCOORD w, MWCOORD h,
	PSD srcpsd, MWCOORD srcx, MWCOORD srcy, int op)
{
	ADDR8	dst, src;
	int		i;
	int		dlinelen = dstpsd->linelen;
	int		slinelen = srcpsd->linelen;

	assert (dstpsd->addr != 0);
	assert (dstx >= 0 && dstx < dstpsd->xres);
	assert (dsty >= 0 && dsty < dstpsd->yres);
	assert (w > 0);
	assert (h > 0);
	assert (srcpsd->addr != 0);
	assert (srcx >= 0 && srcx < srcpsd->xres);
	assert (srcy >= 0 && srcy < srcpsd->yres);
	assert (dstx+w <= dstpsd->xres);
	assert (dsty+h <= dstpsd->yres);
	assert (srcx+w <= srcpsd->xres);
	assert (srcy+h <= srcpsd->yres);

	DRAWON;
	/* src is LSB 2bpp, dst is LSB 2bpp*/
	dst = ((ADDR8)dstpsd->addr) + (dstx>>2) + dsty * dlinelen;
	src = ((ADDR8)srcpsd->addr) + (srcx>>2) + srcy * slinelen;
	while(--h >= 0) {
		ADDR8	d = dst;
		ADDR8	s = src;
		MWCOORD	dx = dstx;
		MWCOORD	sx = srcx;

		for(i=0; i<w; ++i) {
			*d = (*d & notmask[dx&3]) | ((*s >> ((sx&3)<<1) & 0x03) << ((dx&3)<<1));
			if((++dx & 3) == 0)
				++d;
			if((++sx & 3) == 0)
				++s;
		}
		dst += dlinelen;
		src += slinelen;
	}
	DRAWOFF;
}

#if MW_FEATURE_PSDOP_BITMAP_BYTES_MSB_FIRST
/* psd->DrawArea operation PSDOP_BITMAP_BYTES_MSB_FIRST which
 * takes a pixmap, each line is byte aligned, and copies it
 * to the screen using fg_color and bg_color to replace a 1
 * and 0 in the pixmap.  
 *
 * The bitmap is ordered how you'd expect, with the MSB used
 * for the leftmost of the 8 pixels controlled by each byte.
 *
 * Variables used in the gc:
 *       dstx, dsty, height, width   Destination rectangle
 *       srcx, srcy               Source rectangle
 *       src_linelen              Linesize in bytes of source
 *       data                   Pixmap data
 *       fg_color                 Color of a '1' bit
 *       bg_color                 Color of a '0' bit
 *       usebg                 If set, bg_color is used.  If zero,
 *                                then '0' bits are transparent.
 */
static void
linear2_drawarea_bitmap_bytes_msb_first(PSD psd, driver_gc_t * gc)
{
	ADDR8	dst, src;
	int		i;
	int		dlinelen = psd->linelen;
	int		slinelen = gc->src_linelen;
	MWCOORD	h = gc->height;
	MWCOORD	w = gc->width;
	MWPIXELVAL fg = gc->fg_color;
	MWPIXELVAL bg = gc->bg_color;
#if DEBUG
	assert (psd->addr != 0);
	assert (gc->dstx >= 0 && gc->dstx < psd->xres);
	assert (gc->dsty >= 0 && gc->dsty < psd->yres);
	assert (gc->width > 0);
	assert (gc->height > 0);
	assert (gc->dstx+w <= psd->xres);
	assert (gc->dsty+h <= psd->yres);
#endif
	DRAWON;
	/* src is MSB 1bpp, dst is LSB 2bpp*/
	dst = ((ADDR8)psd->addr) + (gc->dstx>>2) + gc->dsty * dlinelen;
	src = ((ADDR8)gc->data) + (gc->srcx>>2) + gc->srcy * slinelen;
	while(--h >= 0) {
		ADDR8	d = dst;
		ADDR8	s = src;
		MWCOORD	dx = gc->dstx;
		MWCOORD	sx = gc->srcx;

		if (gc->usebg) {
			for(i=0; i<w; ++i) {
				/* check if src bit set, write fg color else bg color*/
				if ((*s >> (7-(sx&7))) & 01)
					*d = (*d & notmask[dx&3]) | (fg << ((dx&3)<<1));
				else
					*d = (*d & notmask[dx&3]) | (bg << ((dx&3)<<1));
				if((++dx & 3) == 0)
					++d;
				if((++sx & 7) == 0)
					++s;
			}
		} else {
			for(i=0; i<w; ++i) {
				/* check if src bit set, and write fg color*/
				if ((*s >> (7-(sx&7))) & 01)
					*d = (*d & notmask[dx&3]) | (fg << ((dx&3)<<1));
				if((++dx & 3) == 0)
					++d;
				if((++sx & 7) == 0)
					++s;
			}
		}
		dst += dlinelen;
		src += slinelen;
	}
	DRAWOFF;
}
#endif /* MW_FEATURE_PSDOP_BITMAP_BYTES_MSB_FIRST */

static void
linear2_drawarea(PSD psd, driver_gc_t * gc)
{
#if DEBUG
	assert(psd->addr != 0);
	/*assert(gc->width <= gc->srcw); */
	assert(gc->dstx >= 0 && gc->dstx + gc->width <= psd->xres);
	/*assert(gc->dsty >= 0 && gc->dsty+gc->height <= psd->yres); */
	/*assert(gc->srcx >= 0 && gc->srcx+gc->width <= gc->srcw); */
	assert(gc->srcy >= 0);
	/*DPRINTF("linear1_drawarea op=%d dstx=%d dsty=%d\n", op, gc->dstx, gc->dsty);*/
#endif
	switch (gc->op) {
#if MW_FEATURE_PSDOP_ALPHACOL
	case PSDOP_ALPHACOL:
		DPRINTF("linear2_drawarea: PSDOP_ALPHACOL not supported\n");
		break;
#endif
	
#if MW_FEATURE_PSDOP_BITMAP_BYTES_LSB_FIRST
	case PSDOP_BITMAP_BYTES_LSB_FIRST:
		DPRINTF("linear2_drawarea: PSDOP_BITMAP_BYTES_LSB_FIRST not supported\n");
		break;
#endif
	
#if MW_FEATURE_PSDOP_BITMAP_BYTES_MSB_FIRST
	case PSDOP_BITMAP_BYTES_MSB_FIRST:
		linear2_drawarea_bitmap_bytes_msb_first(psd, gc);
		break;
#endif
	
	  }
}

SUBDRIVER fblinear2 = {
	linear2_init,
	linear2_drawpixel,
	linear2_readpixel,
	linear2_drawhorzline,
	linear2_drawvertline,
	gen_fillrect,
	linear2_blit,
	linear2_drawarea
};
