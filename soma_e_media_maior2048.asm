.text
	.globl main

main:

	ori $s0, $zero, 0 # int soma = 0
	ori $s1, $zero, 0 # int cont = 0 

loop:
	ori $v0, $zero, 5 # n = input
	syscall
	beq $v0, -1, end # if n==-1 end
	beq $v0, 2048, end # if n==2048
	slti $t0, $v0, 2048 # t0 = 1 ? (v0 > 2048) 1 : 0
	beq $t0, $zero, end #  if (v0 > 2048)
	
	add $s0, $s0, $v0 # soma += n
	addi $s1, $s1, 1
	
	j loop

end:
	
	li $v0, 1 # seta o serviço como printar um inteiro
	add $a0, $zero, $s0 # coloca a soma pra ser printado
	syscall
	
	li $a0, 32 # printa espaço
	li $v0, 11
	syscall
	
	li $v0, 1
	div $a0, $s0, $s1
	syscall
	
	li $v0, 10
	syscall