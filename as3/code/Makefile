C := gcc
CFLAGS += -Wall -O2 -g -I/opt/X11/include
LDFLAGS = -L. -L/opt/X11/lib -lX11 -lm

galsim: main.o helperFunc.o graphics.o
	$(C) -o galsim main.o helperFunc.o graphics.o -L. $(LDFLAGS)

main.o: main.c main.ih graphics.h
	$(C) $(CFLAGS) -c main.c -lm

helperFunc.o: helperFunc.c main.ih graphics.h
	$(C) $(CFLAGS) -c helperFunc.c -lm

graphics.o: graphics.c graphics.h
	$(C) $(CFLAGS) -c graphics.c -lm

clean:
	rm -f galsim main.o helperFunc.o graphics.o