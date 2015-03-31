#define MWINCLUDECOLORS
#include "device.h"

extern void fb_graphicsflush(PSD psd);

int
main(int ac, char **av)
{
	PSD psd;
	PMWFONT font;

	// change image size before open if required
	//scrdev.xres = scrdev.xvirtres = 1024;
	//scrdev.yres = scrdev.yvirtres = 960;
	psd = GdOpenScreen();
	if (!psd)
		printf("Open Failed\n");

	/* fill screen to green*/
	GdSetForegroundColor(psd, GREEN);
	GdFillRect(psd, 0, 0, psd->xvirtres-1, psd->yvirtres-1);
	fb_graphicsflush(psd);

	/* text output*/
	GdSetForegroundColor(psd, WHITE);
	GdSetUseBackground(FALSE);
	font = GdCreateFont(psd, "../fonts/truetype/arial.ttf", 80, 60, NULL);
	GdSetFontAttr(font, MWTF_ANTIALIAS, 0);
	GdText(psd, font, 40, 80, "Microwindows Rules!", -1, MWTF_ASCII);

	/* change text size*/
	GdSetFontSize(font, 40, 30);
	GdText(psd, font, 140, 180, "Smaller Text", -1, MWTF_ASCII);

	GdDestroyFont(font);
	fb_graphicsflush(psd);

	/* draw lines*/
	GdSetForegroundColor(psd, RED);
	GdLine(psd, 20, 20, 30, 40, FALSE);
	GdSetForegroundColor(psd, BLUE);
	GdLine(psd, 21, 21, 31, 41, FALSE);
	fb_graphicsflush(psd);

	GdCloseScreen(psd);
	return 0;
}
