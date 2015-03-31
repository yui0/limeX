/*
 * xtest1.c
 * gcc xtest1.c -o xtest1 -lXt
 * ウィンドウを表示する
 */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

String fallback_resources[] = {
    "*geometry: 500x500",
    NULL,
};

main(int argc, char *argv[])
{
    XtAppContext app_con;
    Widget toplevel;

    toplevel = XtVaAppInitialize(&app_con, "Xtest1", NULL, 0,
				 &argc, argv, fallback_resources, NULL);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_con);
}
