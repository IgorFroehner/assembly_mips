	.data
impar: 	.asciiz "impar\n"
par:	.asciiz "par\n"

	.text
	.globl main
main:
	ori $t2, $zero, 2 # carrega o 2 no t2 pra usar no div dps
	ori $t1, $zero, 0x1
	
loop:
	li $v0, 5
	syscall
	
	beq $v0, $zero, end # se for zero acaba

	and $t1, $v0, 1 # numero and ..001 ficara somente 1 no ultimo bit se no numero esse bit estiver acesso o resto vai zerar
	
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
