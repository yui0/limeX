all:
	g++ -I../include/ -c cannyedgedetect.cpp
	gcc -I../include/ -c test.c
	g++ -I../include/ -o test test.o cannyedgedetect.o -L../lib -lnano-X -lfreetype -lX11 -ljpeg -lpng
	rm test.o cannyedgedetect.o

