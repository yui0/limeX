#include "nxlib.h"

// required for libXrender.so
unsigned long XNextRequest(Display *display)
{
	printf("XNextRequest called...\n");
	return ++display->request;
}

// required for gdk
long XExtendedMaxRequestSize(Display *display)
{
	printf("XExtendedMaxRequestSize called...\n");
	return 0;
}
