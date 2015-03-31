//gcc gtk_hello.c -o gtk_hello `pkg-config --cflags --libs gtk+-2.0`
#include <gtk/gtk.h>

int main(int argc, char *argv[])
{
	GtkWidget *window;

	// 初期化
	gtk_init(&argc, &argv);

	// ウィンドウを定義
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

	// ウィンドウを表示
	gtk_widget_show(window);

	// メインループ開始
	gtk_main();

	return 0;
}
