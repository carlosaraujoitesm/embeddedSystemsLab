OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(start)
_estack = 0x20010000;
MEMORY
        {
                /* SmartFusion internal eSRAM */
                ram (rwx) : ORIGIN = 0x20000000, LENGTH = 64k
        }
SECTIONS
        {
        .text :
                  {
                         . = ALIGN(4);
                         *(.text*)
                        . = ALIGN(4);
                        _etext = .;
                  } >ram
        }
        end = .;

