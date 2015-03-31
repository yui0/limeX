#include "nxlib.h"

// required for openoffice.org
Status XInitThreads()
{
	printf("XInitThreads called...");
	return 1;
}

// for xine
void XLockDisplay(Display *display)
{
	LockDisplay(display);
}

void XUnlockDisplay(Display *display)
{
	UnlockDisplay(display);
}