.global	base10
.text
base10:
	subui	$sp, $sp, 3
	sw	$11, 0($sp)
	sw	$12, 1($sp)
	sw	$13, 2($sp)
	lhi	$13, 0x7
	ori	$13, $13, 0x3006
	lw	$12, 3($sp)
	divi	$12, $12, 1000
	remi	$12, $12, 10
	sw	$12, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3007
	lw	$12, 3($sp)
	divi	$12, $12, 100
	remi	$12, $12, 10
	sw	$12, 0($13)
	addui	$13, $0, 10
	lhi	$12, 0x7
	ori	$12, $12, 0x3008
	lw	$11, 3($sp)
	div	$11, $11, $13
	rem	$13, $11, $13
	sw	$13, 0($12)
	lhi	$13, 0x7
	ori	$13, $13, 0x3009
	lw	$12, 3($sp)
	remi	$12, $12, 10
	sw	$12, 0($13)
L.5:
	lw	$11, 0($sp)
	lw	$12, 1($sp)
	lw	$13, 2($sp)
	addui	$sp, $sp, 3
	jr	$ra
.global	base16
base16:
	subui	$sp, $sp, 3
	sw	$11, 0($sp)
	sw	$12, 1($sp)
	sw	$13, 2($sp)
	lhi	$13, 0x7
	ori	$13, $13, 0x3006
	lw	$12, 3($sp)
	divi	$12, $12, 4096
	remi	$12, $12, 16
	sw	$12, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3007
	lw	$12, 3($sp)
	divi	$12, $12, 256
	remi	$12, $12, 16
	sw	$12, 0($13)
	addui	$13, $0, 16
	lhi	$12, 0x7
	ori	$12, $12, 0x3008
	lw	$11, 3($sp)
	div	$11, $11, $13
	rem	$13, $11, $13
	sw	$13, 0($12)
	lhi	$13, 0x7
	ori	$13, $13, 0x3009
	lw	$12, 3($sp)
	remi	$12, $12, 16
	sw	$12, 0($13)
L.6:
	lw	$11, 0($sp)
	lw	$12, 1($sp)
	lw	$13, 2($sp)
	addui	$sp, $sp, 3
	jr	$ra
.global	parallel_main
parallel_main:
	subui	$sp, $sp, 5
	sw	$6, 1($sp)
	sw	$7, 2($sp)
	sw	$13, 3($sp)
	sw	$ra, 4($sp)
	addu	$6, $0, $0
	addu	$7, $0, $0
	j	L.9
L.8:
	lhi	$13, 0x7
	ori	$13, $13, 0x3000
	lw	$6, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3001
	lw	$7, 0($13)
	snei	$13, $7, 1
	bnez	$13, L.11
	sw	$6, 0($sp)
	jal	base10
L.11:
	snei	$13, $7, 2
	bnez	$13, L.13
	sw	$6, 0($sp)
	jal	base16
L.13:
	snei	$13, $7, 4
	bnez	$13, L.15
	j	L.7
L.15:
L.9:
	j	L.8
L.7:
	lw	$6, 1($sp)
	lw	$7, 2($sp)
	lw	$13, 3($sp)
	lw	$ra, 4($sp)
	addui	$sp, $sp, 5
	jr	$ra

