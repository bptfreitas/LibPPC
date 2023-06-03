CFLAGS = 
ALL_CFLAGS = -O0 -g $(CFLAGS)

LDFLAGS = 
ALL_LDFLAGS = $(LDFLAGS)

CC=gcc
LD=gcc

# passar como parametro do Makefile o nome do codigo fonte
HEADERS = include/libppc.h
SRC = src/libpcc.c matrixmult.c
OBJ = $(SRC:.c=.o)

.PHONY: all clean

%.o: %.c $(HEADERS)
	$(CC) -I. -Iinclude $(ALL_CFLAGS) -c $< -o $@

all: $(OBJ)
	gcc $(LDFLAGS) $? -o matrixmult


clean:
	rm -f *.o src/*.o matrixmult 


