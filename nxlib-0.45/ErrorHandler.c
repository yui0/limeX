#include "nxlib.h"

static XIOErrorHandler _errorfunc = 0;

//static XErrorHandler _XErrorFunction = 0;
//long _libX__XErrorFunctionFlag = 0;
//void *_libX__XErrorFunctionPtr = 0;
// from Xlibinit.h
int (*_XErrorFunction)(Display*, XErrorEvent*) = 0;

void
_nxErrorHandler(GR_EVENT * event)
{
	/* Fixme:  Determine and send the display value here */
	printf("XIOErrorHandler called\n");
	if (_errorfunc)
		_errorfunc(0);

	/* Fixme:  Do some default stuff here? */
}

XIOErrorHandler
XSetIOErrorHandler(XIOErrorHandler handle)
{
	XIOErrorHandler prev = _errorfunc;

	GrSetErrorHandler(_nxErrorHandler);
	_errorfunc = handle;
	return prev;
}

//int XSetErrorHandler( int (*handler)(Display*, XErrorEvent*) )
XErrorHandler XSetErrorHandler(XErrorHandler handler)
{
//	XErrorHandler old = _XErrorFunction;
	printf("XSetErrorHandler called [%x]\n", (unsigned int)handler);
	_XErrorFunction = handler;
//	return old;
	return 0;
}
