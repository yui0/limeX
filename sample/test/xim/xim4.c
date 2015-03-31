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
#define W_HEIGHT                (F_SIZE * (ROW+1))

Display                         *display;
int                             screen;
GC                              gc, gc_revers;
Window                          window;
XFontSet                        fs;
int                             dec;
int                             row = 0, col = 0;
char                            status_tab[30];
void                            DrawPreeditString(char *, char *);
char                            preedit_tab[128];
char                            Feedback[128];

main(int argc, char *argv[])
{
        XGCValues               values;
        XWMHints                hints;
        Atom                    protocols;
        char                    **missing_list;
        int                     missing_count;
        char                    *def_string;
        XFontSetExtents         *fs_ext;
        XIM                     im;
        XIC                     ic;
        XVaNestedList           preedit_attr, status_attr;
        XEvent                  event;
        unsigned long           mask, fevent;
        int                     len = 128;
        char                    string[128], s_tab[ROW][128];
        int                     i;
        KeySym                  keysym;
        int                     count = 0;
        Status                  status;
        extern int      P_StartCB(XIC, XPointer, XPointer);
        extern void     P_DoneCB(XIC, XPointer, XPointer);
        extern void     P_DrawCB(XIC, XPointer, XIMPreeditDrawCallbackStruct*);
        extern void     P_CaretCB(XIC, XPointer, XIMPreeditCaretCallbackStruct*);
        extern void     S_StartCB(XIC, XPointer, XPointer);
        extern void     S_DoneCB(XIC, XPointer, XPointer);
        extern void     S_DrawCB(XIC, XPointer, XIMStatusDrawCallbackStruct*);
        XIMCallback     P_StartCB_str;
        XIMCallback     P_DoneCB_str;
        XIMCallback     P_DrawCB_str;
        XIMCallback     P_CaretCB_str;
        XIMCallback     S_StartCB_str;
        XIMCallback     S_DoneCB_str;
        XIMCallback     S_DrawCB_str;

        display = XOpenDisplay("");
        screen  = DefaultScreen(display);
        gc = DefaultGC(display,screen);
        values.foreground = WhitePixel(display, screen);
        values.background = BlackPixel(display, screen);
        gc_revers = XCreateGC(display, RootWindow(display, screen),
                        (GCForeground|GCBackground),&values);

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
                        0, 0, W_WIDTH, W_HEIGHT+dec, 2,
                        BlackPixel(display,screen), WhitePixel(display,screen));
        XStoreName(display, window, "XIM demo - on-the-spot window");

        hints.flags = InputHint;
        hints.input = True;
        XSetWMHints(display, window, &hints);
        protocols = XInternAtom(display, "WM_DELETE_WINDOW", True);
        XSetWMProtocols(display, window, &protocols, 1);

        if((im = XOpenIM(display, NULL, NULL, NULL)) == NULL){
                printf("Error : XOpenIM() !\n");
                exit(0);
                }

        P_StartCB_str.client_data = NULL;
        P_StartCB_str.callback = (XIMProc)P_StartCB;
        P_DoneCB_str.client_data = NULL;
        P_DoneCB_str.callback = (XIMProc)P_DoneCB;
        P_DrawCB_str.client_data = NULL;
        P_DrawCB_str.callback = (XIMProc)P_DrawCB;
        P_CaretCB_str.client_data = NULL;
        P_CaretCB_str.callback = (XIMProc)P_CaretCB;
        preedit_attr = XVaCreateNestedList(None,
                        XNPreeditStartCallback, &P_StartCB_str,
                        XNPreeditDoneCallback, &P_DoneCB_str,
                        XNPreeditDrawCallback, &P_DrawCB_str,
                        XNPreeditCaretCallback, &P_CaretCB_str,
                        NULL);
        S_StartCB_str.client_data = NULL;
        S_StartCB_str.callback = (XIMProc)S_StartCB;
        S_DoneCB_str.client_data = NULL;
        S_DoneCB_str.callback = (XIMProc)S_DoneCB;
        S_DrawCB_str.client_data = NULL;
        S_DrawCB_str.callback = (XIMProc)S_DrawCB;
        status_attr = XVaCreateNestedList(None,
                        XNStatusStartCallback, &S_StartCB_str,
                        XNStatusDoneCallback, &S_DoneCB_str,
                        XNStatusDrawCallback, &S_DrawCB_str,
                        NULL);        

        ic = XCreateIC(im, 
                XNInputStyle, XIMPreeditCallbacks | XIMStatusCallbacks,
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
                        DrawPreeditString(preedit_tab, Feedback);
                        XmbDrawString(display, window, fs, gc, 20, W_HEIGHT,
                                        status_tab, strlen(status_tab));
                        break;
                case KeyPress :
                        count = XmbLookupString(ic,(XKeyPressedEvent*)&event,
                                        string, len, &keysym, &status);
                        if(status == XLookupBoth && keysym == XK_Return){
                                row = (++row)%ROW;
                                col = 0;
                                s_tab[row][0] = 0;
                                preedit_tab[0] = 0;
                                Feedback[0] = 0;
                                XClearArea(display, window, 0, F_SIZE*row+dec,
                                        W_WIDTH, F_SIZE, False);
                        }
                        else if(status == XLookupChars
                                        || status == XLookupBoth){
                                XmbDrawImageString(display, window, fs, gc,
                                        F_SIZE/2*col, F_SIZE*(row+1),
                                        string, count);
                                for(i=0; i<count; i++, col++)
                                        s_tab[row][col] = string[i];
                                s_tab[row][col] = 0;
                                preedit_tab[0] = 0;
                                Feedback[0] = 0;
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

int P_StartCB(XIC ic, XPointer client_data, XPointer P_S)
{
        printf(" PreeditStartCallback called\n");
        return(128);
}

void P_DoneCB(XIC ic, XPointer client_data, XPointer P_DN)
{
        printf(" PreeditDoneCallback called\n");
        preedit_tab[0] = 0;
        Feedback[0] = 0;
}

void P_DrawCB(XIC ic, XPointer client_data, XIMPreeditDrawCallbackStruct *P_DR)
{
        int     i, l, Col;
        char    preedit_string[128], emp_string[1];

        Col = col;
        emp_string[0] = ' ';

        for(i=0, Col; i<(P_DR->chg_length*2); i++, Col++)
                XmbDrawImageString(display, window, fs, gc,
                        F_SIZE/2*(Col+2*P_DR->chg_first), F_SIZE*(row+1),
                        emp_string, 1);

        if(P_DR->text){
                if(P_DR->text->string.wide_char == NULL
                                && P_DR->text->string.multi_byte == NULL)
                        return;
                if(P_DR->text->encoding_is_wchar)
                        wctomb(preedit_string, P_DR->text->string.wide_char);
                else
                        strcpy(preedit_string, P_DR->text->string.multi_byte);
                for(i=P_DR->chg_first*2,l=0; preedit_string[l] != 0; i++,l++)
                        preedit_tab[i] = preedit_string[l];
                preedit_tab[i] = 0;
                for(i=P_DR->chg_first,l=0; 
                        (unsigned int)i < P_DR->chg_first+P_DR->text->length;
                        i++,l++)
                        Feedback[i] = P_DR->text->feedback[l];
                Feedback[i] = 0;
                DrawPreeditString(preedit_tab, Feedback);
        }
}

void P_CaretCB(XIC ic, XPointer client_data, XIMPreeditCaretCallbackStruct *P_C)
{
        printf(" PreeditCaretCallback called");
}

void S_StartCB(XIC ic, XPointer client_data, XPointer S_S)
{
        printf(" StatusStartCallback called\n");
}

void S_DoneCB(XIC ic, XPointer client_data, XPointer S_DN)
{
        printf(" StatusDoneCallback called\n");
}

void S_DrawCB(XIC ic, XPointer client_data, XIMStatusDrawCallbackStruct *P_DR)
{
        if(P_DR->type != XIMBitmapType){
                if(P_DR->data.text->encoding_is_wchar)
                        wctomb(status_tab, P_DR->data.text->string.wide_char);
                else
                strcpy(status_tab, P_DR->data.text->string.multi_byte);
                XClearArea(display, window, 0, W_HEIGHT-F_SIZE+dec,
                        W_WIDTH, F_SIZE, False);
                XmbDrawString(display, window, fs, gc,
                                20, W_HEIGHT, status_tab, strlen(status_tab));
        }
}

void DrawPreeditString(char * p, char * fp)
{
        int     i;
        int     Col;

        Col = col;

        for(i=0; i<strlen(fp); i++){
                if(fp[i] == XIMReverse)
                        XmbDrawImageString(display, window, fs, gc_revers,
                                F_SIZE/2*Col, F_SIZE*(row+1),
                                p, mblen(p, 3));
                else if(fp[i] == XIMUnderline){
                        XmbDrawImageString(display, window, fs, gc,
                                F_SIZE/2*Col, F_SIZE*(row+1),
                                p, mblen(p, 3));
                        XDrawLine(display, window, gc,
                                F_SIZE/2*Col, F_SIZE*(row+1)+1,
                                F_SIZE/2*(Col+mblen(p,3))-(dec-1),
                                F_SIZE*(row+1)+1);
                }
                Col += mblen(p, 3);
                p += mblen(p, 3);
        }
}

