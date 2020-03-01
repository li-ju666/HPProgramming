C := gcc

test: main.o qtree.o
	$(C) -o test main.o qtree.o -lm

main.o: main.c structdef.h
	$(C) -c main.c -lm

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c -lm

clean: 
	rm -f test qtree.o main.o
