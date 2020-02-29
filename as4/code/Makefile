C := gcc

print: main.o qtree.o
	$(C) -o print main.o qtree.o

main.o: main.c treedef.h
	$(C) -c main.c

qtree.0: qtree.c
	$(C) -c qtree.c

clean: 
	rm -f print qtree.o main.o
