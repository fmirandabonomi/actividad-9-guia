/* Linker script mínimo para RISC-V RV32I */
/* Memoria RAM: 2048 bytes (512x32 bits) en dirección base 0 */

MEMORY
{
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 2048
}

SECTIONS
{
    . = 0x00000000;
    
    .text : {
        *(.text.init)
        *(.text)
        *(.text.*)
    } > RAM
    
    .data : {
        *(.data)
        *(.data.*)
    } > RAM
    
    .bss : {
        *(.bss)
        *(.bss.*)
        *(COMMON)
    } > RAM
}
