C := gcc
FLAG := -lm -Wall

all: qr check generate

qr: main.c
	$(C) main.c -o qr $(FLAG)

check: check.c
	$(C) check.c -o check $(FLAG)

generate: generate.c
	$(C) generate.c -o generate $(FLAG)

clean: 
	rm -f qr check generate

cleandata: 
	rm -f input.dat matQ.dat matR.dat
