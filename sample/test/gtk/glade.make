#!/bin/sh
cc -o glade glade.c `pkg-config --cflags --libs libglade-2.0`
