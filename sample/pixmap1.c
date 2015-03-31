#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>

main()
{ XSetWindowAttributes wat;
  Display *d;
  Window r, w;
  Pixmap pm1, pm2;		/** Using two Pixmaps **/
  GC gc1, gc2; 		/** Using two Graphic Contexts **/
  d = XOpenDisplay ( NULL );  	/** Connection to the X server **/
  r = RootWindow (d,0);
  w = XCreateSimpleWindow (d,r,20,20,300,250,20, WhitePixel(d,0), BlackPixel(d,0));
  wat.override_redirect =True;
  XChangeWindowAttributes(d,w,CWOverrideRedirect,&wat);
  gc1=XCreateGC(d,w,0,0);
  gc2=XCreateGC(d,w,0,0);
  XSetForeground(d,gc1,WhitePixel(d,0));	/** ｇｃ１の色を白に設定 **/
  XSetForeground(d,gc2,BlackPixel(d,0));	/*  ｇｃ２の色を黒に設定 */
	pm1=XCreatePixmap(d,w,10,10,DefaultDepth(d,0));  /* pixmap1 を作成 */ 
       	XFillRectangle(d,pm1,gc1,0,0,10,10);
	XFillArc(d,pm1,gc2,0,0,10,10,0,64*360);  /* Completed making pixmap1(pattern on border) */
	/**** ここでは、■線上のパターンをｐｍ１で作成し、背景上のパターンをｐｍ２で作成する　****/
	pm2=XCreatePixmap(d,w,100,100,DefaultDepth(d,0));  /* pixmap2 を作成　*/
               	XFillRectangle(d,pm2,gc1,0,0,100,100);
		XFillArc(d,pm2,gc2,0,0,100,100,0,64*360); /*Completed making pixmap2 (pattern inside)*/
	XSetWindowBorderPixmap (d,w,pm1);
	XSetWindowBackgroundPixmap (d,w,pm2);

XMapWindow(d,w);
XFlush(d);
getchar();
}

