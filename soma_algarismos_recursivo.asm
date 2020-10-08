	.data
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
	jal soma
	
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall

end:
	li $v0, 10
	syscall

soma:
	slti $t0, $a0, 10 # if (a0<10) t0 = 1 else t0 = 0
	bne $t0, $zero, n_menor_10 # if (a0<10) vai pra n menor q 10
	
	ori $t9, $zero, 10 # t9 = 10
	div $a0, $t9 # n/10 lo = quocient hi = reminder
	mflo $t1 # = n//10
	mfhi $t2 # = n%10
	
	addi $sp, $sp, -8 # sp -= 8
	sw $ra, 0($sp) # salvando o retorno
	sw $t2, 4($sp) # salvando o n%10

	ori $a0, $t1, 0
	jal soma
	
	lw $ra, 0($sp) # salvando o retorno
	lw $t2, 4($sp) # salvando o n%10
	
	addi $sp, $sp, 8 # sp += 8
	
	add $v0, $v0, $t2
	jr $ra

n_menor_10:
	ori $v0, $a0, 0
	jr $ra


#int soma(int n){
#    if (n<10) return n;
#    int ndiv = n/10;
#    int nmod = n%10;
#    int res = soma(ndiv);
#    return res + nmod;
#}
