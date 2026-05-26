sources := $(wildcard src/*.asm)
objects := $(patsubst src/%.asm,%.o,$(sources))

executables := TD2a TD2b TD2c TD2d Exo1_sommeNombres Exo2_pairsImpairs Exo3_moyenne5Nombres Exo4_sommeNombresPile Exo5_sommeIndicesTableau Exo6_diviserNombreFlottant

all: $(executables)
	rm -fr Build/*.o

$(executables): % : %.o
	cd Build && g++ -z noexecstack -no-pie -o $@ $< ../src/util.cpp

$(objects): %.o : src/%.asm
	cd Build && nasm -f elf64 -o $@ ../$<

clean:
	rm -fr Build/*
