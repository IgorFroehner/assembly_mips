.text
	.globl main

main:
	li $v0, 5
	syscall
	
	add $s0, $zero, $v0 # n = input
	addi $s1, $zero, 0 # cont = 0

while50:
	slti $t0, $s0, 50 # if (n < 50) t0 = 1 else t0 = 0
	bne $t0, $zero, print50 # if (n < 50) vai pro while20 
	# else
	subi $s0, $s0, 50 # n -= 50
	addi $s1, $s1, 1 # cont++
	j while50

	# eu quis dar esses prints pra poder usar o mesmo registrador, 
	# assim não tendo q usar 5 registradores pros conts

print50: 
	li $v0, 1 # printa o cont
	add $a0, $zero, $s1
	syscall
	
	li $a0, 32 # printa espaço
	li $v0, 11
	syscall
	
	addi $s1, $zero, 0 # cont = 0
	
while20:
	slti $t0, $s0, 20 # if (n < 20) t0 = 1 else t0 = 0
	bne $t0, $zero, print20 # if (n < 20) vai pro print20 
	# else
	subi $s0, $s0, 20 # n -= 20
	addi $s1, $s1, 1 # cont0++
	j while20

print20:
	li $v0, 1 # printa o cont
	add $a0, $zero, $s1
	syscall
	
	li $a0, 32 # printa espaço
	li $v0, 11
	syscall
	
	addi $s1, $zero, 0 # cont = 0

while10:
	slti $t0, $s0, 10 # if (n < 10) t0 = 1 else t0 = 0
	bne $t0, $zero, print10 # if (n < 10) vai pro while5
	# else
	subi $s0, $s0, 10 # n -= 10
	addi $s1, $s1, 1 # cont++
	j while10

print10:
	li $v0, 1 # printa o cont
	add $a0, $zero, $s1
	syscall
	
	li $a0, 32 # printa espaço
	li $v0, 11
	syscall
	
	addi $s1, $zero, 0 # cont = 0

while5:
	slti $t0, $s0, 5 # if (n < 5) t0 = 1 else t0 = 0
	bne $t0, $zero, print5 # if (n < 5) vai pro end
	# else
	subi $s0, $s0, 5 # n -= 5
	addi $s1, $s1, 1 # cont++
	j while5

print5:
	li $v0, 1 # printa o cont
	add $a0, $zero, $s1
	syscall
	
	li $a0, 32 # printa espaço
	li $v0, 11
	syscall
	
	addi $s1, $zero, 0 # cont = 0

end:

	li $v0, 1 #  printa o quantas moedas
	add $a0, $zero, $s0
	syscall
	
	li $v0, 10
	syscall

