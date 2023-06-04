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
clean:
	rm parallel_task.s parallel_task.o parallel_task.srec
	rm serial_task.s serial_task.o serial_task.srec	
	rm kernel_q3.s kernel_q3.o kernel_q3.srec	
	rm kernel_q4.s kernel_q4.o kernel_q4.srec	
	