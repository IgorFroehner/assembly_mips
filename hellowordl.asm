	.text
	.globl main
main:
	la $a0, olamundo
	li $v0, 4
	syscall
end:
	li $v0, 10
	syscall

	.data

olamundo:.asciiz "Ola Mundo\n"
