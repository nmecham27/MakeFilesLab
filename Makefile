CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp.exe
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc.exe
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as.exe
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld

SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.o : %.s
	$(AS) $< -o $@

%.s : %.i
	$(CC) -S $<

%.i : %.c
	$(CPP) $< > $@

.PHONY: hello.txt clean
.SUFFIXES:

hello.txt:
	echo "hello world!" > hello.txt

clean:
	rm -f main.i main.s main.o hello.txt