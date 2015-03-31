//g++ gogo005.cpp -o gogo005 -lX11
/* File name is gogo005.c */
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
#include <iostream>

/*********************************************************/
/*                                                       */
/*     図形処理 お絵書きプログラムの作成                 */
/*                                                       */
/*       Lesson 5. Let's support TEXT INPUT.             */
/*                                                       */
/*                                                       */
/*********************************************************/
//
//    お絵書きクラス(Painter)の定義
//
class cPainter
{

public:
    Display *display;
    GC      gc;
    Window  window;

    cPainter(int x, int y, int width, int height);        // コンストラクタ
    void drawstring(XEvent* event);
};
//    コンストラクタ
cPainter::cPainter(int x, int y, int width, int height)
{
    Window root;
    Font   font;

    display = XOpenDisplay(NULL);
                   // 環境変数Displayに指定のサーバーとの接続確立
    root    = RootWindow(display,0);       // Root WindowのID取得
    gc      = XCreateGC(display,root,0,0); // グラフィックコンテキスト生成
    window  = XCreateSimpleWindow(display,root,x,y,width,height,2,0,1);
                                           // ウィンドウ生成
    XSelectInput(display,window,ButtonPressMask | KeyPressMask);
                                           // イベントマスク
    XMapWindow(display,window);            // ウィンドウをマップして可視状態にする

    //font = XLoadFont(display,"neca24");
    font = XLoadFont(display,"fixed");
    XSetFont(display,gc,font);
}
//    drawstring
//        テキストを表示する
void cPainter::drawstring(XEvent* event)
{
    int    x0,y0;
    int    p;
    char   string[10],text[1024];
    KeySym key;

    x0 = event->xbutton.x;                /* 現在のマウスカーソル位置取得 */
    y0 = event->xbutton.y;

    p       = 0;
    text[0] = '_';
    text[1] = 0x00;
    XDrawString(display,window,gc,x0,y0,text,p+1);

    while (1)  {
      XNextEvent(display,event);
      if (event->type == KeyPress)  {
	string[1]=0;
        if (XLookupString((XKeyEvent*)event,string,10,&key,NULL) == 1)  {
		printf("s:[%s][%02x%02x][ks:%x]\n",string,string[0],string[1],key);
		/* １文字入力 */
          switch(key)  {
          case XK_Escape :          /* ESCで確定する */
            return;
          case XK_BackSpace :       /* BackSpace で１文字前へ戻りたいよね */
          case XK_Tab :
          case XK_Return :
          case XK_Delete :
          case XK_Clear :
          case XK_KP_Enter :
            break;                  /* これらのキーは押下されても何もしない */
          default :
            if (!IsCursorKey(key) && !IsFunctionKey(key) && !IsModifierKey(key)){
              text[p++] = string[0];
              text[p]   = '_';
              text[p+1] = 0x00;
            }
            XDrawString(display,window,gc,x0,y0,text,p+1);
            break;
          }
        }
      }
    }
};
/************/
/*          */
/*   main   */
/*          */
/************/
int main(void)
{
    cPainter painter(100,100,600,600);     // お絵書きソフト生成
    XEvent   event;

    while(1)  {
      XNextEvent(painter.display,&event);   /* イベント取得 */
      switch(event.type)  {
      case ButtonPress :              /* マウスクリック検出 */
        painter.drawstring(&event);
        break;
      }
    }

	return 0;
}
