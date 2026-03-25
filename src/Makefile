GCC=g++
FLAGS=-std=c++11 -Wall -Wextra
TARGET=app

all: $(TARGET)

$(TARGET): main.o
	$(GCC) $(FLAGS) main.o -o $(TARGET)

main.o: main.cpp
	$(GCC) $(FLAGS) -c main.cpp

clean:
	rm -f $(TARGET) main.o
