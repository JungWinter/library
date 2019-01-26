all: boot.img

boot.img: bootsect.o
	x86_64-elf-ld -T boot.ld -melf_i386 $^ -o $@

bootsect.o: bootsect.S
	x86_64-elf-gcc -m32 -c -o $@ $<

run: boot.img
	qemu-system-x86_64 -monitor stdio -drive format=raw,file=boot.img \
	-m 256M -no-reboot -no-shutdown -d cpu_reset

clean:
	rm -f bootsect.o boot.img
