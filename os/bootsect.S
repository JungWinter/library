.code16
.text

.global _start
.section ".boot.bootsect", "ax"
_start:
    cli
    // init stack
    movw $0x0000, %ax
    movw %ax, %ss

    movw $0xFFFF, %sp
    movw $0xFFFF, %bp

    // read 1 sector
    // sector 1 to 0x9000
    // es: 0x9000 bx: 0x0000
    movb $0x42, %ah
    movb $0x80, %dl
    movw $_setup_lba, %si
    int $0x13
    ljmp $0x0900, $0x0200 // setup

_setup_lba:
    .byte 0x10 // size
    .byte 0
    .word 0x02 // size to read
    .word 0x0000 // offset
    .word 0x0900 // segment
    .quad 0x1 // LBA upper

    .space 510 - (. - _start), 0
    .word 0xAA55
