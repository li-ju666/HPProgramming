C := gcc

test: main.o qtree.o
	$(C) -o test main.o qtree.o -lm -Ofast

main.o: main.c structdef.h
	$(C) -c main.c -lm -Ofast

qtree.0: qtree.c structdef.h
	$(C) -c qtree.c -lm -Ofast

clean: 
	rm -f test qtree.o main.o
