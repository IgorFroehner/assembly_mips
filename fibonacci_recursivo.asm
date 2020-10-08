	.text
	.globl main
main:
	ori $v0,$zero,5
	syscall
	
	ori $a0,$v0, 0
	jal fib
	
	ori $a0,$v0,0
	ori $v0,$zero,1
	syscall

end:
	li $v0, 10
	syscall

fib:
	slti $t0, $a0, 2 # if (t0<a0) t0 = 1 else t0 = 0
	bne $t0, $zero, fib_menor_2 # if !(t0==0) vai pro fib_menor_2
	
	addi $sp, $sp, -12
	sw $a0, 4($sp)
	sw $ra, 0($sp)

	addi $a0, $a0, -1 
	jal fib # fib(n-1)
	
	sw $v0, 8($sp) # salva na pilha fib(n-1)
	
	addi $a0, $a0, -1
	jal fib # fib(n-2)
	
	lw $v1, 8($sp)
	add $v0, $v0, $v1 # fib(n-1) + fib(n-2)
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
fib_menor_2:
	ori $v0, $zero, 1
	jr $ra
