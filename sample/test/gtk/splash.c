#include <gtk/gtk.h>

int main(int argc, char *argv[])
{
	GtkWidget *window;
	GtkWidget *image;

	gtk_init (&argc, &argv);

	window = gtk_window_new (GTK_WINDOW_TOPLEVEL);

	//image = gtk_image_new_from_file ("large-computer.png");
	//image = gtk_image_new_from_file ("tucano.jpg");
	image = gtk_image_new_from_file ("polished_earth.gif");
	gtk_container_add (GTK_CONTAINER (window), image);
	gtk_widget_show (image);

	gtk_widget_show (window);

	gtk_main ();

	return 0;
}
