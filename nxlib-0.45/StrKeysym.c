#include "nxlib.h"
#include <string.h>
#include "keysym.h"
#include "Xutil.h"
#include "keysymstr.h"

#if 0
/* Standard keymapings for kernel values */
/* (from microwin/src/drivers/keymap_standard.h)*/
/* this table should be retrieved through Microwindows*/
static MWKEY mwscan_to_mwkey[128] = {
MWKEY_UNKNOWN, MWKEY_ESCAPE, '1', '2', '3',				/* 0*/
'4', '5', '6', '7', '8',						/* 5*/
'9', '0', '-', '=', MWKEY_BACKSPACE,					/* 10*/
MWKEY_TAB, 'q', 'w', 'e', 'r',						/* 15*/
't', 'y', 'u', 'i', 'o',						/* 20*/
'p', '[', ']', MWKEY_ENTER, MWKEY_LCTRL,				/* 25*/
'a', 's', 'd', 'f', 'g',						/* 30*/
'h', 'j', 'k', 'l', ';',						/* 35*/
'\'', '`', MWKEY_LSHIFT, '\\', 'z',					/* 40*/
'x', 'c', 'v', 'b', 'n',						/* 45*/
'm', ',', '.', '/', MWKEY_RSHIFT,					/* 50*/
MWKEY_KP_MULTIPLY, MWKEY_LALT, ' ', MWKEY_CAPSLOCK, MWKEY_F1, 		/* 55*/
MWKEY_F2, MWKEY_F3, MWKEY_F4, MWKEY_F5, MWKEY_F6, 			/* 60*/
MWKEY_F7, MWKEY_F8, MWKEY_F9, MWKEY_F10, MWKEY_NUMLOCK, 		/* 65*/
MWKEY_SCROLLOCK, MWKEY_KP7, MWKEY_KP8, MWKEY_KP9, MWKEY_KP_MINUS,	/* 70*/
MWKEY_KP4, MWKEY_KP5, MWKEY_KP6, MWKEY_KP_PLUS, MWKEY_KP1, 		/* 75*/
MWKEY_KP2, MWKEY_KP3, MWKEY_KP0, MWKEY_KP_PERIOD, MWKEY_UNKNOWN, 	/* 80*/
MWKEY_UNKNOWN, MWKEY_UNKNOWN, MWKEY_F11, MWKEY_F12, MWKEY_UNKNOWN,	/* 85*/
MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,	/* 90*/
MWKEY_UNKNOWN, MWKEY_KP_ENTER, MWKEY_RCTRL, MWKEY_KP_DIVIDE,MWKEY_PRINT,/* 95*/
MWKEY_RALT, MWKEY_BREAK, MWKEY_HOME, MWKEY_UP, MWKEY_PAGEUP,		/* 100*/
MWKEY_LEFT, MWKEY_RIGHT, MWKEY_END, MWKEY_DOWN, MWKEY_PAGEDOWN,		/* 105*/
MWKEY_INSERT, MWKEY_DELETE, MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,	/* 110*/
MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_PAUSE,	/* 115*/
MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,MWKEY_UNKNOWN,	/* 120*/
MWKEY_LMETA, MWKEY_RMETA, MWKEY_MENU					/* 125*/
};

#else
/*
 * Microwindows ttyscan.c compatible scancode conversion
 * table.  Note this is NOT the same as the Linux kernel
 * table due to the HACK XXX in ttyscan.c after getting
 * the kernel scancode.  FIXME
 */
