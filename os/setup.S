.code16
.text

.global _setup
.section ".boot.bootsetup", "ax"
_setup:

    // gdtr load
    movw $0, %ax
    movw %ax, %ds
    lgdt (0x9000)

    movw $0xB800, %ax
    movw %ax, %ds

    movb $'B, (0x00)
    movb $0x0A, (0x01)
    movb $'O, (0x02)
    movb $0x0B, (0x03)
    movb $'O, (0x04)
    movb $0x0C, (0x05)
    movb $'T, (0x06)
    movb $0x0D, (0x07)
    movb $'!, (0x08)
    movb $0x0E, (0x09)

    // Enable A20 gate
    movw $0x2401, %ax
    int $0x15

    jmp .

.space 512 - (. - _setup), 0
