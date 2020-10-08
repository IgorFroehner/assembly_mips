	.data
suaidade: .asciiz "digite sua idade em dias: "
barra:	  .asciiz "/"
	
	.text
	.globl main

main:
	la $a0, suaidade
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	add $s0, $zero, $v0 # n = 0
	ori $s1, $zero, 0 # cont = 0

anos:
	slti $t0, $s0, 365 # if (n < 50) t0 = 1 else t0 = 0
	bne $t0, $zero, printanos # if (n < 50) vai pro while20 
	# else
	subi $s0, $s0, 365 # n -= 50
	addi $s1, $s1, 1 # cont++
	j anos

printanos: 
	li $v0, 1 # printa o cont
	add $a0, $zero, $s1
	syscall
	
	la $a0, barra  # printa barra
	li $v0, 4
	syscall
	
	addi $s1, $zero, 0 # cont = 0

meses:
	slti $t0, $s0, 30 # if (n < 50) t0 = 1 else t0 = 0
	bne $t0, $zero, end # if (n < 50) vai pro while20 
	# else
	subi $s0, $s0, 30 # n -= 50
	addi $s1, $s1, 1 # cont++
	j meses

end:
	li $v0, 1
	add $a0, $zero, $s1
	syscall # printa o cont
	
	la $a0, barra
	li $v0, 4
	syscall
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall # printa o resto dos dias
	
	li $v0, 10
	syscall