#define UNKNOWN	0
static MWKEY mwscan_to_mwkey[128] = {
	UNKNOWN,	/*  0*/
	UNKNOWN,	/*  1*/
	UNKNOWN,	/*  2*/
	UNKNOWN,	/*  3*/
	UNKNOWN,	/*  4*/
	UNKNOWN,	/*  5*/
	UNKNOWN,	/*  6*/
	UNKNOWN,	/*  7*/
	UNKNOWN,	/*  8*/
	MWKEY_ESCAPE,	/*  9*/
	'1',		/* 10*/
	'2',		/* 11*/
	'3',		/* 12*/
	'4',		/* 13*/
	'5',		/* 14*/
	'6',		/* 15*/
	'7',		/* 16*/
	'8',		/* 17*/
	'9',		/* 18*/
	'0',		/* 19*/
	'-',		/* 20*/
	UNKNOWN,	/* 21*/
	MWKEY_BACKSPACE,/* 22*/
	MWKEY_TAB,	/* 23*/
	'q',		/* 24*/
	'w',		/* 25*/
	'e',		/* 26*/
	'r',		/* 27*/
	't',		/* 28*/
	'y',		/* 29*/
	'u',		/* 30*/
	'i',		/* 31*/
	'o',		/* 32*/
	'p',		/* 33*/
	'[',		/* 34*/
	']',		/* 35*/
	MWKEY_ENTER,	/* 36*/
	MWKEY_LCTRL,	/* 37*/
	'a',		/* 38*/
	's',		/* 39*/
	'd',		/* 40*/
	'f',		/* 41*/
	'g',		/* 42*/
	'h',		/* 43*/
	'j',		/* 44*/
	'k',		/* 45*/
	'l',		/* 46*/
	';',		/* 47*/
	'\'',		/* 48*/
	'`',		/* 49*/
	MWKEY_LSHIFT,	/* 50*/
	'\\',		/* 51*/
	'z',		/* 52*/
	'x',		/* 53*/
	'c',		/* 54*/
	'v',		/* 55*/
	'b',		/* 56*/
	'n',		/* 57*/
	'm',		/* 58*/
	',',		/* 59*/
	'.',		/* 60*/
	'/',		/* 61*/
	MWKEY_RSHIFT,	/* 62*/
	MWKEY_KP_MULTIPLY,/* 63*/
	MWKEY_LALT,	/* 64*/
	' ',		/* 65*/
	UNKNOWN,	/* 66*/
	MWKEY_F1,	/* 67*/
	MWKEY_F2,	/* 68*/
	MWKEY_F3,	/* 69*/
	MWKEY_F4,	/* 70*/
	MWKEY_F5,	/* 71*/
	MWKEY_F6,	/* 72*/
	MWKEY_F7,	/* 73*/
	MWKEY_F8,	/* 74*/
	MWKEY_F9,	/* 75*/
	MWKEY_F10,	/* 76*/
	UNKNOWN,	/* 77*/
	UNKNOWN,	/* 78*/
	MWKEY_KP7,	/* 79*/
	MWKEY_KP8,	/* 80*/
	MWKEY_KP9,	/* 81*/
	MWKEY_KP_MINUS,	/* 82*/
	MWKEY_KP4,	/* 83*/
	MWKEY_KP5,	/* 84*/
	MWKEY_KP6,	/* 85*/
	MWKEY_KP_PLUS,	/* 86*/
	MWKEY_KP1,	/* 87*/
	MWKEY_KP2,	/* 88*/
	MWKEY_KP3,	/* 89*/
	MWKEY_KP0,	/* 90*/
	MWKEY_KP_PERIOD,/* 91*/
	UNKNOWN,	/* 92*/
	UNKNOWN,	/* 93*/
	UNKNOWN,	/* 94*/
	MWKEY_F11,	/* 95*/
	MWKEY_F12,	/* 96*/
	MWKEY_HOME,	/* 97*/
	MWKEY_UP,	/* 98*/
	MWKEY_PAGEUP,	/* 99*/
	MWKEY_LEFT,	/*100*/
	UNKNOWN,	/*101*/
	MWKEY_RIGHT,	/*102*/
	MWKEY_END,	/*103*/
	MWKEY_DOWN,	/*104*/
	MWKEY_PAGEDOWN,	/*105*/
	MWKEY_INSERT,	/*106*/
	MWKEY_DELETE,	/*107*/
	MWKEY_KP_ENTER,	/*108*/
	MWKEY_RCTRL,	/*109*/
	UNKNOWN,	/*110*/
	MWKEY_PRINT,	/*111*/
	MWKEY_KP_DIVIDE, /*112*/
	MWKEY_RALT,	/*113*/
	UNKNOWN,	/*114*/
	UNKNOWN,	/*115*/
	UNKNOWN,	/*116*/
	UNKNOWN,	/*117*/
	UNKNOWN,	/*118*/
	UNKNOWN,	/*119*/
	UNKNOWN,	/*120*/
	UNKNOWN,	/*121*/
	UNKNOWN,	/*122*/
	UNKNOWN,	/*123*/
	UNKNOWN,	/*124*/
	UNKNOWN,	/*125*/
	UNKNOWN,	/*126*/
	UNKNOWN		/*127*/
};
#endif

