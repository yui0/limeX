#include <stdio.h>
#include <locale.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

#define DEFAULT_FONT_NAME       "-*-*-*-R-Normal--14-130-75-75-*-*"
#define F_SIZE                  14
#define COL                     30
#define ROW                     10

#define W_WIDTH                 (F_SIZE * COL)
#define W_HEIGHT                (F_SIZE * (ROW+2))

main(int argc, char *argv[])
{
        Display                 *display;
        int                     screen;
        GC                      gc;
        Window                  window;
        XWMHints                hints;
        Atom                    protocols;
        XFontSet                fs;
        char                    **missing_list;
        int                     missing_count;
        char                    *def_string;
        XFontSetExtents         *fs_ext;
        int                     dec;
        XIM                     im;
        XIC                     ic;
        XRectangle              p_rect, s_rect;
        XVaNestedList           preedit_attr, status_attr;
        XEvent                  event;
        unsigned long           mask, fevent;
        int                     len = 128;
        char                    string[128], s_tab[ROW][128];
        int                     i, row = 0, col = 0;
        KeySym                  keysym;
        int                     count = 0;
        Status                  status;

        display = XOpenDisplay("");
        screen  = DefaultScreen(display);
        gc = DefaultGC(display,screen);

        if(setlocale(LC_CTYPE, "") == NULL){
                fprintf(stderr, "Error : setlocale() !\n");
                exit(0);
                }
	XSetLocaleModifiers(""); 

        fs = XCreateFontSet(display, DEFAULT_FONT_NAME, &missing_list,
                               &missing_count, &def_string);
        fs_ext = XExtentsOfFontSet(fs);
        dec = fs_ext->max_logical_extent.height-(-fs_ext->max_logical_extent.y);

        window  = XCreateSimpleWindow(display, RootWindow(display, screen),
                        0, 0, W_WIDTH, W_HEIGHT, 2,
                        BlackPixel(display,screen), WhitePixel(display,screen));
        XStoreName(display, window, "XIM demo - Area window");

        hints.flags = InputHint;
        hints.input = True;
        XSetWMHints(display, window, &hints);
        protocols = XInternAtom(display, "WM_DELETE_WINDOW", True);
        XSetWMProtocols(display, window, &protocols, 1);

        if((im = XOpenIM(display, NULL, NULL, NULL)) == NULL){
                printf("Error : XOpenIM() !\n");
                exit(0);
                }

        p_rect.x =      0;
        p_rect.y =      F_SIZE * ROW;
        p_rect.width =  W_WIDTH;
        p_rect.height = F_SIZE;
        preedit_attr = XVaCreateNestedList(None,
                                XNArea, &p_rect,
                                XNFontSet, fs,
                                NULL);
        s_rect.x =      0;
        s_rect.y =      F_SIZE * (ROW+1);
        s_rect.width =  W_WIDTH;
        s_rect.height = F_SIZE;
        status_attr = XVaCreateNestedList(None,
                                XNArea, &s_rect,
                                XNFontSet, fs,
                                NULL);

        ic = XCreateIC(im, 
                XNInputStyle, XIMPreeditArea | XIMStatusArea,
                XNClientWindow, window,
                XNPreeditAttributes, preedit_attr,
                XNStatusAttributes, status_attr,
                NULL);
        if(ic == NULL){
                printf("Error : XCreateIC() !\n");
                XCloseIM(im);
                exit(0);
        }
        XFree(preedit_attr);
        XFree(status_attr);
        XGetICValues(ic, XNFilterEvents, &fevent, NULL);
        mask = ExposureMask | KeyPressMask | FocusChangeMask;
        XSelectInput(display, window, mask|fevent);

        for(i=0; i<ROW; i++)
                s_tab[i][0] = 0;

        XMapWindow(display, window);

        for(;;){
                XNextEvent(display, &event);
                if(XFilterEvent(&event, None) == True)
                        continue;
                switch(event.type){
                case FocusIn :
                        XSetICFocus(ic);
                        break;
                case FocusOut :
                        XUnsetICFocus(ic);
                        break;
                case Expose :
                        for(i=0; i<ROW; i++)
                                XmbDrawString(display, window, fs, gc, 0,
                                        F_SIZE*(i+1),s_tab[i],strlen(s_tab[i]));
                        break;
                case KeyPress :
                        count = XmbLookupString(ic,(XKeyPressedEvent*)&event,
                                        string, len, &keysym, &status);
                        if(status == XLookupBoth && keysym == XK_Return){
                                row = (++row)%ROW;
                                col = 0;
                                s_tab[row][0] = 0;
                                XClearArea(display, window, 0, F_SIZE*row+dec,
                                        W_WIDTH, F_SIZE, False);
                        }
                        else if(status == XLookupChars
                                        || status == XLookupBoth){
                                XmbDrawString(display, window, fs, gc,
                                        F_SIZE/2*col, F_SIZE*(row+1),
                                        string, count);
                                for(i=0; i<count; i++, col++)
                                        s_tab[row][col] = string[i];
                                s_tab[row][col] = 0;
                        }
                        break;
                case ClientMessage :
                        if(event.xclient.data.l[0] == protocols){
                                XDestroyIC(ic);
                                XCloseIM(im);
                                XDestroyWindow(display, window);
                                XCloseDisplay(display);
                                exit(0);
                        }
                        break;
                defaults:
                        break;
                }
        }
}

