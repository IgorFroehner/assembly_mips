	.data
barraene: .asciiz "\n"
	
	.text
	.globl main
main:

loop:
	ori $v0, $zero, 5 # v0 = input()
	syscall

	slti $t0, $v0, 0 # if (v0 < 0) t0 = 1 else t0 = 1
	bne $t0, $zero, end # if (t0!=0) end
	
	#ind 0 1 2 3 4 5 6  7  8   9
	#fib 0 1 2 3 5 8 13 21 34 55
	
	or $a0, $zero, $v0 # carregando o valor lido pro registrador argumento
	jal fib
	
	or $a0, $zero, $v0
	li $v0, 1
	syscall
	
	la $a0, barraene
	li $v0, 4
	syscall
	
	j loop

end:
	ori $v0, 10
	syscall

fib:
	#funcao q calcula o fib de n || n = a0
	ori $t0, $zero, 0 # cont = 0
	ori $t1, $zero, 0 # a = 0
	ori $t2, $zero, 1 # b = 1
	ori $t3, $zero, 0 # aux = 0

loop_fib:
	add $t3, $t1, $t2 # aux = a + b
	add $t1, $zero, $t2 # a = b
	add $t2, $zero, $t3 # b = aux
	addi $t0, $t0, 1 # cont++
	bne $t0, $a0, loop_fib # if i==n end
	
	or $v0, $zero, $t2
	jr $ra
