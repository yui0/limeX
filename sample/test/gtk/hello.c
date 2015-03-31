#include <gtk/gtk.h>

/* これはコールバック関数です。この例では、引数 data を無視しています。
 * さらにいろいろなコールバック関数が下にあります。*/
static void hello( GtkWidget *widget,
                   gpointer   data )
{
    g_print ("Hello World\n");
}

static gboolean delete_event( GtkWidget *widget,
                              GdkEvent  *event,
                              gpointer   data )
{
    /* "delete_event" のシグナル・ハンドラから FALSE が返されると、
     * GTK はシグナル "destroy" を発行します。
     * 返り値が TRUE の場合は、ウィンドウを destroy したくないことを意味します。
     * これは '本当に終了してもよろしいですか？' といった類のダイアログを
     * ポップアップさせる場合に便利です。*/

    g_print ("delete event occurred\n");

    /* TRUE を FALSE に変更すると、"delete_event" を使って
     * メイン・ウィンドウが destroy されます。*/

    return TRUE;
}

/* もう一つのコールバック関数です。*/
static void destroy( GtkWidget *widget,
                     gpointer   data )
{
    gtk_main_quit ();
}

int main( int   argc,
          char *argv[] )
{
    /* GtkWidget はいろいろなウィジットを格納する型です。 */
    GtkWidget *window;
    GtkWidget *button;
    
    /* これは全ての GTK アプリケーションの中で呼び出されます。
     * 引数はコマンド・ラインからパースされ、
     * アプリケーションへ返されます。*/
    gtk_init (&argc, &argv);
    
    /* 新しいウィンドウを生成します。*/
    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
    
    /* ウィンドウにシグナル "delete_event"
     * (これはウィンドウ・マネージャが発行するシグナルで、
     * 通常は "close" コントロールまたは "titlebar" コントロールに発行されます)
     * が発行されたら、そのシグナルに対して上で定義した関数 delete_event() を呼び出します。
     * このコールバック関数へ NULL を引き渡しています
     * (コールバック関数の中で、この NULL は無視されます)。 */
    g_signal_connect (G_OBJECT (window), "delete_event",
		      G_CALLBACK (delete_event), NULL);
    
    /* ここで、イベント "destroy" をシグナル・ハンドラに接続します。
     * このイベントは、ウィンドウ上で gtk_widget_destroy() 関数を呼び出すか、
     * または "delete_event" コールバックの返り値が FALSE の場合に発行されます。*/
    g_signal_connect (G_OBJECT (window), "destroy",
		      G_CALLBACK (destroy), NULL);
    
    /* ウィンドウの境界線の幅をセットします。 */
    gtk_container_set_border_width (GTK_CONTAINER (window), 10);
    
    /* ラベル "Hello World" が付いた新しいボタンを生成します。*/
    button = gtk_button_new_with_label ("Hello World");
    
    /* ボタンがシグナル "clicked" を受け取ったら、
     * NULL を引数として hello() 関数を呼び出します。
     * hello() 関数は上記で定義しています。*/
    g_signal_connect (G_OBJECT (button), "clicked",
		      G_CALLBACK (hello), NULL);
    
    /* イベント "clicked" が発行されたら、gtk_widget_destroy(window) を呼び出して
     * ウィンドウを destroy します。
     * 繰り返しになりますが、"destroy" シグナルはここ、
     * またはウィンドウ・マネージャから発行されます。*/
    g_signal_connect_swapped (G_OBJECT (button), "clicked",
			      G_CALLBACK (gtk_widget_destroy),
                              G_OBJECT (window));
    
    /* これはボタンをウィンドウ (GTK コンテナの一つ) の中にパックします。*/
    gtk_container_add (GTK_CONTAINER (window), button);
    
    /* 最後のステップとして、新しく生成したこのウィジットと... */
    gtk_widget_show (button);
    
    /* ウィンドウを表示します。*/
    gtk_widget_show (window);
    
    /* 全ての GTK アプリケーションで gtk_main() 関数を呼び出す必要があります。
     * 制御はここで終了して、
     * イベント (キー押下やマウスのイベントなど) 発行待ちになります。*/
    gtk_main ();
    
    return 0;
}
