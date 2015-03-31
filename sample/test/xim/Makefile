XINC=-I/usr/X11R6/include
XLIB=-L/usr/X11R6/lib -lX11 

CFLAGS=$(XINC) -DX_LOCALE
LIBS=$(XLIB)

TARGET=xim1 xim2 xim3 xim4
ALLSRC=xim1.c xim2.c xim3.c xim4.c Makefile README.txt
TARFILE=xim-samples.tar.gz
target: $(TARGET)

xim1: xim1.c 
	$(CC) -o xim1 xim1.c $(CFLAGS) $(LIBS)
xim2: xim2.c 
	$(CC) -o xim2 xim2.c $(CFLAGS) $(LIBS)
xim3: xim3.c 
	$(CC) -o xim3 xim3.c $(CFLAGS) $(LIBS)
xim4: xim4.c 
	$(CC) -o xim4 xim4.c $(CFLAGS) $(LIBS)

tar:
	tar cfz $(TARFILE) $(ALLSRC)

clean:
	rm -f $(TARGET) $(TARFILE)
