#include "nxlib.h"

Status
XGetGeometry(Display *dpy, Drawable d, Window *root, int *x, int *y,
	unsigned int *width, unsigned int *height, unsigned int *borderWidth,
	unsigned int *depth)
{
	GR_WINDOW_INFO info;
	GR_SCREEN_INFO sinfo;

	GrGetWindowInfo(d, &info);
	GrGetScreenInfo(&sinfo);

	*root = GR_ROOT_WINDOW_ID;
	*x = info.x;
	*y = info.y;
	*width = info.width;
	*height = info.height;
	*borderWidth = info.bordersize;
	*depth = sinfo.bpp;

	return 1;
}

#include "Xutil.h"
int XWMGeometry(Display *d, int s,
	_Xconst char* user_geom, _Xconst char* default_geom,
	unsigned int border_width, XSizeHints* hints,
	int *x, int *y, int *width, int *height, int *gravity)
{
	sscanf(user_geom, "%dx%d", width, height);
	//hints->width = hints->min_width = hints->max_width = /*base_width =*/ *width;
	//hints->height = hints->min_height = hints->max_height = /*base_height =*/ *height;
	//*x = *y = 0;
	printf("XWMGeometry called [%s, %dx%d]\n", user_geom, *width, *height);
	return WidthValue|HeightValue;
}
