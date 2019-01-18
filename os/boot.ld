OUTPUT_FORMAT("binary")

SECTIONS
{
    . = 0x7c00;
    .boot :
    {
        *(.boot.bootsect)
        *(.boot.head)
        . = ALIGN(512);
        *(.boot.bootsetup)
    }
    . = ALIGN(512);
}
