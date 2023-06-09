.text



.global main
main:   
    .equ timer_control,     0x72000
    .equ timer_load,        0x72001
    .equ timer_interrupt,   0x72003 
    # setup pcb registers 0-17
    .equ pcb_link,  0
    .equ pcb_reg1,  1    
    .equ pcb_reg2,  2 
    .equ pcb_reg3,  3
    .equ pcb_reg4,  4
    .equ pcb_reg5,  5
    .equ pcb_reg6,  6
    .equ pcb_reg7,  7
    .equ pcb_reg8,  8
    .equ pcb_reg9,  9 
    .equ pcb_reg10, 10
    .equ pcb_reg11, 11
    .equ pcb_reg12, 12
    .equ pcb_reg13, 13
    .equ pcb_sp,    14
    .equ pcb_ra,    15
    .equ pcb_ear,   16
    .equ pcb_cctrl, 17
    .equ pcb_timeslice, 18

    movsg $2, $evec             #Copy the old handler’s address to $2
    sw $2, old_handler($0)      #Save it to memory
    la $2, handler              #Get the address of our handler
    movgs $evec, $2             #And copy it into the $evec register

    addi $5, $0, 0x4d           #Unmask IRQ2, KU=1, OKU=1, IE=0,OIE=1 

#===========Setup the pcb for Serial Task ================
    la $1, serial_pcb           #Setup the pcb for task 1 

    la $2, parallel_pcb 
    sw $2, pcb_link($1)         #Setup the link field 

    la $2, serial_stack         #Setup the stack pointer
    sw $2, pcb_sp($1)

    la $2, serial_main          #Setup the Sear field
    sw $2, pcb_ear ($1) 

    addi $6, $0, 0x2
    sw $6, pcb_timeslice($1)

    sw $5, pcb_cctrl($1)        #Setup the $cctrl field

    la $1, serial_pcb
    sw $1, current_task($0)    

#===========Setup the pcb for Parallel Task ================
    la $1, parallel_pcb         

    la $2, games_pcb 
    sw $2, pcb_link($1)         #Setup the link field 

    la $2, parallel_stack         #Setup the stack pointer
    sw $2, pcb_sp($1)

    la $2, parallel_main          #Setup the Sear field
    sw $2, pcb_ear ($1)

    addi $6, $0, 0x2
    sw $6, pcb_timeslice($1)

    sw $5, pcb_cctrl($1)        #Setup the $cctrl field

    la $1, parallel_pcb
    sw $1, current_task($0)  

    #===========Setup the pcb for Games Task ================
    la $1, games_pcb           #Setup the pcb for task 1 

    la $2, serial_pcb 
    sw $2, pcb_link($1)         #Setup the link field 

    la $2, games_stack         #Setup the stack pointer
    sw $2, pcb_sp($1)

    la $2, gameSelect_main          #Setup the Sear field
    sw $2, pcb_ear ($1)    
    addi $6, $0, 0x2
    sw $6, pcb_timeslice($1)

    addi $6, $0, 0x4
    sw $6, pcb_timeslice($1)
    
    sw $5, pcb_cctrl($1)        #Setup the $cctrl field

    la $1, games_pcb
    sw $1, current_task($0)  
#===========END PCB setups=======================

    movsg $2, $cctrl            #Get val of cctrl
    andi $2, $2, 0x000f         #Disable interrupts
    ori $2, $2, 0x42            #Enable irq2
    movgs $cctrl, $2            #store back in cctrl

    sw $0, timer_interrupt($0)  # Make sure there are no old interrupts still hanging around
    addi $11, $0, 24            # Put our auto load value in
    sw $11, timer_load($0)
    addi $11, $0, 0x3           # Enable the timer and autorestart
    sw $11, timer_control($0)

    jal load_context
   
handler:
    movsg $13, $estat       #Get the value of the exception status register
    andi $13, $13, 0xffb0   #Check if interrupt we don’t handle ourselves
    beqz $13, handle_irq2   #If it one of ours, go to our handler

    lw $13, old_handler($0) #Otherwise, jump to the default handler
    jr $13                  #That we saved earlier.

handle_irq2:
    sw $0, timer_interrupt($0)      #Acknowledge the interrupt

    subui $sp, $sp, 1
    sw $1, 0($sp)

    lw $1, counter($0)
    addi $1, $1, 1          #Handle our interrupt/increment counter
    sw $1, counter($0)

    lw $13, current_task($0) 

    lw $1, time_slice($13)
    subi $1, $1, 1
    sw $1, time_slice($13)
    beqz $1, dispatcher

    lw $1, 0($sp)
    addui $sp, $sp, 1

    rfe 

dispatcher:
save_context: 
    # Get the base address of the current PCB 
    lw $13, current_task($0) 
    # Save the registers 
    sw $1, pcb_reg1($13)
    sw $2, pcb_reg2($13)
    sw $3, pcb_reg3($13)
    sw $4, pcb_reg4($13)
    sw $5, pcb_reg5($13)
    sw $6, pcb_reg6($13)
    sw $7, pcb_reg7($13)
    sw $8, pcb_reg8($13)
    sw $9, pcb_reg9($13)
    sw $10, pcb_reg10($13)
    sw $11, pcb_reg11($13)
    sw $12, pcb_reg12($13)
    
    sw $14, pcb_sp($13)
    sw $15, pcb_ra($13)
    
    movsg   $1, $ers            #Save old $13
    sw      $1, pcb_reg13($13) 
    movsg   $1, $ear            #Save $ear 
    sw      $1, pcb_ear($13) 
    movsg   $1, $cctrl          #Save $cctrl 
    sw      $1, pcb_cctrl($13)

schedule: 
    lw $13, current_task($0)    #Get current task 
    lw $13, pcb_link($13)       #Get next task from pcb_linkfield 
    sw $13, current_task($0)    #Set next task as current task  

load_context:

    lw $13, current_task($0)     #Get PCB of current task 

    # lw $1, pcb_timeslice($13)             #Set timeslice
    addi $1, $0, 0x2
    sw $1, time_slice($0)

    lw      $1, pcb_reg13($13)   #Get the PCB value for $13 back into $ers 
    movgs   $ers, $1 
    lw      $1, pcb_ear($13)     #Restore $ear 
    movgs   $ear, $1 
    lw      $1, pcb_cctrl($13)   #Restore $cctrl 
    movgs   $cctrl, $1 

    #Restore the other registers 
    lw $1, pcb_reg1($13)
    lw $2, pcb_reg2($13)
    lw $3, pcb_reg3($13)
    lw $4, pcb_reg4($13)
    lw $5, pcb_reg5($13)
    lw $6, pcb_reg6($13)
    lw $7, pcb_reg7($13)
    lw $8, pcb_reg8($13)
    lw $9, pcb_reg9($13)
    lw $10, pcb_reg10($13)
    lw $11, pcb_reg11($13)
    lw $12, pcb_reg12($13)
    
    lw $14, pcb_sp($13)
    lw $15, pcb_ra($13)

    #Return to the new task 
    rfe

.data
time_slice:
    .word 2

.bss
old_handler:    .word

current_task:   .word

serial_pcb:     .space 19

parallel_pcb:   .space 19 

games_pcb:      .space 19

    .space 200
serial_stack:

    .space 200
parallel_stack:

    .space 200
games_stack:

