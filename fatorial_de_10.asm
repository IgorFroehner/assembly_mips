.text
	.globl main
main:
	addi $t1, $zero, 1 # i = 1
	addi $s0, $zero, 10 # res = 1
loop:
	mul $s0, $s0, $t1 # res *= 
	addi $t1, $t1, 1 # i++
	beq $t1, 10, end # if (i==10) break
	j loop

end:
	li $v0, 10
	syscall
