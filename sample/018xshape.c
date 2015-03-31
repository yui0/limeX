/*
 * Shape Extension ��Ȥäƶ���ǤϤʤ� Window ��ɽ�����륵��ץ륳����
 */

#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>             /* shape.h ������ɬ�� */
#include <X11/extensions/shape.h>  /* Shape Extension    */


/*
 * bounding �ΰ褪��� clip �ΰ��ɽ�� X11 �����Υӥåȥޥåץǡ���
 */
#include "btn_bd.h"
#include "btn_cl.h"


#define WIN_X 100
#define WIN_Y 100

#define SPC_X  25
#define SPC_Y  25

#define WIN_W ( btn_bd_width  + SPC_X * 2 )
#define WIN_H ( btn_bd_height + SPC_Y * 2 )


int 
main( void )
{
	Display* dpy;
	int      screen;

	Window   base;
	Window   button;
	GC       gc;

	Pixmap   pixmap_bounding;   /* bounding �ΰ����ꤹ��ӥåȥޥå� */
	Pixmap   pixmap_clip;       /* clip     �ΰ����ꤹ��ӥåȥޥå� */
	int      event_no_base;     /* ShapeNotify ���٥�Ȥ��ֹ� */
	int      error_no_base;     /* Shape Extension ��ȯ�����륨�顼�κǽ���ֹ� */

	unsigned long white, black, blue, red;


	dpy    = XOpenDisplay( NULL );
	screen = DefaultScreen( dpy );


	/*
	 * ��³���� X �����Ф���Shape Extension �򥵥ݡ��Ȥ��Ƥ��뤫
	 * �ɤ�����Ĵ�٤롣
	 */
	if ( ! XShapeQueryExtension( dpy, &event_no_base, &error_no_base ) ) {
		fprintf( stderr, "Shape extension is not available\n" );
		XCloseDisplay( dpy );
		return 1;
	}


	/*
	 * ������
	 */
	{
		XColor   color, exact; 
		Colormap cmap;

		white  = WhitePixel( dpy, screen );
		black  = BlackPixel( dpy, screen );

		cmap   = DefaultColormap( dpy, screen );

		XAllocNamedColor( dpy, cmap, "blue", &color, &exact );
		blue = color.pixel;

		XAllocNamedColor( dpy, cmap, "red",  &color, &exact );
		red  = color.pixel;
	}


	/*
	 * Window ����
	 */
	{
		/*
		 * base Window ��������롣
		 */
		base = XCreateSimpleWindow( dpy, DefaultRootWindow( dpy ),
					    WIN_X, WIN_Y,
					    WIN_W, WIN_H,
					    0, black, blue );
		XStoreName( dpy, base, "Button" );
	

		/*
		 * bounding �ӥåȥޥåפ����ȹ⤵��Ȥä� button Window ��������롣
		 */
		button = XCreateSimpleWindow( dpy, base, 
					      SPC_X, SPC_Y,
					      btn_bd_width, btn_bd_height,
					      0, black, white );

		gc = XCreateGC( dpy, button, 0, NULL );
		XSetBackground( dpy, gc, white );
	}


	/*
	 * bounding �ΰ褪��� clip �ΰ������
	 */
	{
		/*
		 * bounding �ΰ褪��� clip �ΰ��ɽ������ӥåȥޥåפ�������롣
		 */
		pixmap_bounding = XCreateBitmapFromData( 
			dpy, button,
			( char* )btn_bd_bits,
			btn_bd_width, btn_bd_height );

		pixmap_clip     = XCreateBitmapFromData(
			dpy, button,
			( char* )btn_cl_bits,
			btn_cl_width, btn_cl_height );

		/*
		 * bounding �ΰ褪��� clip �ΰ�����ꤹ�롣
		 */
		XShapeCombineMask( dpy, button, ShapeBounding, 
				   0, 0, pixmap_bounding, ShapeSet );

		XShapeCombineMask( dpy, button, ShapeClip,     
				   0, 0, pixmap_clip,     ShapeSet );
	}


	XSelectInput( dpy, base,   ButtonPressMask );
	XSelectInput( dpy, button, ButtonPressMask );

	XMapWindow( dpy, base );
	XMapSubwindows( dpy, base );


	/*
	 * ����� Window ��ǥޥ����κ��ܥ���򥯥�å������٤ˡ�
	 * ɽ������ ��<==>�� �����ؤ��롣
	 * Window �˴ط�̵�������ܥ���򥯥�å�����Ƚ�λ���롣
	 */
	while ( 1 ) {
		static XEvent event;
		static char flag = 0;

		XNextEvent( dpy, &event );

		switch ( event.type ) {
		case ButtonPress:
			switch ( event.xbutton.button ) {
			case Button1:  /* Left   Button */
				if ( event.xbutton.window == button ) {
					if ( ! flag ) {
						XSetForeground( dpy, gc, red );
						flag ++;
					}
					else {
						XSetForeground( dpy, gc, white );
						flag --;
					}

					XFillRectangle( dpy, button, gc, 
						0, 0, btn_bd_width, btn_bd_height );
				}
				break;

			case Button3:  /* Right  Button */
				XFreeGC( dpy, gc );
				XDestroyWindow( dpy, base );
				XCloseDisplay( dpy );
				return 0;
			}

		default:
			break;
		}
	}
}


/* End of xshape.c */
