.section ".boot.head"

.global _gdtr
_gdtr:
    .word 0x18
    .long 0x9000
_gdt.head:
    gdt.null:
        .word 0, 0, 0, 0
    gdt.code:
        .word 0xffff // limit [15:0]
        .word 0 // base [15:0]
        .byte 0 // bae [23:16]
        .byte 0x9A // P=1, DPL=0, read/exec
        .byte 0xCF // G=1, D=1, L=0, Limit [19:16]
        .byte 0x00 // base [31:24]
    gdt.data:
        .word 0xffff // limit [15:0]
        .word 0 // base [15:0]
        .byte 0 // bae [23:16]
        .byte 0x92 // P=1, DPL=0, write/exec
        .byte 0xCF // G=1, D=1, L=0, Limit [19:16]
        .byte 0x00 // base [31:24]
_gdt.end:
