.global	pressed
pressed:
	.word	0x31
.global	putch
.text
putch:
	subui	$sp, $sp, 2
	sw	$12, 0($sp)
	sw	$13, 1($sp)
L.6:
L.7:
	lhi	$13, 0x7
	ori	$13, $13, 0x1003
	lw	$13, 0($13)
	andi	$13, $13, 2
	seq	$13, $13, $0
	bnez	$13, L.6
	lhi	$13, 0x7
	ori	$13, $13, 0x1000
	lw	$12, 2($sp)
	sw	$12, 0($13)
L.5:
	lw	$12, 0($sp)
	lw	$13, 1($sp)
	addui	$sp, $sp, 2
	jr	$ra
.global	serial_main
serial_main:
	subui	$sp, $sp, 6
	sw	$6, 1($sp)
	sw	$7, 2($sp)
	sw	$12, 3($sp)
	sw	$13, 4($sp)
	sw	$ra, 5($sp)
	j	L.11
L.13:
	lw	$13, pressed($0)
	snei	$13, $13, 49
	bnez	$13, L.16
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	lhi	$12, 0x1
	ori	$12, $12, 0x86a0
	div	$13, $13, $12
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 10000
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 1000
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 100
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 46
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 10
	lw	$12, counter($0)
	div	$12, $12, $13
	rem	$13, $12, $13
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	j	L.17
L.16:
	lw	$13, pressed($0)
	snei	$13, $13, 50
	bnez	$13, L.18
	lw	$13, counter($0)
	divi	$13, $13, 100
	divi	$7, $13, 60
	lw	$13, counter($0)
	divi	$6, $13, 100
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 10
	div	$12, $7, $13
	rem	$13, $12, $13
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	remi	$13, $7, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 58
	sw	$13, 0($sp)
	jal	putch
	divi	$13, $6, 10
	remi	$13, $13, 6
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	remi	$13, $6, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 32
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 32
	sw	$13, 0($sp)
	jal	putch
	j	L.19
L.18:
	lw	$13, pressed($0)
	snei	$13, $13, 51
	bnez	$13, L.20
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	lhi	$12, 0x1
	ori	$12, $12, 0x86a0
	div	$13, $13, $12
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 10000
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 1000
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	divi	$13, $13, 100
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	addui	$13, $0, 10
	lw	$12, counter($0)
	div	$12, $12, $13
	rem	$13, $12, $13
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	lw	$13, counter($0)
	remi	$13, $13, 10
	addi	$13, $13, 48
	sw	$13, 0($sp)
	jal	putch
	j	L.21
L.20:
	lw	$13, pressed($0)
	snei	$13, $13, 113
	bnez	$13, L.22
	j	L.9
L.22:
L.21:
L.19:
L.17:
L.14:
	lhi	$13, 0x7
	ori	$13, $13, 0x1003
	lw	$13, 0($13)
	andi	$13, $13, 1
	seq	$13, $13, $0
	bnez	$13, L.13
	lhi	$13, 0x7
	ori	$13, $13, 0x1001
	lw	$13, 0($13)
	sw	$13, pressed($0)
L.11:
	j	L.14
L.9:
	lw	$6, 1($sp)
	lw	$7, 2($sp)
	lw	$12, 3($sp)
	lw	$13, 4($sp)
	lw	$ra, 5($sp)
	addui	$sp, $sp, 6
	jr	$ra
.bss
.global	counter
counter:
	.space	1
