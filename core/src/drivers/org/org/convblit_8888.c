/*
 * Device-independent low level blit routines - 32bpp RGBA input, 8888 output
 *
 * Copyright (c) 2010 Greg Haerr <greg@censoft.com>
 *
 * These routines do no range checking, clipping, or cursor
 * overwriting checks, but instead draw directly to the
 * data_out memory buffer specified in the passed BLITPARMS struct.
 */
#include "device.h"
#include "convblit.h"

#undef A
#undef R
#undef G
#undef B
#undef SR
#undef SG
#undef SB
#undef SA
#undef SSZ
#undef DSZ
#define SR	0
#define SG	1
#define SB	2
#define SA	3
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * Conversion blit composite src_over 32bpp RGBA image to 32bpp BGRA image
 */
void convblit_srcover_rgba8888_bgra8888(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)     + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;
	int height = gc->height;

	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		unsigned int alpha;
		int w = gc->width;

		while (--w >= 0)
		{
			if ((alpha = s[SA]) == 255)
			{
				d[A] = s[SA];
				d[R] = s[SR];
				d[G] = s[SG];
				d[B] = s[SB];
			}
			else if (alpha != 0)
			{
 				/* d += muldiv255(a, 255 - d)*/
				d[A] += muldiv255(alpha, 255 - d[A]);

 				/* d += muldiv255(a, s - d)*/
				d[R] += muldiv255(alpha, s[SR] - d[R]);
				d[G] += muldiv255(alpha, s[SG] - d[G]);
				d[B] += muldiv255(alpha, s[SB] - d[B]);
			}
			d += DSZ;
			s += SSZ;
		}
		src += gc->src_pitch;
		dst += gc->dst_pitch;
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)
		psd->Update(psd, gc->dstx, gc->dsty, gc->width, gc->height);
}

#undef A
#undef R
#undef G
#undef B
#undef SR
#undef SG
#undef SB
#undef SA
#define SR	0
#define SG	1
#define SB	2
#define SA	3
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * Conversion blit copy 32bpp RGBA image to 32bpp BGRA image
 */
void convblit_copy_rgba8888_bgra8888(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)     + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;
	int height = gc->height;

	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = s[SA];
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			d += DSZ;
			s += SSZ;
		}
		src += gc->src_pitch;
		dst += gc->dst_pitch;
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)
		psd->Update(psd, gc->dstx, gc->dsty, gc->width, gc->height);
}

#if 0000
#undef A
#undef R
#undef G
#undef B
#undef SSZ
#undef DSZ
#undef SR
#undef SG
#undef SB
#undef SA
#define SB	0
#define SG	1
#define SR	2
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * Conversion blit copy 32bpp BGR image to 32bpp BGRA image
 */
void convblit_copy_bgr8888_bgra8888(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)     + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;
	int height = gc->height;

	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = 255;
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			d += DSZ;
			s += SSZ;
		}
		src += gc->src_pitch;
		dst += gc->dst_pitch;
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)
		psd->Update(psd, gc->dstx, gc->dsty, gc->width, gc->height);
}
#endif

#undef A
#undef R
#undef G
#undef B
#undef SSZ
#undef DSZ
#undef SR
#undef SG
#undef SB
#undef SA
#define SR	0
#define SG	1
#define SB	2
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	3
#define DSZ	4
/*
 * Conversion blit copy 24bpp RGB image to 32bpp BGRA image
 */
void convblit_copy_rgb888_bgra8888(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)     + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;
	int height = gc->height;

	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = 255;
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			d += DSZ;
			s += SSZ;
		}
		src += gc->src_pitch;
		dst += gc->dst_pitch;
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)
		psd->Update(psd, gc->dstx, gc->dsty, gc->width, gc->height);
}

#undef A
#undef R
#undef G
#undef B
#undef SSZ
#undef DSZ
#undef SR
#undef SG
#undef SB
#undef SA
#define SR	0
#define SG	1
#define SB	2
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	3
#define DSZ	4
/*
 * conversion blit copy and rotate left 24bpp RGB to 32bpp BGRA
 */
