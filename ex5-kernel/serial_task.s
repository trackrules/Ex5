.global	counter
counter:
	.word	0x1a
.global	r
r:
	.word	0xd
.global	poll
.text
poll:
	subui	$sp, $sp, 1
	sw	$13, 0($sp)
L.6:
L.7:
	lhi	$13, 0x7
	ori	$13, $13, 0x1003
	lw	$13, 0($13)
	snei	$13, $13, 2
	bnez	$13, L.6
L.5:
	lw	$13, 0($sp)
	addui	$sp, $sp, 1
	jr	$ra
.global	main
main:
	subui	$sp, $sp, 3
	sw	$12, 0($sp)
	sw	$13, 1($sp)
	sw	$ra, 2($sp)
	j	L.11
L.10:
	jal	poll
	lhi	$13, 0x7
	ori	$13, $13, 0x1000
	lw	$12, counter($0)
	sw	$12, 0($13)
	lw	$13, counter($0)
	addi	$13, $13, 1
	sw	$13, counter($0)
L.11:
	j	L.10
L.9:
	lw	$12, 0($sp)
	lw	$13, 1($sp)
	lw	$ra, 2($sp)
	addui	$sp, $sp, 3
	jr	$ra
