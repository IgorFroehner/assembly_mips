	.data
k: .asciiz "k: "
n: .asciiz "n: "
	
	.text
	.globl main
main:
	li $v0, 4
	la $a0, n
	syscall

	ori $v0, $zero, 5
	syscall
	
	ori $a0, $v0, 0 # a0 = n
	ori $a1, $zero, 1
	jal tobin
	
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall

end:
	li $v0, 10
	syscall

tobin:
	slti $t0, $a0, 2
	bne $t0, $zero, n_menor_2 # if (n<2) return n*b
	
	ori $t9, $zero, 2
	div $a0, $t9
	mfhi $t1
	mul $t1, $t1, $a1 # t1 = (n%2) * b;
	
	addi $sp, $sp, -8
	sw $t1, 4($sp)
	sw $ra, 0($sp)
	
	div $a0, $t9
	mflo $a0
	ori $t2, $zero, 10
	mul $a1, $a1, $t2
	
	jal tobin # v0 = tobin(n/2, b*10)
	
	lw $t1, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	
	add $v0, $v0, $t1
	jr $ra

n_menor_2:
	mult $a0, $a1
	mflo $v0
	jr $ra

