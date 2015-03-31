/*
 * ルートウィンドウ型(別ウィンドウに仮名漢字変換文字列
 * を表示するタイプ)のサンプルプログラム 
 */

#include <X11/Xlib.h>
#include <X11/Xlocale.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
#include <stdio.h>


#define BORDER  2    /* ボーダの幅 */
#define COL     30   /* 30列 */
#define ROW     20   /* 20行 */

static Display*          dpy;          /* ディスプレイ */
static int               screen;       /* スクリーン */
static Window            root;         /* ルートウィンドウ */
static Window            win;          /* 表示するウィンドウ */
static int               win_w, win_h; /* ウィンドウの幅と高さ */
static unsigned long     black, white; /* 黒、白のピクセル値 */
static GC                gc;           /* グラフィックスコンテキスト */
static XFontSet          fs;           /* フォントセット */
static int               font_w;       /* 文字幅 */
static int               font_h;       /* 文字高 */
static int               ascent;       /* 文字のアセント */
static int               descent;      /* 文字のディセント */
static XIM               im;           /* インプットメソッド */
static XIC               ic;           /* インプットコンテキスト */
static Atom              protocol;     /* ウィンドウマネージャ用変数 */


static int  xim_setlocale();
static void xim_init();
static void xim_create_fontset();
static void xim_create_window();
static int  xim_init_inputmethod();
static void xim_event_loop();
static void xim_draw( XEvent* event );
static void xim_close();


int 
main( void )
{
	/* インプットメソッドが必要とするイベント */
	unsigned long fevent;

	if ( xim_setlocale() == -1 ) {
		return 1;
	}

	xim_init();
	xim_create_fontset();
	xim_create_window();

	/* インプットメソッドの初期化 */
	if ( xim_init_inputmethod() == -1 ) {
		return 1;
	}

	/* ウィンドウ破壊イベントを受け取る */
	protocol = XInternAtom( dpy, "WM_DELETE_WINDOW", True );
	XSetWMProtocols( dpy, win, &protocol, 1 );

	/* インプットメソッドが必要とするイベントを問い合わせる */
	XGetICValues( ic, XNFilterEvents, &fevent, NULL );

	XSelectInput( dpy, win, 
	      ExposureMask | KeyPressMask | FocusChangeMask | fevent );
	XMapWindow( dpy, win );

	xim_event_loop();
	xim_close();

	return 0;
}


static int 
xim_setlocale( void )
{
	if ( setlocale( LC_CTYPE, "" ) == NULL ) {
		printf( "Can't set locale.\n" );
		return -1;
	}

	if ( ! XSupportsLocale() ) {
		printf( "Current locale is not supported\n" );
		return -1;
	}

	/* ユーザ指定のモディファイアを連結する */
	if ( XSetLocaleModifiers( "" ) == NULL ) {
		printf( "Can't set locale modifiers\n" );
		return -1;
	}

	return 0;
}


static void 
xim_init( void )
{
	dpy = XOpenDisplay( "" );

	root   = DefaultRootWindow( dpy );
	screen = DefaultScreen( dpy );
	white  = WhitePixel( dpy, screen );
	black  = BlackPixel( dpy, screen );
}


static void 
xim_create_fontset( void )
{
	XFontSetExtents*  fs_extents;
	int    missing_count;
	char** missing_list;
	char*  def_string;

	
	fs = XCreateFontSet( dpy, "-*-fixed-medium-r-normal--14-*-*-*", 
		     &missing_list, &missing_count, &def_string );

	XFreeStringList( missing_list );   

	/* フォント情報の取得 */
	fs_extents = XExtentsOfFontSet(fs);

	font_w     = fs_extents->max_logical_extent.width;
	font_h     = fs_extents->max_logical_extent.height;
	ascent     = - fs_extents->max_logical_extent.y;
	descent    = fs_extents->max_logical_extent.height - ascent;

	/* ウィンドウ幅と高さを設定 */
	win_w = font_w * COL;
	win_h = font_h * ROW;
}


