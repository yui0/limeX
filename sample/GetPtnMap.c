#include <stdio.h>
#include <X11/Xlib.h>

int main(void)
{
	Display *dpy;
	unsigned char map_ret[256];
	int nbut, n;

	if(!(dpy = XOpenDisplay(0))) {
		fprintf(stderr, "failed to connect to the X server\n");
		return 1;
	}

	nbut = XGetPointerMapping(dpy, map_ret, 256);
	printf("number of mouse buttons: %d\n", nbut);
	for (n=0; n<nbut; n++) printf("%x ", map_ret[n]);

	XCloseDisplay(dpy);
	return 0;
}
