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
    movw $0x0201, %ax // %ah=2h: read from disk
    // CHS mode
    movw $0x0900, %bx
    movw %bx, %es
    movw $0x0000, %bx
    movb $0x00, %ch // cylinder 0
    movb $0x00, %dh // head 0
    movb $0x02, %cl // sector 2
    movb $0x80, %dl // drive HDD 1
    int $0x13
    ljmp $0x0900, $0x0000

    .space 510 - (. - _start), 0
    .word 0xAA55
