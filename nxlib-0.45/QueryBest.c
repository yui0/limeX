#include "nxlib.h"

Status XQueryBestSize(Display *dpy, int class, Drawable which_screen, unsigned int  width, unsigned int height, unsigned int *w, unsigned int *h)
{
	printf("XQueryBestSize called\n");
	*w = width;
	*h = height;
	return 1;
}
