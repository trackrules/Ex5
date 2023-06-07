.global	xpowy
.text
xpowy:
	subui	$sp, $sp, 3
	sw	$6, 0($sp)
	sw	$7, 1($sp)
	sw	$13, 2($sp)
	addui	$7, $0, 1
	addui	$6, $0, 1
	j	L.9
L.6:
	lw	$13, 3($sp)
	mult	$7, $13, $7
L.7:
	addi	$6, $6, 1
L.9:
	lw	$13, 4($sp)
	sle	$13, $6, $13
	bnez	$13, L.6
	addu	$1, $0, $7
L.5:
	lw	$6, 0($sp)
	lw	$7, 1($sp)
	lw	$13, 2($sp)
	addui	$sp, $sp, 3
	jr	$ra
.global	sendSSD
sendSSD:
	subui	$sp, $sp, 6
	sw	$11, 2($sp)
	sw	$12, 3($sp)
	sw	$13, 4($sp)
	sw	$ra, 5($sp)
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	addui	$13, $0, 3
	sw	$13, 1($sp)
	jal	xpowy
	addu	$13, $0, $1
	lhi	$12, 0x7
	ori	$12, $12, 0x3006
	lw	$11, 6($sp)
	div	$13, $11, $13
	lw	$11, 7($sp)
	rem	$13, $13, $11
	sw	$13, 0($12)
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	addui	$13, $0, 2
	sw	$13, 1($sp)
	jal	xpowy
	addu	$13, $0, $1
	lhi	$12, 0x7
	ori	$12, $12, 0x3007
	lw	$11, 6($sp)
	div	$13, $11, $13
	lw	$11, 7($sp)
	rem	$13, $13, $11
	sw	$13, 0($12)
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	addui	$13, $0, 1
	sw	$13, 1($sp)
	jal	xpowy
	addu	$13, $0, $1
	lhi	$12, 0x7
	ori	$12, $12, 0x3008
	lw	$11, 6($sp)
	div	$13, $11, $13
	lw	$11, 7($sp)
	rem	$13, $13, $11
	sw	$13, 0($12)
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	sw	$0, 1($sp)
	jal	xpowy
	addu	$13, $0, $1
	lhi	$12, 0x7
	ori	$12, $12, 0x3009
	lw	$11, 6($sp)
	div	$13, $11, $13
	lw	$11, 7($sp)
	rem	$13, $13, $11
	sw	$13, 0($12)
L.10:
	lw	$11, 2($sp)
	lw	$12, 3($sp)
	lw	$13, 4($sp)
	lw	$ra, 5($sp)
	addui	$sp, $sp, 6
	jr	$ra
.global	main
main:
	subui	$sp, $sp, 7
	sw	$5, 2($sp)
	sw	$6, 3($sp)
	sw	$7, 4($sp)
	sw	$13, 5($sp)
	sw	$ra, 6($sp)
	addu	$6, $0, $0
	addu	$7, $0, $0
	addui	$5, $0, 10
	j	L.13
L.12:
	lhi	$13, 0x7
	ori	$13, $13, 0x3000
	lw	$6, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3001
	lw	$7, 0($13)
	snei	$13, $7, 1
	bnez	$13, L.15
	addui	$5, $0, 10
L.15:
	snei	$13, $7, 2
	bnez	$13, L.17
	addui	$5, $0, 16
L.17:
	snei	$13, $7, 4
	bnez	$13, L.19
	j	L.11
L.19:
	sw	$6, 0($sp)
	sw	$5, 1($sp)
	jal	sendSSD
L.13:
	j	L.12
L.11:
	lw	$5, 2($sp)
	lw	$6, 3($sp)
	lw	$7, 4($sp)
	lw	$13, 5($sp)
	lw	$ra, 6($sp)
	addui	$sp, $sp, 7
	jr	$ra