static struct {
	GR_KEY nxKey;
	KeySym xKey;
} mwkey_to_xkey[] = {
	{MWKEY_RIGHT, XK_Right},
	{MWKEY_LEFT, XK_Left},
	{MWKEY_UP, XK_Up},
	{MWKEY_DOWN, XK_Down},
	{MWKEY_PAGEDOWN, XK_Page_Down},
	{MWKEY_PAGEUP, XK_Page_Up},
	{MWKEY_INSERT, XK_Insert},
	{MWKEY_DELETE, XK_Delete},
	{MWKEY_HOME, XK_Home},
	{MWKEY_END, XK_End},
	{MWKEY_TAB, XK_Tab},
	{MWKEY_BACKSPACE, XK_BackSpace},
	{MWKEY_ENTER, XK_Return},
	{MWKEY_ESCAPE, XK_Escape},
	{MWKEY_LCTRL, XK_Control_L},
	{MWKEY_RCTRL, XK_Control_R},
	{MWKEY_LSHIFT, XK_Shift_L},
	{MWKEY_RSHIFT, XK_Shift_R},
	{MWKEY_LALT, XK_Alt_L},
	{MWKEY_RALT, XK_Alt_R},
	{MWKEY_LMETA, XK_Meta_L},
	{MWKEY_RMETA, XK_Meta_R},
	{MWKEY_PAUSE, XK_Pause},
	{MWKEY_PRINT, XK_Print},
	{MWKEY_SYSREQ, XK_Sys_Req},
	{MWKEY_BREAK, XK_Break},
	{MWKEY_NUMLOCK, XK_Num_Lock},
	{MWKEY_CAPSLOCK, XK_Caps_Lock},
	{MWKEY_SCROLLOCK, XK_Scroll_Lock},
	{MWKEY_F1, XK_F1},
	{MWKEY_F2, XK_F2},
	{MWKEY_F3, XK_F3},
	{MWKEY_F4, XK_F4},
	{MWKEY_F5, XK_F5},
	{MWKEY_F6, XK_F6},
	{MWKEY_F7, XK_F7},
	{MWKEY_F8, XK_F8},
	{MWKEY_F9, XK_F9},
	{MWKEY_F10, XK_F10},
	{MWKEY_F11, XK_F11},
	{MWKEY_F12, XK_F12},
	{MWKEY_KP1, XK_KP_End},
	{MWKEY_KP2, XK_KP_Down},
	{MWKEY_KP3, XK_KP_Page_Down},
	{MWKEY_KP4, XK_KP_Left},
	{MWKEY_KP5, XK_KP_Home},
	{MWKEY_KP6, XK_KP_Right},
	{MWKEY_KP7, XK_KP_Home},
	{MWKEY_KP8, XK_KP_Up},
	{MWKEY_KP9, XK_KP_Page_Up},
	{MWKEY_KP0, XK_KP_Insert},
	{MWKEY_KP_PERIOD, XK_KP_Delete},
	{MWKEY_KP_ENTER, XK_KP_Enter},
	{MWKEY_KP_DIVIDE, XK_KP_Divide},
	{MWKEY_KP_MULTIPLY, XK_KP_Multiply},
	{MWKEY_KP_MINUS, XK_KP_Subtract},
	{MWKEY_KP_PLUS, XK_KP_Add},
	{MWKEY_MENU, XK_Menu},
	{0xffff, 0xffff}
};


/* translate keycode to KeySym, no control/shift processing*/
KeySym XKeycodeToKeysym(Display *dpy, unsigned int kc, int index)
{
	int	i;
	MWKEY	mwkey;

	printf("XKeycodeToKeysym called [key:%x]\n", kc);
	if (kc > 127) return NoSymbol;

	/* first convert scancode to mwkey*/
	mwkey = mwscan_to_mwkey[kc];
	//printf("-> [%x]\n", mwkey);

	/* then possibly convert mwkey to X KeySym*/
	for (i=0; mwkey_to_xkey[i].nxKey != 0xffff; i++) {
		if (mwkey == mwkey_to_xkey[i].nxKey)
			return mwkey_to_xkey[i].xKey;
	}

	/* assume X KeySym is same as MWKEY value*/
	return mwkey;
}

/* translate event->keycode into KeySym, no control/shift processing*/
KeySym XLookupKeysym(XKeyEvent *event, int index)
{
	return XKeycodeToKeysym(event->display, event->keycode, index);
}

