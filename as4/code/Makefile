C := gcc

test: main.o qtree.o
	$(C) -o test main.o qtree.o

main.o: main.c structdef.h
	$(C) -c main.c

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c

clean: 
	rm -f test qtree.o main.o
