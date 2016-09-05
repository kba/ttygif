CC = gcc
CFLAGS = -O2 -Wall
VERSION = 1.0.8

PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
	CFLAGS += -DOS_DARWIN
endif
ifeq ($(UNAME), Linux)
	CFLAGS += -DOS_LINUX
endif

all: ttygif

ttygif: ttygif.o io.o string_builder.o utils.o
	$(CC) $(CFLAGS) -o ttygif ttygif.o io.o string_builder.o utils.o

install: ttygif
	mkdir -p $(BINDIR)
	cp ttygif $(BINDIR)/ttygif

uninstall:
	rm $(BINDIR)/ttygif

clean:
	rm -f *.o ttygif ttyrecord *~
