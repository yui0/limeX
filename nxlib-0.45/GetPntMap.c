#include "nxlib.h"
#include <string.h>

// required for opera
int XGetPointerMapping(Display *dpy, unsigned char *map, int nmap)
{
	printf("XGetPointerMapping called..\n");
	if (!map) return 0;
	strcpy((char*)map, "123456789");
	return 9;
	//return NULL;
}

// required for gvim
int XDisplayKeycodes(Display *dpy,
	int *min_keycode_return, int *max_keycode_return)
{
	// look up StrKeysym.c
	*min_keycode_return = /*dpy->min_keycode*/9;
	*max_keycode_return = /*dpy->max_keycode*/113;
	return 1;
}

KeySym *XGetKeyboardMapping(Display *dpy, /*KeyCode*/unsigned int first_keycode,
	int count, int *keysyms_per_keycode)
{
	int kc = first_keycode;
	KeySym *p, *ks = Xcalloc(1, count);
	if (!ks) return 0;

	//printf("XGetKeyboardMapping called [%x,c:%d]", kc, count);
	printf("XGetKeyboardMapping called [%x,c:%d]\n", kc, count);
	p = ks;
	//*keysyms_per_keycode = 0;
	for (; count>0; count--) {
		*p = XKeycodeToKeysym(dpy, kc, 0);
		p++;
		/*printf(" %0x >", kc);
		if ((*p = XKeycodeToKeysym(dpy, kc, 0))) {
			printf(" %0x", *p);
			*(keysyms_per_keycode)++, p++;
		}*/
		kc++;
	}
	/*printf(" [c:%d]\n", *keysyms_per_keycode);
	if (!(*keysyms_per_keycode)) return 0;*/
	*keysyms_per_keycode = 2;

	return ks;
}

XModifierKeymap *XGetModifierMapping(Display *display)
{
	XModifierKeymap *modmap;
	printf("XGetModifierMapping called..\n");

	modmap = (XModifierKeymap *)Xcalloc(1, sizeof(XModifierKeymap));
	modmap->max_keypermod = 0;
	modmap->modifiermap = NULL;
	//modmap->modifiermap = (KeyCode*)Xmalloc(1);
	return modmap;
}

int XFreeModifiermap(XModifierKeymap *map)
{
	printf("XFreeModifiermap called..\n");
	if (map) {
		if (map->modifiermap) Xfree((char *) map->modifiermap);
		Xfree((char *) map);
	}
	return 1;
}
