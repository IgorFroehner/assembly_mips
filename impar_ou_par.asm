	.data
impar: 	.asciiz "impar\n"
par:	.asciiz "par\n"


	.text
	.globl main
main:
	ori $t2, $zero, 2 # carrega o 2 no t2 pra usar no div dps
	
loop:
	li $v0, 5
	syscall
	
	beq $v0, $zero, end # se for zero acaba

	div $v0, $t2 # seta o lo pro quociente e hi para o modulo da divisão
	
	mfhi $t1 # pega o modulo e coloca no t1
	beq $t1, $zero, separ

seimpar:
	la $a0, impar
	j print

separ:
	la $a0, par

print:
	li $v0, 4
	syscall
	j loop

end:
	li $v0, 10
	syscall
