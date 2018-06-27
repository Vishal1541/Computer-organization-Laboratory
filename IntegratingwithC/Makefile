run: NASMcompile GCCcompile
	./A2

NASMcompile: sumAdd.asm
	nasm -f elf sumAdd.asm 

GCCcompile: A2.c sumAdd.o
	gcc -m32 -o A2 A2.c sumAdd.o    

install:
	sudo apt-get install libx32gcc-4.8-dev
	sudo apt-get install libc6-dev-i386

clean:
	rm A2.o sumAdd.o
