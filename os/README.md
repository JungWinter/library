# OS Study

## Install

```bash
$ HOMEBREW_MAKE_JOB=4 brew install https://raw.githubusercontent.com/Luavis/homebrew-gcc_cross_compilers/master/x86_64-elf-gcc.rb
$ x86_64-elf-gcc --version
x86_64-elf-gcc (GCC) 7.1.0
Copyright (C) 2017 Free Software Foundation, Inc.
$ brew install qemu
$ brew install hexyl
```

## Run

```bash
$ x86_64-elf-gcc bootsect.S -m32 -c -o boot
$ x86_64-elf-objdump -D boot
이상한 output
$ x86_64-elf-objdump -M i8086 -D boot
정상 output
$ x86_64-elf-ld -T boot.ld boot -o boot.img
x86_64-elf-ld: i386 architecture of input file 'boot' is incompatible with i386:x86-64 output
$ x86_64-elf-gcc -c -o boot bootsect.S
$ x86_64-elf-ld -T boot.ld boot -o boot.img
$ qemu-system-x86_64 -monitor stdio -drive format=raw,file=boot.img -m 256M
```
