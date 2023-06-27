.PHONY: all test clean

TARGET=lkomihash.so

all: $(TARGET)

CFLAGS = $(CFLAG)
CFLAGS += -g3 -O2 -Wall -fPIC -shared

$(TARGET): lua-komihash.c
	gcc $(CFLAGS) -o $@ $^

clean:
	rm $(TARGET)

test:
	lua test.lua
