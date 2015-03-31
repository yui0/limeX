#include <stdio.h>
#include <X11/Xlib.h>

int
main(int argc,char *argv[])
{
 int i, j;
 char keys_return[32];
 Display *display = XOpenDisplay(NULL);
 if (!display) {
  fprintf(stderr,"Cannot open display\n");
  return 1;
 }

 XQueryKeymap(display, keys_return);
 for (i = 0; i < 32; i++) {
  for (j = 0; j < 8; j++) {
   if (keys_return[i] & (1 << j)) {
    int k;
    KeyCode keycode = i * 8 + j;
    KeySym *keysym = XGetKeyboardMapping(display, keycode, 1, &k);
    if (keysym && *keysym)
     printf("%s\n", XKeysymToString(*keysym));
   }
  }
 }

	int k;
    KeySym *keysym = XGetKeyboardMapping(display, 9, 105, &k);
	printf("%d\n",k);
 return 0;
}
