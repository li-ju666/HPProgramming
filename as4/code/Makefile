C := gcc
FLAG := -Ofast -std=c99

test: main.o qtree.o
	$(C) -o test main.o qtree.o -lm $(FLAG)

main.o: main.c structdef.h
	$(C) -c main.c -lm $(FLAG)

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c -lm $(FLAG)

clean: 
	rm -f test qtree.o main.o
