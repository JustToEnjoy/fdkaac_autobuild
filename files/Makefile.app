PREFIX=/mingw

SOURCES=\
    src/aacenc.c     \
    src/lpcm.c       \
    src/m4af.c       \
    src/main.c       \
    src/metadata.c   \
    src/parson.c     \
    src/progress.c   \
    src/wav_reader.c \
    src/compat_win32.c

OBJS=$(SOURCES:.c=.o)

CPPFLAGS=-DHAVE_CONFIG_H -I.
CFLAGS=-O2

all: fdkaac.exe

fdkaac.exe: $(OBJS)
	$(CC) -o$@ $(OBJS) -lfdk-aac

install: fdkaac.exe
	cp fdkaac.exe $(PREFIX)/bin