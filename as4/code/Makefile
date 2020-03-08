C := gcc

test: main.o qtree.o
	$(C) -o test main.o qtree.o -lm -O2

main.o: main.c structdef.h
	$(C) -c main.c -lm -O2

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c -lm -O2

clean: 
	rm -f test qtree.o main.o
