CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp.exe

main.i: main.c
	$(CPP) main.c > main.i

.PHONY: hello.txt clean

hello.txt:
	echo "hello world!" > hello.txt

clean:
	rm -f main.i hello.txt