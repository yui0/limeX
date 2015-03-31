/*
 * xtest2.c
 * gcc xtest2.c -o xtest2 -lXt
 * マウスボタンのクリックを受け付ける
 */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

void quit_proc();

String fallback_resources[] = {
    "*translations: #override\\n\
     <BtnUp>: Quit()",
    "*geometry: 500x500",
    NULL,
};

XtActionsRec actions[] = {
    {"Quit", (XtActionProc)quit_proc},
};

main(int argc, char *argv[])
{
    XtAppContext app_con;
    Widget toplevel;

    toplevel = XtVaAppInitialize(&app_con, "Xtest2", NULL, 0,
				 &argc, argv, fallback_resources, NULL);

    XtAppAddActions(app_con, actions, XtNumber(actions));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_con);
}

void
quit_proc()
{
    printf("This is quit_porc()\nbye!!!\n");

    exit(1);
}
