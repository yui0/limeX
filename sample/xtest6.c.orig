/*
 * xtest6.c
 * gcc xtest6.c -o xtest6 -lXt -lm
 * 物体が動く
 */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <math.h>

#define OBJ 5

char *color_name[] = {
    "blue",
    "red",
    "gold",
    "grey50",
    "perple",
    "LightsGreen"
};

typedef struct {
    double px, py;
    double deg;
} obj;

obj object[5];
Widget toplevel;

void quit_proc();
void InitializeObject();
Boolean moveObject();
void removeObject(int);
void displayObject(int);

String fallback_resources[] = {
    "*translations: #override\\n\
     <Btn2Up>: Quit()",
    "*geometry: 500x500",
    NULL,
};

XtActionsRec actions[] = {
    {"Quit", (XtActionProc)quit_proc},
};

main(int argc, char *argv[])
{
    XtAppContext app_con;

    toplevel = XtVaAppInitialize(&app_con, "Xtest6", NULL, 0,
				 &argc, argv, fallback_resources, NULL);

    XtAppAddActions(app_con, actions, XtNumber(actions));

    InitializeObject(); /* 物体の初期化 */

    XtAppAddWorkProc(app_con, moveObject, (XtPointer)NULL);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_con);
}

void
quit_proc()
{
    exit(1);
}

void
InitializeObject()
{
    int i;

    for (i = 0; i < OBJ; i++) {
	object[i].deg = 2 * 3.14 * (double)i / OBJ;
	object[i].px = 250.0 + 200.0 * cos(object[i].deg);
	object[i].py = 250.0 + 200.0 * sin(object[i].deg);
    }
}

Boolean
moveObject()
{
    int i;

    for (i = 0; i < OBJ; i++) {
	removeObject(i);
	object[i].deg += 0.01;
	object[i].px = 250.0 + 200.0 * cos(object[i].deg);
	object[i].py = 250.0 + 200.0 * sin(object[i].deg);
	displayObject(i);
    }

    return False;
}

void
removeObject(int num)
{
    GC gc;
    XGCValues value;
    Display *disp;
    Window win;

    disp = XtDisplay(toplevel);
    win = XtWindow(toplevel);

    value.foreground = WhitePixel(disp, 0);
    gc = XCreateGC(disp, win, GCForeground, &value);
    XFillArc (disp, win, gc,
	      (int) object[num].px, (int) object[num].py,
	      10, 10, 0, 360*64);
    XFreeGC(disp, gc);
}

void
displayObject(int num)
{
    GC gc;
    XGCValues value;
    Display *disp;
    Window win;
    XColor def, col;

    disp = XtDisplay(toplevel);
    win = XtWindow(toplevel);

    XAllocNamedColor(disp, DefaultColormap(disp, 0),
		     color_name[num], &col, &def);
    value.foreground = col.pixel;
    gc = XCreateGC(disp, win, GCForeground, &value);
    XFillArc (disp, win, gc,
	      (int) object[num].px, (int) object[num].py,
	      10, 10, 0, 360*64);
    XFreeGC(disp, gc);
}
