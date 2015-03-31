#include "nxlib.h"

int XDisplayHeight(Display *display, int screen_number)
{
//	printf("XDisplayHeight called\n");
//	return 480;

	GR_SCREEN_INFO sip;
	GrGetScreenInfo(&sip);
	printf("XDisplayHeight called [%d]\n", sip.vs_height);
	return sip.vs_height;
}

int XDisplayWidth(Display *display, int screen_number)
{
//	printf("XDisplayWidth called\n");
//	return 640;

	GR_SCREEN_INFO sip;
	GrGetScreenInfo(&sip);
	printf("XDisplayWidth called [%d]\n", sip.vs_width);
	return sip.vs_width;
}

// XListDepths - return info from connection setup
int *XListDepths(Display *dpy, int scrnum, int *countp)
{
	Screen *scr;
	int count;
	int *depths;

	printf("XListDepths called..\n");
	if (scrnum < 0 || scrnum >= dpy->nscreens) return NULL;

	scr = &dpy->screens[scrnum];
	if ((count = scr->ndepths) > 0) {
		Depth *dp;
		int i;

		depths = (int*) Xmalloc (count * sizeof(int));
		if (!depths) return NULL;
		for (i = 0, dp = scr->depths; i < count; i++, dp++)
		depths[i] = dp->depth;
	} else {
		/* a screen must have a depth */
		return NULL;
	}
	*countp = count;
	return depths;
}
