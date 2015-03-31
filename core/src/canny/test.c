#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "nxcolors.h"
#include "nano-X.h"
/*
 * C++ linkage - Canny Edge Detector demo
 *
 * 1/8/2011 ghaerr
 */

//#define IMAGE	 "../mwin/bmp/baby.jpg"
#define IMAGE	 "../mwin/bmp/dragon.bmp"

GR_WINDOW_ID wid = 0, p1, p2 = 0;
GR_IMAGE_INFO image_info;
GR_SCREEN_INFO sinfo;
GR_WINDOW_INFO winfo;

PMWIMAGEHDR CannyEdgeDetect(PMWIMAGEHDR pimage);

void resize_demo(void);
void init_demo(void);
void redraw_demo(void);

void
resize_demo(void)
{
	int width, height;
	GR_GC_ID gc;
	GR_IMAGE_ID iid;

	GrGetScreenInfo(&sinfo);

	/* load image from file into RGBA format*/
	if(!(iid = GrLoadImageFromFile(IMAGE, 0))) {
		fprintf(stderr, "Failed to load image file \"%s\"\n", IMAGE);
		return;
	}
	GrGetImageInfo(iid, &image_info);

	if (wid) {
		GrGetWindowInfo(wid, &winfo);
		width = winfo.width;
		height = winfo.height;
	} else {
		width = image_info.width;
		height = image_info.height;
	}
	/* create 32bpp pixmap and draw image w/alpha on it*/
	p1 = GrNewPixmapEx(width, height, MWIF_RGBA8888, NULL);
	gc = GrNewGC();
	GrDrawImageToFit(p1, gc, 0, 0, width, height, iid);
	GrDestroyGC(gc);
	GrFreeImage(iid);
}

void
init_demo(void)
{
	int x, y, flags;

	/* create window for display with no background erase to stop blink*/
	x = sinfo.cols - image_info.width*4;
	y = sinfo.rows - image_info.height*4;
x = y = 20;
	flags = GR_WM_PROPS_APPWINDOW | GR_WM_PROPS_NOBACKGROUND;
	flags |= GR_WM_PROPS_BUFFERED;
	wid = GrNewWindowEx(flags, "Microwindows Image Demo", GR_ROOT_WINDOW_ID,
		x, y, image_info.width, image_info.height, GR_COLOR_WHITE);
 
	GrSelectEvents(wid, GR_EVENT_MASK_CLOSE_REQ | GR_EVENT_MASK_UPDATE | GR_EVENT_MASK_EXPOSURE);
}

PMWIMAGEHDR
getimage(GR_WINDOW_ID wid)
{
	MWIMAGEINFO info;
	GR_PIXELVAL *buf, *out;
	static MWIMAGEHDR image;
	
	GrGetImageInfo(wid, &info);

	if (image.imagebits)
		free(image.imagebits);
	image.flags = 0x40;
	image.width = info.width;
	image.height = info.height;
	image.planes = info.planes;
	image.bpp = info.bpp;
	image.data_format = info.data_format;
	image.pitch = info.pitch;
	image.palsize = 0;
	image.palette = NULL;
	image.transcolor = MWNOCOLOR;
	image.imagebits = (MWUCHAR *)malloc(info.width * info.height * 4);
	GrReadArea(wid, 0, 0, info.width, info.height, (GR_PIXELVAL *)image.imagebits);

	return &image;
}

void
redraw_demo(void)
{
	PMWIMAGEHDR imagep1, imagenew;
	GR_GC_ID gc = GrNewGC();

	GrGetWindowInfo(wid, &winfo);

#if 1
	imagep1 = getimage(p1);
	imagenew = CannyEdgeDetect(imagep1);
	GrDrawImageBits(wid, gc, 0, 0, imagenew);
	free(imagenew->imagebits);
	free(imagenew);
#else
	GrCopyArea(wid, gc, 0, 0, winfo.width, winfo.height, p1, 0, 0, MWROP_COPY);
#endif
	GrDestroyGC(gc);

	GrFlushWindow(wid);
}

int
main(void)
{
	int quit = 0;

	if (GrOpen() < 0) {
		fprintf(stderr, "Couldn't connect to Nano-X server\n");
		return 1;
	}

	/* create pixmap with background image*/
	resize_demo();				/* create contents*/
	init_demo();				/* create window*/
	redraw_demo();				/* prevent any initial blink*/
	GrMapWindow(wid);

	while (!quit) {
		GR_EVENT event;
		GrGetNextEvent(&event);

		switch (event.type) {
		case GR_EVENT_TYPE_CLOSE_REQ:
			quit = 1;
			break;

		case GR_EVENT_TYPE_UPDATE:
			switch (event.update.utype) {
			case GR_UPDATE_MAP:			/* initial paint*/
			case GR_UPDATE_SIZE:		/* resize repaint*/
				resize_demo();
				redraw_demo();
			}
			break;
		case GR_EVENT_TYPE_EXPOSURE:
			redraw_demo();
			break;
		}
	}

	GrClose();
	return 0;
}
