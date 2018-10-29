/*
 * xtest5.c
 * gcc xtest5.c -o xtest5 -lXt
 * グラフィック・コンテキストを使う
 */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

void line_proc();
void clear_proc();
void ouch_proc();
void quit_proc();

String fallback_resources[] = {
    "*translations: #override\\n\
     <Expose>: Paint()\\n\
     <Enter>: Clear()\\n\
     <Leave>: Paint()\\n\
     <Btn1Up>: Ouch()\\n\
     <Btn2Up>: Quit()",
    "*geometry: 500x500",
    NULL,
};

XtActionsRec actions[] = {
    {"Paint", (XtActionProc)line_proc},
    {"Clear", (XtActionProc)clear_proc},
    {"Ouch", (XtActionProc)ouch_proc},
    {"Quit", (XtActionProc)quit_proc},
};

main(int argc, char *argv[])
{
    XtAppContext app_con;
    Widget toplevel;

    toplevel = XtVaAppInitialize(&app_con, "Xtest5", NULL, 0,
				 &argc, argv, fallback_resources, NULL);

    XtAppAddActions(app_con, actions, XtNumber(actions));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_con);
}

void
line_proc(Widget w)
{
    Dimension width, height;
    Display *disp;
    Window win;
    GC gc1, gc2;
    int x, step;
    XGCValues value;
    XColor def, col;

    disp = XtDisplay(w);
    win = XtWindow(w);

    XAllocNamedColor(disp, DefaultColormap(disp, 0), "red", &col, &def);
    value.foreground = col.pixel;
    gc1 = XCreateGC(disp, win, GCForeground, &value);

    value.line_width = 2;
    gc2 = XCreateGC(disp, win, GCLineWidth, &value);

    XtVaGetValues(w, XtNwidth, &width, XtNheight, &height, NULL);

    step = 5;

    for (x = 0; x < (int)width; x += step) {
	XDrawLine(disp, win, gc1, 0, height, x, 0);
	XDrawLine(disp, win, gc2, width, height, x, 0);
    }
}

void
clear_proc(Widget w)
{
    Display *disp;
    Window win;

    disp = XtDisplay(w);
    win = XtWindow(w);

    XClearWindow(disp, win);
}

void
ouch_proc()
{
    printf("Ouch!!\n");
}

void
quit_proc()
{
    exit(1);
}
