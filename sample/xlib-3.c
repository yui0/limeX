#include <X11/Xlib.h>
#include <X11/Xutil.h>

/* ������ؿ� */

unsigned long mycolor(Display *display, char *color){
    Colormap cmap;
    XColor c0,c1;

    cmap = DefaultColormap(display,0);
    XAllocNamedColor(display,cmap,color,&c1,&c0);
    return c1.pixel;
}


int main(int argc, char *argv[]){
    Display *display;
    Window window;
    Window pen_window[5];
    Window color_window[5];

    GC     gc;
    char title[]      = "Paint";
    char icon_title[] = "Paint";
    unsigned long background;
    unsigned long foreground;
    int button_size=40;

    char *colors[]={
	"rgb:00/00/00",
	"rgb:ff/00/00",
	"rgb:00/ff/00",
	"rgb:00/00/ff",
	"rgb:ff/ff/00",
    };

    int current_pen=2;
    unsigned long current_color=0;
    int x0, y0, x1, y1;
    int i;
		     
    display = XOpenDisplay(NULL);

    background = WhitePixel(display, 0);
    foreground = BlackPixel(display, 0);

    window = XCreateSimpleWindow(display,
                                 DefaultRootWindow(display),
                                 0, 0, 500, 400,
                                 0, 0, background);

    XSetStandardProperties(display, window, title, icon_title,
			   None, argv, argc, NULL);

    /* GC �����������Ƽ������Ԥ� */
    gc = XCreateGC(display, window, 0, 0);
    XSetBackground(display, gc, background);
    XSetForeground(display, gc, current_color);
    XSetLineAttributes(display, gc, current_pen,
		       LineSolid, CapRound, JoinMiter);

    /* �ᥤ�󥦥���ɥ��Υ��٥�ȥޥ��������� */
    XSelectInput(display, window,
		 ExposureMask |
		 ButtonPressMask |
		 ButtonMotionMask);

    /* �ڥ󥵥����������򥦥���ɥ������ */
    for ( i=0 ; i<sizeof(pen_window)/sizeof(pen_window[0]) ; i++ ){
	pen_window[i] =
	  XCreateSimpleWindow(display, window,
			      10, (button_size+10)*i+30,
			      button_size, button_size,
			      1, mycolor(display, "rgb:aa/aa/aa"),
			      mycolor(display, "rgb:ee/ee/ee"));
	color_window[i] =
	  XCreateSimpleWindow(display, window,
			      500-10-button_size, (button_size+10)*i+30,
			      button_size, button_size,
			      1, mycolor(display, "rgb:aa/aa/aa"),
			      mycolor(display, colors[i]));
	XSelectInput(display, pen_window[i],
		     ButtonPressMask |
		     EnterWindowMask |
		     LeaveWindowMask );
	XSelectInput(display, color_window[i],
		     ButtonPressMask |
		     EnterWindowMask |
		     LeaveWindowMask );
    }

    /* ���ƤΥ�����ɥ���ޥå� */
    XMapWindow(display, window);
    XMapSubwindows(display, window);

    while (1){
	XEvent event;
        XNextEvent(display, &event);
        switch (event.type){

          case Expose:		/* ������ */
	    for ( i=0 ; i<sizeof(pen_window)/sizeof(pen_window[0]) ; i++ ){
		int pen_size = i*3+2;
				/* �ڥ󥵥���������ɥ�������� */
		XSetForeground(display, gc, foreground);
		XFillArc(display, pen_window[i], gc,
			 button_size/2-pen_size/2, button_size/2-pen_size/2,
			 pen_size, pen_size, 0, 360*64);

	    }
            break;

	  case EnterNotify:	/* ������ɥ��˥ݥ��󥿤����ä� */
	    XSetWindowBorder(display, event.xany.window,
			     mycolor(display, "black"));
	    break;

	  case LeaveNotify:	/* ������ɥ�����ݥ��󥿤��Ф� */
	    XSetWindowBorder(display, event.xany.window,
			     mycolor(display, "rgb:aa/aa/aa"));
	    break;

	  case MotionNotify:	/* �ܥ���򲡤��ʤ���ޥ�����ư���� */
	    x1 = event.xbutton.x;
	    y1 = event.xbutton.y;
	    XDrawLine(display, window, gc, x0, y0, x1, y1);
	    x0 = x1; y0 = y1;
	    break;

	  case ButtonPress:	/* �ܥ��󤬲����줿 */

				/* �����Х���ǲ����줿? */
	    if ( event.xany.window == window ){
		x0 = event.xbutton.x;
		y0 = event.xbutton.y;
		XDrawLine(display, window, gc, x0, y0, x0, y0);
		break;
	    }

				/* �ڥ󥵥���/�����򥦥���ɥ���ǲ����줿? */
	    for ( i=0 ; i<sizeof(pen_window)/sizeof(pen_window[0]) ; i++ ){
				/* �ڥ󥵥������ѹ� */
		if ( event.xany.window == pen_window[i] ){
		    current_pen = i*3+2;
		    XSetLineAttributes(display, gc, current_pen,
				       LineSolid, CapRound, JoinMiter);
		    break;
		}
				/* �����ѹ� */
		if ( event.xany.window == color_window[i] ){
		    current_color = mycolor(display, colors[i]);
		    XSetForeground(display, gc, current_color);
		    break;
		}
	    }
	    break;
        }
    }
}
