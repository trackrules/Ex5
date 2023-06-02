.global	main
.text
main:
	subui	$sp, $sp, 2
	sw	$7, 0($sp)
	sw	$13, 1($sp)
	addu	$7, $0, $0
	j	L.7
L.6:
	lhi	$13, 0x7
	ori	$13, $13, 0x3000
	lw	$7, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3009
	sw	$7, 0($13)
L.7:
	j	L.6
L.5:
	lw	$7, 0($sp)
	lw	$13, 1($sp)
	addui	$sp, $sp, 2
	jr	$ra
