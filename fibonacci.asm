.text
	.globl main

main:

	li $v0, 5
	syscall
	
	add $s5, $zero, $v0 # n = input
	# ind: 0 1 2 3 4 5 6  7
	# fib: 0 1 2 3 5 8 13 21 

	ori $s0, $zero, 0 # int a = 0
	ori $s1, $zero, 1 # int b = 1
	ori $t0, $zero, 0 # int cont = 0
	
loop:
	
	add $s3, $s1, $s0 # aux = a + b
	add $s0, $zero, $s1 # a = b
	add $s1, $zero, $s3 # b = aux
	addi $t0, $t0, 1 # i++
	beq $t0, $s5, end # if i==n end
	j loop

end:
	
	li $v0, 1 # seta o serviço como printar um inteiro
	add $a0, $zero, $s3 # coloca a soma pra ser printado
	syscall
	
	li $v0, 10
	syscall
