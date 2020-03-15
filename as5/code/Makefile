C := gcc
FLAG := -Ofast

test: main.o qtree.o
	$(C) -o test main.o qtree.o -lm -lpthread $(FLAG)

main.o: main.c structdef.h
	$(C) -c main.c -lm $(FLAG)

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c -lm $(FLAG)

clean: 
	rm -f galsim qtree.o main.o
