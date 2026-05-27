sources := $(wildcard src/*.asm)
objects := $(patsubst src/%.asm,%.o,$(sources))

executables := exo1 exo2 exo3

all: $(executables)
	rm -fr Build/*.o

$(executables): % : %.o
	cd Build && g++ -z noexecstack -no-pie -o $@ $< ../src/util.cpp

$(objects): %.o : src/%.asm
	cd Build && nasm -f elf64 -o $@ ../$<

clean:
	rm -fr Build/*
