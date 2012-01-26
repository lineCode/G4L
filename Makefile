CC=clang
CFLAGS=-fPIC -march=core2 --std=c99 -fomit-frame-pointer -Wall -Wextra -O2 -DNDEBUG
LDFLAGS=-lc -lglut -lGLEW -lGL

target=G4L.so
sources=$(wildcard src/*.c)
objects=$(sources:.c=.o)

.PHONY: clean all

all: $(target)

$(target): $(objects)
	$(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDFLAGS)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm $(objects) $(target)