void convblit_copy_rgb888_bgra8888_left(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)  + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;
	int dst_pitch = gc->dst_pitch;

	/* change dst top left to lower left for left portrait*/
	/* rotate left: X -> Y, Y -> maxx - X - w*/
	int newx = gc->dsty;
	gc->dsty = psd->xvirtres - gc->dstx - 1;
	gc->dstx = newx;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = 255;
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			s += SSZ;				/* src: next pixel over*/
			d -= dst_pitch;			/* dst: next row up*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst += DSZ;					/* dst: next pixel right*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx, gc->dsty - gc->width + 1, gc->height, gc->width);
}

#undef A
#undef R
#undef G
#undef B
#undef SSZ
#undef DSZ
#undef SR
#undef SG
#undef SB
#undef SA
#define SR	0
#define SG	1
#define SB	2
#define SA	3
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * Conversion blit composite src_over and rotate left 32bpp RGBA image to 32bpp BGRA image
 */
void convblit_srcover_rgba8888_bgra8888_left(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)     + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;
	int dst_pitch = gc->dst_pitch;

	/* change dst top left to lower left for left portrait*/
	/* rotate left: X -> Y, Y -> maxx - X*/
	int newx = gc->dsty;
	gc->dsty = psd->xvirtres - gc->dstx - 1;
	gc->dstx = newx;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		unsigned int alpha;
		int w = gc->width;

		while (--w >= 0)
		{
			if ((alpha = s[SA]) == 255)
			{
				d[A] = s[SA];
				d[R] = s[SR];
				d[G] = s[SG];
				d[B] = s[SB];
			}
			else if (alpha != 0)
			{
 				/* d += muldiv255(a, 255 - d)*/
				d[A] += muldiv255(alpha, 255 - d[A]);

 				/* d += muldiv255(a, s - d)*/
				d[R] += muldiv255(alpha, s[SR] - d[R]);
				d[G] += muldiv255(alpha, s[SG] - d[G]);
				d[B] += muldiv255(alpha, s[SB] - d[B]);
			}
			s += SSZ;				/* src: next pixel over*/
			d -= dst_pitch;			/* dst: next row up*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst += DSZ;					/* dst: next pixel right*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx, gc->dsty - gc->width + 1, gc->height, gc->width);
}

#undef A
#undef R
#undef G
#undef B
#undef SSZ
#undef DSZ
#undef SR
#undef SG
#undef SB
#undef SA
#undef SSZ
#undef DSZ
#define SR	0
#define SG	1
#define SB	2
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	3
#define DSZ	4
/*
 * conversion blit copy and rotate right 24bpp RGB to 32bpp BGRA
 */
void convblit_copy_rgb888_bgra8888_right(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)  + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;
	int dst_pitch = gc->dst_pitch;

	/* change dst top left to upper right for right portrait*/
 	/* Rotate right: X -> maxy - y - h, Y -> X, W -> H, H -> W*/
	int newy = gc->dstx;
	gc->dstx = psd->yvirtres - gc->dsty - 1;
	gc->dsty = newy;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = 255;
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			s += SSZ;				/* src: next pixel over*/
			d += dst_pitch;			/* dst: next pixel down*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst -= DSZ;					/* dst: next pixel left*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx - gc->height + 1, gc->dsty, gc->height, gc->width);
}

#undef A
#undef R
#undef G
#undef B
#undef SR
#undef SG
#undef SB
#undef SA
#undef SSZ
#undef DSZ
#define SR	0
#define SG	1
#define SB	2
#define SA	3
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * conversion blit composite srcover and rotate right 32bpp RGBA to 32bpp BGRA
 */
void convblit_srcover_rgba8888_bgra8888_right(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)  + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;
	int dst_pitch = gc->dst_pitch;

	/* change dst top left to upper right for right portrait*/
 	/* Rotate right: X -> maxy - y - h, Y -> X, W -> H, H -> W*/
	int newy = gc->dstx;
	gc->dstx = psd->yvirtres - gc->dsty - 1;
	gc->dsty = newy;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		unsigned int alpha;
		int w = gc->width;

		while (--w >= 0)
		{
			if ((alpha = s[SA]) == 255)
			{
				d[A] = s[SA];
				d[R] = s[SR];
				d[G] = s[SG];
				d[B] = s[SB];
			}
			else if (alpha != 0)
			{
 				/* d += muldiv255(a, 255 - d)*/
				d[A] += muldiv255(alpha, 255 - d[A]);

 				/* d += muldiv255(a, s - d)*/
				d[R] += muldiv255(alpha, s[SR] - d[R]);
				d[G] += muldiv255(alpha, s[SG] - d[G]);
				d[B] += muldiv255(alpha, s[SB] - d[B]);
			}
			s += SSZ;					/* src: next pixel over*/
			d += dst_pitch;			/* dst: next pixel down*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst -= DSZ;					/* dst: next pixel left*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx - gc->height + 1, gc->dsty, gc->height, gc->width);
}

#undef A
#undef R
#undef G
#undef B
#undef SR
#undef SG
#undef SB
#undef SA
#undef SSZ
#undef DSZ
#define SR	0
#define SG	1
#define SB	2
#define SA	3
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	4
#define DSZ	4
/*
 * conversion blit composite srcover and rotate down 32bpp RGBA to 32bpp BGRA
 */
void convblit_srcover_rgba8888_bgra8888_down(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)  + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;

	/* change dst top left to lower right for down portrait*/
 	/* Rotate down: X -> maxx - x - w, Y -> maxy - y - h*/
	gc->dstx = psd->xvirtres - gc->dstx - 1;
	gc->dsty = psd->yvirtres - gc->dsty - 1;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		unsigned int alpha;
		int w = gc->width;

		while (--w >= 0)
		{
			if ((alpha = s[SA]) == 255)
			{
				d[A] = s[SA];
				d[R] = s[SR];
				d[G] = s[SG];
				d[B] = s[SB];
			}
			else if (alpha != 0)
			{
 				/* d += muldiv255(a, 255 - d)*/
				d[A] += muldiv255(alpha, 255 - d[A]);

 				/* d += muldiv255(a, s - d)*/
				d[R] += muldiv255(alpha, s[SR] - d[R]);
				d[G] += muldiv255(alpha, s[SG] - d[G]);
				d[B] += muldiv255(alpha, s[SB] - d[B]);
			}
			s += SSZ;					/* src: next pixel over*/
			d -= DSZ;					/* dst: next pixel left*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst -= gc->dst_pitch;		/* dst: next pixel up*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx - gc->width + 1, gc->dsty - gc->height + 1, gc->width, gc->height);
}

#undef A
#undef R
#undef G
#undef B
#undef SR
#undef SG
#undef SB
#undef SA
#undef SSZ
#undef DSZ
#define SR	0
#define SG	1
#define SB	2
#define B	0
#define G	1
#define R	2
#define A	3
#define SSZ	3
#define DSZ	4
/*
 * conversion blit copy and rotate down 24bpp RGB to 32bpp BGRA
 */
void convblit_copy_rgb888_bgra8888_down(PSD psd, PMWBLITPARMS gc)
{
	unsigned char *src = ((unsigned char *)gc->data)  + gc->srcy * gc->src_pitch + gc->srcx * SSZ;
	unsigned char *dst;
	int height;

	/* change dst top left to lower right for down portrait*/
 	/* Rotate down: X -> maxx - x - w, Y -> maxy - y - h*/
	gc->dstx = psd->xvirtres - gc->dstx - 1;
	gc->dsty = psd->yvirtres - gc->dsty - 1;
	dst = ((unsigned char *)gc->data_out) + gc->dsty * gc->dst_pitch + gc->dstx * DSZ;

	height = gc->height;
	while (--height >= 0)
	{
		register unsigned char *d = dst;
		register unsigned char *s = src;
		int w = gc->width;

		while (--w >= 0)
		{
			d[A] = 255;
			d[R] = s[SR];
			d[G] = s[SG];
			d[B] = s[SB];

			s += SSZ;				/* src: next pixel over*/
			d -= DSZ;				/* dst: next pixel left*/
		}
		src += gc->src_pitch;		/* src: next new line*/
		dst -= gc->dst_pitch;		/* dst: next pixel up*/
	}

	/* update screen bits if driver requires it*/
	if (psd->Update)				/* adjust x,y,w,h to physical top left and w/h*/
		psd->Update(psd, gc->dstx - gc->width + 1, gc->dsty - gc->height + 1, gc->width, gc->height);
}
