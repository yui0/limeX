APPS    = ibm_cairo_logo 

CFLAGS  = -Wall -g
LDFLAGS = -lm

CFLAGS  += `pkg-config gtk+-2.0 --cflags`
LDFLAGS += `pkg-config gtk+-2.0 --libs`

all: $(APPS) 

clean:
	rm -f $(APPS)
