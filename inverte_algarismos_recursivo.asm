	.data
n: .asciiz "n: "
	
	.text
	.globl main
main:
	li $v0, 4
	la $a0, n
	syscall

	ori $v0,$zero,5
	syscall
	
	ori $a0, $v0, 0
	ori $a1, $zero, 0
	jal inverte
	
	ori $a0,$v0,0
	ori $v0,$zero,1
	syscall

end:
	li $v0, 10
	syscall

inverte:
	ori $t9, $zero, 10
	div $a0, $t9
	mflo $t1 # t1 = a0 / 10
	mfhi $t2 # t2 = a0 % 10
	beq $t1, $zero, div_10_0 # if(n/10==0) return res*10 + n%10;
	
	addi $sp, $sp, -4
	# sw $a0, 4($sp) # salvando n na memoria
	# sw $a1, 8($sp) # salvando res na memoria
	sw $ra, 0($sp) # salvando o retorno na memoria
	
	mult $a1, $t9
	mflo $a1 # a1 = res*10
	add $a1, $a1, $t2 # a1 = res*10 + n%10
	or $a0, $zero, $t1
	
	jal inverte
	or $v0, $zero, $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra

div_10_0:
	mult $a1, $t9
	mflo $v0
	div $a0, $t9
	mfhi $t3
	add $v0, $v0, $t3
	jr $ra
	
