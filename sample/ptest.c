/* ptest.cc */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>

unsigned long GetColor( Display* dis, char* color_name )
{
  Colormap cmap;
  XColor near_color, true_color;

  cmap = DefaultColormap( dis, 0 );
  XAllocNamedColor( dis, cmap, color_name, &near_color, &true_color );
  return( near_color.pixel );
}


int main( void )
{
  Display* dis;
  Window win;
  Pixmap pix;
  XSetWindowAttributes att;
  GC gc;
  XEvent ev;

  int i;

  dis = XOpenDisplay( NULL );
  win = XCreateSimpleWindow( dis, RootWindow(dis,0), 100, 100,
    256, 256, 3, WhitePixel(dis,0), BlackPixel(dis,0) );
  pix = XCreatePixmap( dis, win, 32, 32, 8 );

  att.backing_store = WhenMapped;
  XChangeWindowAttributes( dis, win, CWBackingStore, &att );

  gc = XCreateGC( dis, DefaultRootWindow(dis), 0, 0 );
  XSetGraphicsExposures( dis, gc, False );

  XSetForeground( dis, gc, GetColor( dis, "red")  );
  XFillRectangle( dis, (Drawable)pix, gc, 0, 0, 32, 32 );

  XSetForeground( dis, gc, GetColor( dis, "green")  );
  //XFillArc( dis, pix, gc, 0, 0, 32, 32, 0, 360*64 );

  XSelectInput( dis, win, ExposureMask );
  XMapWindow( dis, win );

  do{
    XNextEvent( dis, &ev);
  }while( ev.type != Expose );

  for( i=0 ; i<5 ; i++ ){
    XCopyArea( dis, pix, win, gc, 0, 0, 32, 32, i*48+16, 112 );
  }
  XFlush( dis );

  getchar();
  XDestroyWindow( dis , win );
  XCloseDisplay( dis );

  return(0);
}