/* translate event->keycode into *keysym, control/shift processing*/
int XLookupString(XKeyEvent *event, char *buffer, int nbytes, KeySym *keysym,
	XComposeStatus *status)
{
	KeySym k;

	k = XLookupKeysym(event, 0);
	//if (event->keycode > 127) k = NoSymbol;
	//k = mwscan_to_mwkey[event->keycode];

	/* translate Control/Shift*/
	if ((event->state & ControlMask) && k < 256)
		// for Ctrl-key
		k &= 0x1f;
	else if (event->state & ShiftMask) {
		// for Shift-key
		if (k >= 'a' && k <= 'z')
			k = k-'a'+'A';
		else switch (k) {
		case '`': k = '~'; break;
		case '1': k = '!'; break;
		case '2': k = '@'; break;
		case '3': k = '#'; break;
		case '4': k = '$'; break;
		case '5': k = '%'; break;
		case '6': k = '^'; break;
		case '7': k = '&'; break;
		case '8': k = '*'; break;
		case '9': k = '('; break;
		case '0': k = ')'; break;
		case '-': k = '_'; break;
		case '=': k = '+'; break;
		case '\\': k = '|'; break;
		case '[': k = '{'; break;
		case ']': k = '}'; break;
		case ';': k = ':'; break;
		case '\'': k = '"'; break;
		case ',': k = '<'; break;
		case '.': k = '>'; break;
		case '/': k = '?'; break;
		}
	/*} else if (!(k >= 0x20 && k <= 0x7e)) {
		switch (k) {
		case MWKEY_BACKSPACE:	k = 8; break;
		case MWKEY_TAB:		k = 9; break;
		case MWKEY_ENTER:	k = 0xd; break;
		case MWKEY_ESCAPE:	k = 0x1b; break;
		case MWKEY_DELETE:	k = 0x7f; break;
		//default:		k = 0;
		}*/
		/*if (keysym) *keysym = k;
		if (nbytes > 0) buffer[0] = '\0';
		return 0;*/
	}

	if (keysym) *keysym = k;
//	if (nbytes > 0) buffer[0] = '\0';
//	return 0;
	if (nbytes > 0/* && k*/ /*&& (k >= 0x20 && k <= 0x7e)*/) {
//		*status = XLookupBoth;
		if (k >= 0x20 && k <= 0xff) {
			buffer[0] = k;
			//buffer[1] = 0;
		} else {
			switch (k) {
			case XK_BackSpace:	buffer[0] = 8; break;
			case XK_Tab:		buffer[0] = 9; break;
			case XK_KP_Enter:
			case XK_Return:		buffer[0] = 0xd; break;
			case XK_Escape:		buffer[0] = 0x1b; break;
			case XK_Delete:		buffer[0] = 0x7f; break;
			case XK_KP_End:		buffer[0] = '1'; break;
			case XK_KP_Down:	buffer[0] = '2'; break;
			case XK_KP_Page_Down:	buffer[0] = '3'; break;
			case XK_KP_Left:	buffer[0] = '4'; break;
			//case XK_KP_Home:	buffer[0] = '5'; break;
			case XK_KP_Right:	buffer[0] = '6'; break;
			case XK_KP_Home:	buffer[0] = '7'; break;
			case XK_KP_Up:		buffer[0] = '8'; break;
			case XK_KP_Page_Up:	buffer[0] = '9'; break;
			case XK_KP_Insert:	buffer[0] = '0'; break;
			case XK_KP_Delete:	buffer[0] = '.'; break;
			case XK_KP_Add:		buffer[0] = '+'; break;
			case XK_KP_Subtract:	buffer[0] = '-'; break;
			case XK_KP_Divide:	buffer[0] = '/'; break;
			case XK_KP_Multiply:	buffer[0] = '*'; break;
			default:		buffer[0] = 0; return 0;
			}
		}
		printf("XLookupString [%x]\n", buffer[0]);
		return 1;
	}
	return 0;
}

/* Freeking ugly! */
KeySym XStringToKeysym(_Xconst char *string)
{
	int i;

	printf("XStringToKeysym called [%s]\n", string);
	for (i=0; i < NX_KEYSYMSTR_COUNT; i++)
		if (strcmp(nxKeyStrings[i].str, string) == 0)
			return nxKeyStrings[i].keysym;

	return NoSymbol;
}

char *XKeysymToString(KeySym ks)
{
	int i;

	printf("XKeysymToString called [%x]\n", (int)ks);
	for (i=0; i < NX_KEYSYMSTR_COUNT; i++)
		if (nxKeyStrings[i].keysym == ks) return nxKeyStrings[i].str;

	return NULL;
}

/* translate KeySym to KeyCode*/
KeyCode XKeysymToKeycode(Display *dpy, KeySym ks)
{
	int i;
	printf("XKeysymToKeycode called [%x]\n", (int)ks);
	for (i=0; i<128; ++i) if (mwscan_to_mwkey[i] == ks) return i;
	return NoSymbol;
}

/* Translate the keysym to upper case and lower case */
void XConvertCase(KeySym in, KeySym *upper, KeySym *lower)
{
	if (in & MWKEY_NONASCII_MASK)
		*upper = *lower = in;
	else {
		*upper = (in >= 'a' && in <= 'z')? in-'a'+'A': in;
		*lower = (in >= 'A' && in <= 'A')? in-'A'+'a': in;
	}
	printf("XConvertCase called [%x, u:%x, l:%x]\n", (int)in, (int)*upper, (int)*lower);
}
