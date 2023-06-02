all:
	wcc -S cswitches.c
	wasm cswitches.s
	wlink -o cswitches.srec cswitches.o
	
clean:
	rm cswitches.s cswitches.o cswitches.srec
	