CFLAGS = 
ALL_CFLAGS = -O0 -g $(CFLAGS)

LDFLAGS = 
ALL_LDFLAGS = $(LDFLAGS)

CC=gcc
LD=gcc

# passar como parametro do Makefile o nome do codigo fonte
HEADERS = include/libppc.h
SRC = src/libpcc.c
OBJ = $(SRC:.c=.o)

.PHONY: all clean static shared

VPATH = obj/static obj/shared src

%.o: %.c $(HEADERS)
	$(CC) -I. -Iinclude $(ALL_CFLAGS) -c $< -o $@

all: static shared

static: obj/static/libppc.o
	$(AR) cru $< lib/static/libppc.a

shared: obj/shared/libppc.o
	$(LD) $(ALL_LDFLAGS) $< lib/shared/libppc.so

clean:
	rm -f *.o src/static/*.o src/shared/*.o