static void 
xim_create_window( void )
{
	win = XCreateSimpleWindow( dpy, root,
		   0, 0, win_w, win_h, BORDER, black, white );

	gc = XCreateGC( dpy, win, 0, NULL );
	XSetBackground( dpy, gc, white );
	XSetForeground( dpy, gc, black );
}


static int 
xim_init_inputmethod( void )
{
	/* インプットメソッドをオープンする */
	if ( ( im = XOpenIM( dpy, NULL, NULL, NULL ) ) == NULL ) {
		printf( "Couldn't open input method.\n" );
		return -1;
	}


	/* インプットコンテキストの作成 */
	ic = XCreateIC( im,
			XNInputStyle, 
			XIMPreeditNothing | XIMStatusNothing,
			XNClientWindow, 
			win,
			NULL );

	if ( ic == NULL ) {
		printf( "Couldn't create input context.\n" );
		XCloseIM( im );
		return -1;
	}

	return 0;
}


static void 
xim_event_loop( void )
{
	XEvent event;

	while( 1 ) {
		XNextEvent( dpy, &event );

		/* インプットメソッドにイベントを渡す */
		if( XFilterEvent( &event, ( Window )NULL ) == True ) {
			/* イベントはフィルタリングされた */
			continue;
		}

		switch( event.type ) {
			/* 
			 * Expose イベントを用意していないので、ウィンドウが
			 * 隠れた場合などには描画内容は失われる。
			 */
			case KeyPress :
				xim_draw( &event );
				break;

			case FocusIn :
				XSetICFocus( ic );
				break;

			case FocusOut :
				XUnsetICFocus( ic );
				break;

			case ClientMessage:
				if ( event.xclient.data.l[0] == protocol ) {
					return;
				}
	      
				break;
		}
	}
}


static void
xim_draw( XEvent* event )
{
	Status status;
	KeySym keysym;
	int cnt = 0;

	/* COL 列の 2 バイト文字分の領域を 1 行の最大文字数とする */
	char buffer[ COL * 2 ];

	static int row = 0;
	static int col = 0;


	/* 入力文字列の取得 */
	cnt = XmbLookupString( ic, ( XKeyPressedEvent* )event,
			       buffer, sizeof( buffer ), &keysym, &status );

	/* 
	 * この改行処理を下の if 文より先に行わないと、そちらにイベントを
	 * 拾われて改行処理が行われないので注意 
	 */
	if ( status == XLookupBoth && keysym == XK_Return ) {
		/* 最下段に到達したら、先頭行に戻る */
		if ( ++ row >= ROW ) {
			row = 0; 
		}
		col = 0;
		
		/* 新しい行をクリアする */
		XClearArea( dpy, win, 0, font_h * row, win_w, font_h, False );
	}
	else if ( status == XLookupChars || status == XLookupBoth ) {
		/* 
		 * 入力文字(文字列)の描画 
		 *
		 * 描画原点の x 座標を決める際に、font_w / 2 という計算を
		 * しているが、これは 1 バイト文字の幅に相当する。日本語
		 * 文字(文字列)が入力された場合には 2 バイトずつ char の
		 * 値を受け取るので、現在の col に font_w / 2 をかければ
		 * 次に描画すべき描画原点の x 座標を決定できる。
		 */
		XmbDrawString( dpy, win, fs, gc,
			       ( font_w / 2 ) * col, font_h * row + ascent,
			       buffer, cnt );

		col += cnt;
	}

	/* 
	 * status が XBufferOverflow の場合は、用意したバッファに文字列
	 * を格納しきれなかったということなので、この場合は充分なバッファ
	 * を用意した上で再度 XmbLookupString() を実行する必要がある。
	 */
}


static void 
xim_close( void )
{
	printf( "Exit application.\n" );

	XDestroyIC( ic );
	XCloseIM( im );
	XFreeGC( dpy, gc );
	XDestroyWindow( dpy, win );
	XCloseDisplay( dpy );
}


/* End of xim_root.c */




