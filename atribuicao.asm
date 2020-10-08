.text
	
	
	add $s4, $s0, $s1
	add $s4, $s4, $s2
	sub $s4, $s4, $s3
	addi $s4, $s4, 0xfffffd15

	lui $s0, 0x1000
	ori $s0, $zero, 0x80aa	
	
	lw $s1, 4($s0)
	lw $s2, 8($s0)
	lw $s3, 12($s0)
	add $s4, $s1, $s2
	add $s4, $s4, $s3
	addi $s4, $s4, 0x41
	sw $s4, 28($s0)
	
 
