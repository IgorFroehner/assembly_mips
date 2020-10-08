	.text
	.globl main
main:
	li $v0, 5
	syscall
	
	or $a0, $zero, $v0
	jal func
	
	or $a0, $zero, $v0
	li $v0, 1
	syscall # printa o v0
	
end:
	li $v0, 10
	syscall

func:	
	ori $t1, $zero, 1 # cont = 0
	ori $t2, $zero, 10
	
	slti $t0, $a0, 10 # se a0<10 t0 = 1 else t0 = 0
	beq $t0, $zero, loop 
	or $v0, $zero, $t1 # se for menor q 10 retorna 1
	jr $ra
loop:
	div $a0, $t2
	mflo $a0
	addi $t1, $t1, 1
	
	slti $t0, $a0, 10 # se a0<10 t0 = 1 else t0 = 0
	beq $t0, $zero, loop # se a0>=10 volta pro loop
	
	or $v0, $zero, $t1
	jr $ra
	
