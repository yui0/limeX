
cc -DMWPIXEL_FORMAT=MWPF_TRUECOLOR8888 -DSCREEN_WIDTH=800 -DSCREEN_HEIGHT=600 -I../include testmem.c -L../lib -lmwin -lz -lfreetype
