#include "nxlib.h"

int XSetInputFocus(Display *dpy, Window focus, int revert_to, Time time)
{
	GrSetFocus(focus);
	return 1;
}

int XGetInputFocus(Display *dpy, Window *focus, int *revert_to)
{
	*focus = GrGetFocus();
	printf("XGetInputFocus called [%d]\n", *focus);
	if (*focus == 1) *revert_to = RevertToPointerRoot;
	else if (*focus) *revert_to = RevertToParent;
	else *revert_to = RevertToNone;
	return 1;
}
