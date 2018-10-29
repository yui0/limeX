//gcc -o gtk_edit gtk_edit.c `pkg-config --cflags --libs gtk+-2.0`
/*メニューバーとスクロール*/
#include <gtk/gtk.h>

int main(int argc, char *argv[])
{

 	GtkWidget *hbox;
	GtkWidget *vbox;
	GtkWidget *window;
	GtkWidget *scrolled_window;
	GtkWidget *text;
	GtkWidget *menu_bar;
	GtkWidget *vscroller;
	GtkWidget *hscroller;
        GtkWidget *open_text;
        GtkWidget *save_text;
	GtkWidget *edit;
        GtkWidget *file_menu;
	GtkWidget *edit_menu;
        GtkWidget *config_menu;
	GtkWidget *sub_item;
	GtkWidget *file_item;
        GtkWidget *edit_item;
        GtkWidget *config_item;

  gtk_set_locale();
  gtk_init(&argc, &argv);

  /* ウィンドウを作って、閉じた時に gtk_main_quit を呼ぶように設定 */
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(gtk_main_quit),
		     NULL);

  vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(window), vbox);
  gtk_widget_show(vbox);

gtk_widget_show(window);

 /* メニューバーを作る */
menu_bar = gtk_menu_bar_new ();
gtk_box_pack_start(GTK_BOX(vbox), menu_bar, FALSE, FALSE, 0);
gtk_widget_show(menu_bar);

  /* メニューを作る */
  /*ファイル*/
  file_menu = gtk_menu_new();

  /* ファイルメニューをくっつけるメニューアイテムを作る */
  file_item = gtk_menu_item_new_with_label("ファイル");
  gtk_menu_bar_append(GTK_MENU_BAR(menu_bar), file_item);
  gtk_widget_show(file_item);

  /* (1)ファイルメニューにアイテムを追加 */
  sub_item = gtk_menu_item_new_with_label("開く");
  gtk_menu_append(GTK_MENU(file_menu), sub_item);

 /*open_text*/
gtk_signal_connect(GTK_OBJECT(sub_item),"activate",
                   GTK_SIGNAL_FUNC(open_text),
                   edit);
gtk_widget_show(sub_item);

sub_item = gtk_menu_item_new_with_label("保存");
gtk_menu_append(GTK_MENU(file_menu), sub_item);
gtk_signal_connect(GTK_OBJECT(sub_item),"activate",
                   GTK_SIGNAL_FUNC(save_text),
                   edit);
gtk_widget_show(sub_item);

  sub_item = gtk_menu_item_new_with_label("終了");
  gtk_menu_append(GTK_MENU(file_menu), sub_item);
   gtk_widget_show(sub_item);

  /* ファイルメニューアイテムにファイルメニューをくっつける */
  gtk_menu_item_set_submenu(GTK_MENU_ITEM(file_item), file_menu);


/*２つ目のメニュー(編集)*/
 edit_menu = gtk_menu_new();

  edit_item = gtk_menu_item_new_with_label("編集");
  gtk_menu_bar_append(GTK_MENU_BAR(menu_bar), edit_item);
  gtk_widget_show(edit_item);

   sub_item = gtk_menu_item_new_with_label("コピー");
  gtk_menu_append(GTK_MENU(edit_menu), sub_item);
  gtk_widget_show(sub_item);

  gtk_menu_item_set_submenu(GTK_MENU_ITEM(edit_item), edit_menu);


/*３つ目のメニュー (設定)*/

 config_menu = gtk_menu_new();

  config_item = gtk_menu_item_new_with_label("設定");
  gtk_menu_bar_append(GTK_MENU_BAR(menu_bar), config_item);
  gtk_widget_show(config_item);

   sub_item = gtk_menu_item_new_with_label("右よせ");
  gtk_menu_append(GTK_MENU(config_menu), sub_item);
  gtk_widget_show(sub_item);

  gtk_menu_item_set_submenu(GTK_MENU_ITEM(config_item), config_menu);



  /* メニューバーにファイルメニューアイテムをくっつける */
  /**gtk_menu_bar_append(GTK_MENU_BAR(menu_bar), file_item);*/



  /* テキストウィジェットをのせるスクロールウィンドウを作る */
  scrolled_window = gtk_scrolled_window_new(NULL, NULL);
  gtk_box_pack_start(GTK_BOX(vbox), scrolled_window, TRUE, TRUE, 0);
  gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW(scrolled_window),
				  GTK_POLICY_NEVER,
				  GTK_POLICY_ALWAYS);
  gtk_widget_show (scrolled_window);

  text = gtk_text_new(NULL, NULL);
  gtk_text_set_editable(/*GTK_TEXT(*/text/*)*/, TRUE);
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(gtk_main_quit),
		     NULL);

  gtk_container_add(GTK_CONTAINER(scrolled_window), text);
  gtk_widget_grab_focus(text);
  gtk_widget_show(text);


  /* mainループ */
  gtk_main();
  return;
}
