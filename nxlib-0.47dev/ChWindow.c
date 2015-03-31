//---------------------------------------------------------
//	©2009 Yuichiro Nakada
//---------------------------------------------------------

#include "nxlib.h"

int
XResizeWindow(Display *dpy, Window w, unsigned int width, unsigned int height)
{
	GrResizeWindow(w, width, height);
	return 1;
}

//#define AllMaskBits (CWX|CWY|CWWidth|CWHeight|\
//		     CWBorderWidth|CWSibling|CWStackMode)
int XConfigureWindow(Display *dpy, Window w, unsigned int mask, XWindowChanges *changes)
{
	GR_WINDOW_INFO wp;
	GrGetWindowInfo(w, &wp);

	printf("XConfigureWindow called...");
	//mask &= AllMaskBits;
	if (mask & (CWX|CWY)) {
		printf(" XY(%d,%d)", mask&CWX? changes->x: wp.x, mask&CWY? changes->y: wp.y);
		GrMoveWindow(w, mask&CWX? changes->x: wp.x, mask&CWY? changes->y: wp.y);
	}
	if (mask & (CWWidth|CWHeight)) {
		printf(" WH(%d,%d)", mask&CWWidth? changes->width: wp.width, mask&CWHeight? changes->height: wp.height);
		GrResizeWindow(w, mask&CWWidth? changes->width: wp.width, mask&CWHeight? changes->height: wp.height);
	}
	if (mask & CWBorderWidth) {
		printf(" BW(%d)", changes->border_width);
		XSetWindowBorderWidth(dpy, w, changes->border_width);
	}

	if (mask & CWSibling) {
		printf(" Sib(%d)", changes->sibling);
	}
	if (mask & CWStackMode) {
		printf(" Stc(%d)", changes->stack_mode);
	}
	printf("\n");

	return 1;
}
