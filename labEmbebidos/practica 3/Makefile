CROSS   := arm-none-eabi-
AS      := $(CROSS)as
CC      := $(CROSS)gcc
LD      := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
ASFLAGS = -mcpu=cortex-m0 -mthumb -g
HEADER = include/my_samd21g18a.h


dummy.elf: dummy.o
	$(LD) dummy.o -T linker_script.ld --cref -Map dummy.map -nostartfiles -o dummy.elf
	$(OBJCOPY) -O ihex dummy.elf dummy.hex
	
dummy.o :dummy2.s
	$(AS) $(ASFLAGS) dummy2.s -o dummy.o

clean:
	rm *.o *.hex *.map *.lst *.elf
