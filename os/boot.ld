OUTPUT_FORMAT("binary")

SECTIONS
{
    .boot :
    {
        *(.boot.bootsect)
    }
    . = ALIGN(512);
}
