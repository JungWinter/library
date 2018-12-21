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

    movw $0xB800, %ax
    movw %ax, %ds

    movb $'H, (0x00)
    movb $0x4A, (0x01)
    movb $'I, (0x02)
    movb $0x4A, (0x03)
    movb $'!, (0x04)
    movb $0x4A, (0x05)

    jmp .
    .space 510 - (. - _start), 0
    .word 0xAA55
