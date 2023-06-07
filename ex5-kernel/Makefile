all:
	# wcc -S parallel_task.c
	# wasm parallel_task.s
	# wlink -o parallel_task.srec parallel_task.o

	# wcc -S serial_task.c
	# wasm serial_task.s
	# wlink -o serial_task.srec serial_task.o
	
	wasm serial_task.s
	wasm kernel_q4.s 
	wlink -o kernel_q4.srec kernel_q4.o serial_task.o
	
	wasm serial_task.s
	wasm parallel_task.s
	wasm kernel_q5.s 
	wlink -o kernel_q5.srec kernel_q5.o parallel_task.o serial_task.o

	wasm serial_task.s
	wasm parallel_task.s
	wasm kernel_q6.s 
	wlink -o kernel_q6.srec kernel_q6.o parallel_task.o serial_task.o gameSelect.O breakout.O rocks.O

	wasm serial_task.s
	wasm parallel_task.s
	wasm kernel_q7.s 
	wlink -o kernel_q7.srec kernel_q7.o parallel_task.o serial_task.o gameSelect.O breakout.O rocks.O

	wasm serial_task.s
	wasm parallel_task.s
	wasm kernel_q8.s 
	wlink -o kernel_q8.srec kernel_q8.o parallel_task.o serial_task.o gameSelect.O breakout.O rocks.O

	wasm serial_task.s
	wasm parallel_task.s
	wasm kernel_q9.s 
	wlink -o kernel_q9.srec kernel_q9.o parallel_task.o serial_task.o gameSelect.O breakout.O rocks.O

	tar -zcf kaio_lart.tgz parallel_task.c serial_task.c kernel_q*.s

clean:
	rm parallel_task.s parallel_task.o parallel_task.srec
	rm serial_task.s serial_task.o serial_task.srec	
	rm kernel_q3.s kernel_q3.o kernel_q3.srec	
	rm kernel_q4.s kernel_q4.o kernel_q4.srec	
	rm kernel_q5.s kernel_q5.o kernel_q5.srec	
	rm kernel_q6.s kernel_q6.o kernel_q6.srec
	rm kernel_q7.s kernel_q7.o kernel_q7.srec
	rm kernel_q8.s kernel_q8.o kernel_q8.srec	
	rm kernel_q9.s kernel_q9.o kernel_q9.srec	