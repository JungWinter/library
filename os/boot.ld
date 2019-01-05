OUTPUT_FORMAT("binary")

SECTIONS
{
    . = 0x7c00;
    .boot :
    {
        *(.boot.bootsect)
        *(.boot.bootsetup)
    }
    . = ALIGN(512);
}
