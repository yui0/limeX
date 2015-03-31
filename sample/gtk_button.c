//gcc -o gtk_button gtk_button.c `pkg-config --cflags --libs gtk+-2.0`
#include <stdlib.h>
#include <gtk/gtk.h>

/* 画像とラベルを格納した hbox を新規に生成して、
 * そのボックスを返します。*/

static GtkWidget *xpm_label_box( gchar     *xpm_filename,
                                 gchar     *label_text )
{
    GtkWidget *box;
    GtkWidget *label;
    GtkWidget *image;

    /* 画像とラベルを格納するボックスを生成します。*/
    box = gtk_hbox_new (FALSE, 0);
    gtk_container_set_border_width (GTK_CONTAINER (box), 2);

    /* 画像データを取得します。*/
    image = gtk_image_new_from_file (xpm_filename);

    /* ボタンのラベルを生成します。*/
    label = gtk_label_new (label_text);

    /* 画像とラベルをボックスにパッキングします。*/
    gtk_box_pack_start (GTK_BOX (box), image, FALSE, FALSE, 3);
    gtk_box_pack_start (GTK_BOX (box), label, FALSE, FALSE, 3);

    gtk_widget_show (image);
    gtk_widget_show (label);

    return box;
}

/* おきまりのコールバック関数です。*/
static void callback( GtkWidget *widget,
                      gpointer   data )
{
    g_print ("Hello again - %s was pressed\n", (char *) data);
}

int main( int   argc,
          char *argv[] )
{
    /* GtkWidget はウィジットの型を格納します。*/
    GtkWidget *window;
    GtkWidget *button;
    GtkWidget *box;

    gtk_init (&argc, &argv);

    /* 新しいウィンドウを生成します。*/
    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);

    gtk_window_set_title (GTK_WINDOW (window), "Pixmap'd Buttons!");

    /* 全てのウィンドウに対してこの処理を実施するのは良い考えです。*/
    g_signal_connect (G_OBJECT (window), "destroy",
	              G_CALLBACK (gtk_main_quit), NULL);

    g_signal_connect (G_OBJECT (window), "delete_event",
	 	      G_CALLBACK (gtk_main_quit), NULL);

    /* ウィンドウのボーダー幅をセットします。*/
    gtk_container_set_border_width (GTK_CONTAINER (window), 10);

    /* 新しいボタンを生成します。*/
    button = gtk_button_new ();

    /* ボタンが発行するシグナル "clicked" をコールバックに接続します。*/
    g_signal_connect (G_OBJECT (button), "clicked",
		      G_CALLBACK (callback), (gpointer) "cool button");

    /* これはボックスを生成する関数呼び出しです。*/
    box = xpm_label_box ("info.xpm", "cool button");

    /* 全てのウィジットをパッキングして表示します。*/
    gtk_widget_show (box);

    gtk_container_add (GTK_CONTAINER (button), box);

    gtk_widget_show (button);

    gtk_container_add (GTK_CONTAINER (window), button);

    gtk_widget_show (window);

    /* gtk_main の中で一休みして、このプログラムが動き出す楽しみを待つことにします！ */
    gtk_main ();

    return 0;
}
