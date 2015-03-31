/*
 * xtest3.c
 * gcc xtest3.c -o xtest3 -lXt
 * いろいろなイベントに対処する
 */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

void welcome_proc();
void bye_proc();
void ouch_proc();
void quit_proc();

String fallback_resources[] = {
    "*translations: #override\\n\
     <Enter>: Welcome()\\n\
     <Leave>: Bye()\\n\
     <Btn1Up>: Ouch()\\n\
     <Btn2Up>: Quit()",
    "*geometry: 500x500",
    NULL,
};

XtActionsRec actions[] = {
    {"Welcome", (XtActionProc)welcome_proc},
    {"Bye", (XtActionProc)bye_proc},
    {"Ouch", (XtActionProc)ouch_proc},
    {"Quit", (XtActionProc)quit_proc},
};

main(int argc, char *argv[])
{
    XtAppContext app_con;
    Widget toplevel;

    toplevel = XtVaAppInitialize(&app_con, "Xtest3", NULL, 0,
				 &argc, argv, fallback_resources, NULL);

    XtAppAddActions(app_con, actions, XtNumber(actions));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_con);
}

void
welcome_proc()
{
    printf("Welcome to my window!!\n");
}

void
bye_proc()
{
    printf("Bye.  See you soon.\n");
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
