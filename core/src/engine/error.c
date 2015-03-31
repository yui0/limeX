/*
 * Reconfigurable error handler.
 *
 * Note: There are two identical copies of this file.  One is nanox/error.c,
 * and is used by Nano-X client apps, the other is engine/error.c and is
 * used by everything else (including the Nano-X server and apps using the
 * Win32 API).  If you change one, you probably want to make the same changes
 * to the other copy.
 */

#include <stdarg.h>

#if (__ECOS)
#include <cyg/infra/diag.h>
#else
#include <stdio.h>
#include <string.h>
#if (UNIX | DOS_DJGPP)
#include <unistd.h>
#endif
#endif

#include "device.h"

#if MW_FEATURE_GDERROR
/**
 * Write error message to stderr stream.
 */
int
GdError(const char *format, ...)
{
	va_list args;
	va_start(args, format);
#if __ECOS
	/* diag_printf() has much less dependencies than write() */
	diag_printf(format, args);
#else
	{
		char 	buf[1024];
		vsprintf(buf, format, args);
		write(2, buf, strlen(buf));
	}
#endif

	va_end(args);
	return -1;
}

/**
 * Write error message to null device (discard).
 */
int
GdErrorNull(const char *format, ...)
{
	return -1;
}
#endif /* MW_FEATURE_GDERROR*/
