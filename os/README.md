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
$ make clean && make run
```
