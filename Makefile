
FLAGS = -Os -fno-rtti -falign-functions=4 -ffunction-sections -fdata-sections -fno-exceptions -gnatec=restrictions.adc
CARGS = --target=xtensa -mcpu=esp8266
RTS = --RTS=ada-runtime/build/arduino_esp8266/obj

all: ../ada_runtime src/esp8266/esp8266-ada-example.a

src/esp8266/esp8266-ada-example.a: main.o b~main.o | src/esp8266
	llvm-ar rcs $@ $^

main.o main.ali: src/main.adb
	llvm-gcc -c $(CARGS) $(FLAGS) $(RTS) $< -o $@

b~main.adb: main.ali
	llvm-gnatbind $(RTS) -x main.ali

b~main.o: b~main.adb
	llvm-gcc -c $(CARGS) $(FLAGS) $(RTS) $< -o $@

src/esp8266:
	mkdir -p src/esp8266

../ada_runtime:
	ln -s $(PWD)/ada-runtime/build/arduino_esp8266 ../ada_runtime

.PHONY: clean
clean:
	rm -f main.* b~main.* src/esp8266/esp8266-ada-example.a
