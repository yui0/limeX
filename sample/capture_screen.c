/**
* gcc capture_screen_x11-01.c -L/usr/X11/lib -lX11
* gcc capture_screen.c -L/usr/X11/lib -lX11
**/

#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <X11/Xlib.h>

#define IMAGE_FILE_PATH "capture_screen.ppm"

static
void writeXImageToP3File(XImage *image, const char *file_path)
{
	FILE *file;

	file = fopen(file_path, "wb");
	if (file != NULL)
	{
		int x, y;
		char *cp;
		uint32_t pixel;

		fprintf(file, "P3\n");
		fprintf(file, "%d %d\n", image->width, image->height);
		fprintf(file, "255\n");
		for (y = 0;y < image->height;y++)
		{
			cp = image->data + y * image->bytes_per_line;
			for (x = 0;x < image->width;x++)
			{
				pixel = *(uint32_t *)cp;
				fprintf(file, "%d %d %d ",
					(pixel & 0x00ff0000) >> 16,
					(pixel & 0x0000ff00) >> 8,
					(pixel & 0x000000ff) >> 0);
				cp += 4;
			}
			fprintf(file, "\n");
		}
		fclose(file);
	}
}

int main(int argc, char* argv[])
{
	Display* display;
	int screen;
	Window rootWindow;
	XWindowAttributes attributes;
	int width, height;
	XImage *image;

	display = XOpenDisplay("");
	screen = DefaultScreen(display);
	rootWindow = RootWindow(display, screen);

	XGetWindowAttributes(display, rootWindow, &attributes);
	width = attributes.width;
	height = attributes.height;

	image = XGetImage(display, rootWindow,
		0, 0, attributes.width, attributes.height,
		AllPlanes, ZPixmap);

	if (image != NULL)
	{
		if (image->bits_per_pixel == 32)
			writeXImageToP3File(image, IMAGE_FILE_PATH);
		else
			fprintf(stderr, "Not Supported format : bits_per_pixel = %d\n", image->bits_per_pixel);
		XFree(image);
	}

	XCloseDisplay(display);
	return 0;
}
