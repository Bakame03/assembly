sources := $(wildcard src/*.asm)
objects := $(patsubst src/%.asm,%.o,$(sources))

executablesASM := Exo1_somme3Nombres Exo2_plusGrandDe3Nombres Exo3_ComparerNombre Exo4_MultiplierNombres 
executablesC := TD1 Exo1_somme3NombresCpp Exo2_plusGrandDe3NombresCpp Exo3_ComparerNombreCpp Exo4_MultiplierNombresCpp

all: $(executablesASM) $(executablesC)
	rm -fr Build/*.o

$(executablesC): % : %.o
	cd Build && g++ -z noexecstack -no-pie -o $@ $< ../src/util.cpp

$(executablesASM): % : %.o
	cd Build && ld -z noexecstack -o $@ $<

$(objects): %.o : src/%.asm
	cd Build && nasm -f elf64 -o $@ ../$<

clean:
	rm -fr Build/*
