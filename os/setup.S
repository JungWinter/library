.code16
.text

.global _setup
.section ".boot.bootsetup", "ax"
_setup:
    movw $0xB800, %ax
    movw %ax, %ds

    movb $'H, (0x00)
    movb $0x4B, (0x01)
    movb $'I, (0x02)
    movb $0x4B, (0x03)
    movb $'!, (0x04)
    movb $0x4B, (0x05)

    // Enable A20 gate
    mov $0x2401, %ax
    int $0x15

    jmp .

.space 512 - (. - _setup), 0
