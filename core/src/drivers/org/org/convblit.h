/*
 * Conversion blits - public header file
 */


/* convblit_8888.c*/
void convblit_srcover_rgba8888_bgra8888(PSD psd, PMWBLITPARMS gc);	// png/tiff 32bpp RGBA srcover
void convblit_srcover_rgba8888_bgra8888_left(PSD psd, PMWBLITPARMS gc);
void convblit_srcover_rgba8888_bgra8888_right(PSD psd, PMWBLITPARMS gc);
void convblit_srcover_rgba8888_bgra8888_down(PSD psd, PMWBLITPARMS gc);

void convblit_copy_rgb888_bgra8888(PSD psd, PMWBLITPARMS gc);		// png/jpg 24bpp RGB copy
void convblit_copy_rgb888_bgra8888_left(PSD psd, PMWBLITPARMS gc);
void convblit_copy_rgb888_bgra8888_right(PSD psd, PMWBLITPARMS gc);
void convblit_copy_rgb888_bgra8888_down(PSD psd, PMWBLITPARMS gc);

void convblit_copy_rgba8888_bgra8888(PSD psd, PMWBLITPARMS gc);	// 32bpp RGBA copy

/* convblit_888.c*/
void convblit_srcover_rgba8888_bgr888(PSD psd, PMWBLITPARMS gc);
void convblit_srcover_rgba8888_bgr888_left(PSD psd, PMWBLITPARMS gc);
void convblit_srcover_rgba8888_bgr888_right(PSD psd, PMWBLITPARMS gc);
void convblit_srcover_rgba8888_bgr888_down(PSD psd, PMWBLITPARMS gc);

void convblit_copy_rgb888_bgr888(PSD psd, PMWBLITPARMS gc);
void convblit_copy_rgb888_bgr888_left(PSD psd, PMWBLITPARMS gc);
void convblit_copy_rgb888_bgr888_right(PSD psd, PMWBLITPARMS gc);
void convblit_copy_rgb888_bgr888_down(PSD psd, PMWBLITPARMS gc);

void convblit_copy_rgba8888_bgr888(PSD psd, PMWBLITPARMS gc);

/* convblit_mask.c*/
/* 1bpp and 8bpp (alphablend) mask conversion blits - for font display*/
void convblit_copy_mask_mono_byte_msb_bgra(PSD psd, PMWBLITPARMS gc);		/* ft2 non-alias*/
void convblit_copy_mask_mono_byte_lsb_bgra(PSD psd, PMWBLITPARMS gc);		/* t1lib non-alias*/
void convblit_copy_mask_mono_word_msb_bgra(PSD psd, PMWBLITPARMS gc);		/* pcf non-alias*/
void convblit_blend_mask_alpha_byte_bgra(PSD psd, PMWBLITPARMS gc);			/* ft2/t1lib alias*/

void convblit_copy_mask_mono_byte_msb_bgra_large(PSD psd, PMWBLITPARMS gc);	/* ft2 non-alias replacement*/
void convblit_copy_mask_mono_byte_lsb_bgra_large(PSD psd, PMWBLITPARMS gc);	/* t1lib non-alias replacement*/

//void	(*BlitMaskMonoByteMSB)(PMWBLITPARMS parms);				/* ft non-alias*/
//void	(*BlitMaskMonoByteLSB)(PMWBLITPARMS parms);				/* t1 non-alias*/
//void	(*BlitMaskMonoWordMSB)(PMWBLITPARMS parms);				/* core/pcf non-alias*/
//void	(*BlitMaskAlphaByte)(PMWBLITPARMS parms);				/* ft2/t1 antialias*/
//void	(*BlitRGBA)(PMWBLITPARMS parms);				/* png RGBA image w/alpha*/
//void	(*BlitRGB)(PMWBLITPARMS parms);					/* png RGB image no alpha*/
//void	(*BlitBGRA)(PMWBLITPARMS parms);				/* 32bpp hw framebuffer*/
//void	(*BlitBGR)(PMWBLITPARMS parms);					/* 24bpp hw framebuffer*/
