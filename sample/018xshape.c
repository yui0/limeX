/*
 * Shape Extension を使って矩形ではない Window を表示するサンプルコード
 */

#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>             /* shape.h の前に必要 */
#include <X11/extensions/shape.h>  /* Shape Extension    */


/*
 * bounding 領域および clip 領域を表す X11 形式のビットマップデータ
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

	Pixmap   pixmap_bounding;   /* bounding 領域を決定するビットマップ */
	Pixmap   pixmap_clip;       /* clip     領域を決定するビットマップ */
	int      event_no_base;     /* ShapeNotify イベントの番号 */
	int      error_no_base;     /* Shape Extension で発生するエラーの最初の番号 */

	unsigned long white, black, blue, red;


	dpy    = XOpenDisplay( NULL );
	screen = DefaultScreen( dpy );


	/*
	 * 接続した X サーバが、Shape Extension をサポートしているか
	 * どうかを調べる。
	 */
	if ( ! XShapeQueryExtension( dpy, &event_no_base, &error_no_base ) ) {
		fprintf( stderr, "Shape extension is not available\n" );
		XCloseDisplay( dpy );
		return 1;
	}


	/*
	 * 色設定
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
	 * Window 作成
	 */
	{
		/*
		 * base Window を作成する。
		 */
		base = XCreateSimpleWindow( dpy, DefaultRootWindow( dpy ),
					    WIN_X, WIN_Y,
					    WIN_W, WIN_H,
					    0, black, blue );
		XStoreName( dpy, base, "Button" );
	

		/*
		 * bounding ビットマップの幅と高さを使って button Window を作成する。
		 */
		button = XCreateSimpleWindow( dpy, base, 
					      SPC_X, SPC_Y,
					      btn_bd_width, btn_bd_height,
					      0, black, white );

		gc = XCreateGC( dpy, button, 0, NULL );
		XSetBackground( dpy, gc, white );
	}


	/*
	 * bounding 領域および clip 領域の設定
	 */
	{
		/*
		 * bounding 領域および clip 領域を表現するビットマップを作成する。
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
		 * bounding 領域および clip 領域を設定する。
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
	 * 真中の Window 内でマウスの左ボタンをクリックする度に、
	 * 表示色を 赤<==>白 で切替える。
	 * Window に関係無く、右ボタンをクリックすると終了する。
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
