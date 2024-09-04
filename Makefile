CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp.exe
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc.exe
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as.exe

main.o : main.s
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