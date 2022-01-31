all: boot2 boot1

boot1: boot2.exe boot1.asm
	nasm -l boot1.list -DENTRY=0x$(shell nm boot2.exe | grep main | cut -d " " -f 1) boot1.asm

boot2: boot2.exe
	objcopy -j .text* -j .data* -j .rodata* -S -O binary boot2.exe boot2

boot2.exe: boot2_S.o boot2_c.o
	ld  -g -melf_i386 -Ttext 0x10000 -e main -o boot2.exe boot2_S.o boot2_c.o

boot2_S.o: boot2_asm.S
	gcc -g -m32 -c -masm=intel -o boot2_S.o boot2_asm.S

boot2_c.o: boot2_c.c
	gcc -g -m32 -c -o boot2_c.o boot2_c.c

clean:
	rm -f boot2
	rm -f boot1
	rm -f boot2.exe
	rm -f boot2_S.o
	rm -f boot2_c.o
	rm -f boot1.list
	rm -f a.img

install:
	bximage -fd -size=1.44 -q a.img
	/sbin/mkdosfs a.img
	dd if=boot1 of=a.img bs=1 count=512 conv=notrunc
	mcopy -o boot2 a:BOOT2

run:
	qemu-system-i386 -boot a -fda a.img

launch:
	${MAKE} clean
	${MAKE} all
	${MAKE} install
	${MAKE} run
	${MAKE} clean

dubug:
	qemu-system-i386 -S -s -boot a -fda a.img

