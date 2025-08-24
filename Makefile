#
# Makefile
#

# Locations


# Make environment
INCLUDES=-I.
CC=gcc
CFLAGS=-I. -c -g -Wall $(INCLUDES)
LINKARGS=-g
LIBS=-lm -lpthread

# Suffix rules
.SUFFIXES: .c .o

.c.o:
		$(CC) $(CFLAGS)  -o $@ $<

# Files
TARGET=main
OBJECT_FILES=	main.o

# Productions
all : $(TARGET)

$(TARGET) : $(OBJECT_FILES)
	$(CC) $(LINKARGS) $(OBJECT_FILES) -o $@ $(LIBS)

clean :
	rm -f $(TARGET) $(OBJECT_FILES)

test: $(TARGET)
	./$(TARGET)

debug: $(TARGET)
	gdb ./$(TARGET)

memdebug: $(TARGET)
	valgrind --leak-check=full ./$(TARGET)