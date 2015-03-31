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
  XSetForeground(d,gc1,WhitePixel(d,0));	/** ��㣱�ο���������� **/
  XSetForeground(d,gc2,BlackPixel(d,0));	/*  ��㣲�ο���������� */
	pm1=XCreatePixmap(d,w,10,10,DefaultDepth(d,0));  /* pixmap1 ����� */ 
       	XFillRectangle(d,pm1,gc1,0,0,10,10);
	XFillArc(d,pm1,gc2,0,0,10,10,0,64*360);  /* Completed making pixmap1(pattern on border) */
	/**** �����Ǥϡ�������Υѥ���������Ǻ��������طʾ�Υѥ���������Ǻ������롡****/
	pm2=XCreatePixmap(d,w,100,100,DefaultDepth(d,0));  /* pixmap2 �������*/
               	XFillRectangle(d,pm2,gc1,0,0,100,100);
		XFillArc(d,pm2,gc2,0,0,100,100,0,64*360); /*Completed making pixmap2 (pattern inside)*/
	XSetWindowBorderPixmap (d,w,pm1);
	XSetWindowBackgroundPixmap (d,w,pm2);

XMapWindow(d,w);
XFlush(d);
getchar();
}

