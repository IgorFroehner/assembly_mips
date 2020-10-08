.text
	.globl main
main:
	li $v0, 5 # pega o numero digitado e coloca em v0
	syscall
	
	add $s1, $zero, $v0 # salva o numero em s1
	addi $s1, $s1, 1 # adiciona 1 para parar no numero digitado

	addi $t1, $zero, 1 # para ser o i da iteracao
	addi $s0, $zero, 1 # para ser o res
loop:
	mult $s0, $t1 
	mflo $s0 # res *= i
	addi $t1, $t1, 1 # i++
	beq $t1, $s1, end # if i==s1 sai
	j loop # volta pro começo

end:
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	li $v0, 10
	syscall
