/*
 * �롼�ȥ�����ɥ���(�̥�����ɥ��˲�̾�����Ѵ�ʸ����
 * ��ɽ�����륿����)�Υ���ץ�ץ���� 
 */

#include <X11/Xlib.h>
#include <X11/Xlocale.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
#include <stdio.h>


#define BORDER  2    /* �ܡ������� */
#define COL     30   /* 30�� */
#define ROW     20   /* 20�� */

static Display*          dpy;          /* �ǥ����ץ쥤 */
static int               screen;       /* �����꡼�� */
static Window            root;         /* �롼�ȥ�����ɥ� */
static Window            win;          /* ɽ�����륦����ɥ� */
static int               win_w, win_h; /* ������ɥ������ȹ⤵ */
static unsigned long     black, white; /* ������Υԥ������� */
static GC                gc;           /* ����ե��å�������ƥ����� */
static XFontSet          fs;           /* �ե���ȥ��å� */
static int               font_w;       /* ʸ���� */
static int               font_h;       /* ʸ���� */
static int               ascent;       /* ʸ���Υ������ */
static int               descent;      /* ʸ���Υǥ������ */
static XIM               im;           /* ����ץåȥ᥽�å� */
static XIC               ic;           /* ����ץåȥ���ƥ����� */
static Atom              protocol;     /* ������ɥ��ޥ͡��������ѿ� */


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
	/* ����ץåȥ᥽�åɤ�ɬ�פȤ��륤�٥�� */
	unsigned long fevent;

	if ( xim_setlocale() == -1 ) {
		return 1;
	}

	xim_init();
	xim_create_fontset();
	xim_create_window();

	/* ����ץåȥ᥽�åɤν���� */
	if ( xim_init_inputmethod() == -1 ) {
		return 1;
	}

	/* ������ɥ��˲����٥�Ȥ������� */
	protocol = XInternAtom( dpy, "WM_DELETE_WINDOW", True );
	XSetWMProtocols( dpy, win, &protocol, 1 );

	/* ����ץåȥ᥽�åɤ�ɬ�פȤ��륤�٥�Ȥ��䤤��碌�� */
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

	/* �桼������Υ�ǥ��ե�������Ϣ�뤹�� */
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

	/* �ե���Ⱦ���μ��� */
	fs_extents = XExtentsOfFontSet(fs);

	font_w     = fs_extents->max_logical_extent.width;
	font_h     = fs_extents->max_logical_extent.height;
	ascent     = - fs_extents->max_logical_extent.y;
	descent    = fs_extents->max_logical_extent.height - ascent;

	/* ������ɥ����ȹ⤵������ */
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
	/* ����ץåȥ᥽�åɤ򥪡��ץ󤹤� */
	if ( ( im = XOpenIM( dpy, NULL, NULL, NULL ) ) == NULL ) {
		printf( "Couldn't open input method.\n" );
		return -1;
	}


	/* ����ץåȥ���ƥ����Ȥκ��� */
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

		/* ����ץåȥ᥽�åɤ˥��٥�Ȥ��Ϥ� */
		if( XFilterEvent( &event, ( Window )NULL ) == True ) {
			/* ���٥�Ȥϥե��륿��󥰤��줿 */
			continue;
		}

		switch( event.type ) {
			/* 
			 * Expose ���٥�Ȥ��Ѱդ��Ƥ��ʤ��Τǡ�������ɥ���
			 * ���줿���ʤɤˤ��������Ƥϼ����롣
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

	/* COL ��� 2 �Х���ʸ��ʬ���ΰ�� 1 �Ԥκ���ʸ�����Ȥ��� */
	char buffer[ COL * 2 ];

	static int row = 0;
	static int col = 0;


	/* ����ʸ����μ��� */
	cnt = XmbLookupString( ic, ( XKeyPressedEvent* )event,
			       buffer, sizeof( buffer ), &keysym, &status );

	/* 
	 * ���β��Խ����򲼤� if ʸ�����˹Ԥ�ʤ��ȡ�������˥��٥�Ȥ�
	 * �����Ʋ��Խ������Ԥ��ʤ��Τ���� 
	 */
	if ( status == XLookupBoth && keysym == XK_Return ) {
		/* �ǲ��ʤ���ã�����顢��Ƭ�Ԥ���� */
		if ( ++ row >= ROW ) {
			row = 0; 
		}
		col = 0;
		
		/* �������Ԥ򥯥ꥢ���� */
		XClearArea( dpy, win, 0, font_h * row, win_w, font_h, False );
	}
	else if ( status == XLookupChars || status == XLookupBoth ) {
		/* 
		 * ����ʸ��(ʸ����)������ 
		 *
		 * ���踶���� x ��ɸ�����ݤˡ�font_w / 2 �Ȥ����׻���
		 * ���Ƥ��뤬������� 1 �Х���ʸ���������������롣���ܸ�
		 * ʸ��(ʸ����)�����Ϥ��줿���ˤ� 2 �Х��Ȥ��� char ��
		 * �ͤ�������Τǡ����ߤ� col �� font_w / 2 �򤫤����
		 * �������褹�٤����踶���� x ��ɸ�����Ǥ��롣
		 */
		XmbDrawString( dpy, win, fs, gc,
			       ( font_w / 2 ) * col, font_h * row + ascent,
			       buffer, cnt );

		col += cnt;
	}

	/* 
	 * status �� XBufferOverflow �ξ��ϡ��Ѱդ����Хåե���ʸ����
	 * ���Ǽ������ʤ��ä��Ȥ������ȤʤΤǡ����ξ��Ͻ�ʬ�ʥХåե�
	 * ���Ѱդ�����Ǻ��� XmbLookupString() ��¹Ԥ���ɬ�פ����롣
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




