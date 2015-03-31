XINC=-I/usr/X11R6/include
XLIB=`pkg-config --cflags --libs gtk+-2.0` 

CFLAGS=$(XINC) -DX_LOCALE
LIBS=$(XLIB)

TARGET=base hello splash
ALLSRC=base.c hello.c splash.c Makefile
TARFILE=gtk-samples.tar.bz2
target: $(TARGET)

base: base.c
	$(CC) -o base base.c $(CFLAGS) $(LIBS)

hello: hello.c
	$(CC) -o hello hello.c $(CFLAGS) $(LIBS)

splash: splash.c
	$(CC) -o splash splash.c $(CFLAGS) $(LIBS)

tar:
	tar cfj $(TARFILE) $(ALLSRC)

clean:
	rm -f $(TARGET) $(TARFILE)
