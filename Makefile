#CFLAGS = -std=c99 -DNDEBUG -D_POSIX_C_SOURCE=200809L -Wall -Wextra -Wpedantic -Wshadow `pkg-config --cflags libgit2`
CFLAGS = -std=c99 -DNDEBUG -D_POSIX_C_SOURCE=200809L -Wall -Wextra -Wpedantic -Wshadow -I/usr/local/include

OBJS = socket.o ftp.o path.o

#LDFLAGS = `pkg-config --libs libgit2`
LDFLAGS = -lgit2 -L/usr/local/lib

.SUFFIXES :
.SUFFIXES : .o .c

gitftp : gitftp.c $(OBJS)
	$(CC) $(CFLAGS) -o $@ gitftp.c $(LDFLAGS) $(OBJS)

socket.o : socket.c socket.h
ftp.o : ftp.c ftp.h
path.o : path.c path.h
