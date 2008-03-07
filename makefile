CWARNS = -Wall -Wextra -pedantic \
        -Waggregate-return \
        -Wcast-align \
        -Wmissing-prototypes \
        -Wnested-externs \
        -Wpointer-arith \
        -Wshadow \
        -Wwrite-strings \
        -Wcast-qual

LUADIR = /home/roberto/prj/sw/oldlua/lua-5.1.2/src
COPT = -O2 -DNDEBUG
CFLAGS = $(CWARNS) -ansi -I$(LUADIR) -shared -o lpeg.so
CC = gcc

lpeg.so: lpeg.c
	$(CC) $(COPT) $(CFLAGS) lpeg.c

deb:	lpeg.c	
	$(CC) -g $(CFLAGS) lpeg.c; touch deb; rm -f opt

opt:	lpeg.c	
	$(CC) $(COPT) $(CFLAGS) lpeg.c; touch opt; rm -f deb

test: test.lua re.lua lpeg.so
	test.lua
