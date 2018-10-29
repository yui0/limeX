/*
 * xtest4.c
 * gcc xtest4.c -o xtest4 -lXt
 * 描画する
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

    toplevel = XtVaAppInitialize(&app_con, "Xtest4", NULL, 0,
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
    GC gc;
    int x, step;

    disp = XtDisplay(w);
    win = XtWindow(w);
    gc = DefaultGC(disp, 0);

    XtVaGetValues(w, XtNwidth, &width, XtNheight, &height, NULL);

    step = 5;

    for (x = 0; x < (int)width; x += step) {
	XDrawLine(disp, win, gc, 0, height, x, 0);
	XDrawLine(disp, win, gc, width, height, x, 0);
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
