	.text
	.globl main
main:
	
	ori $a0, $zero, 1 # = a
	ori $a1, $zero, 2 # = b
	ori $a2, $zero, 3 # = c
	ori $a3, $zero, 4 # = d
	ori $t0, $zero, 5 # = x
	ori $t1, $zero, 6
	
	# res = 3.3³ + 5.3² + 2.3 + 12
	
	addi $sp, $sp, -8
	sw $t0, 0($sp) # argumento da funcao salvando na memoria
	sw $t1, 4($sp)
	
	jal func
	
	addi $sp, $sp, 4
	
	or $a0, $zero, $v0
	li $v0, 1
	syscall # printa o v0
	
end:
	li $v0, 10
	syscall

func:	
	lw $t4, 0($sp)
	lw $t5, 4($sp)
	addi $sp, $sp, 4

	# mult
	ori $v0, $zero, 1
	mul $v0, $v0, $a1 

	or $v0, $zero, $t0
	
	jr $ra
	
