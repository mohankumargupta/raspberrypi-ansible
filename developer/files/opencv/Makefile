SOURCES=example.cpp
EXECUTABLE=example
CC=g++
CGFLAGS=$(shell pkg-config --cflags opencv)
LIBS=$(shell pkg-config --libs opencv)


all: $(SOURCES)
	$(CC) $(CGFLAGS) $(LIBS) -o $(EXECUTABLE) $(SOURCES) 

run:
	./$(EXECUTABLE)