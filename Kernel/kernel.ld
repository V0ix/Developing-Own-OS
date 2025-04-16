ENTRY(kernel_main)

SECTIONS
{
    . = 0x1000;  /* Load address set to 0x1000 (4KB) */

    .text :
    {
        *(.text)
    }

    .data :
    {
        *(.data)
    }

    .bss :
    {
        *(.bss)
    }
}
