CROSS   := arm-none-eabi-
AS      := $(CROSS)as
LD      := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
ASFLAGS = -mcpu=cortex-m0 -mthumb -g


all: main.hex test.elf

test.o :test.s
	$(AS) $(ASFLAGS) test.s -asghl=test.lst -o test.o

test.elf: test.o
	$(LD) test.o -T linker_script.ld --cref -Map test.map -nostartfiles

main.o :main.s
	$(AS) $(ASFLAGS) main.s -o main.o

main.elf: main.o
	$(LD) main.o -T linker_script.ld -nostartfiles -o main.elf

main.hex: main.elf
	$(OBJCOPY) -O ihex main.elf main.hex

clean:
	rm *.o *.hex *.map *.lst *.elf
