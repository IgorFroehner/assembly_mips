.text	

	# exercicio 2
	
	# if((a<b && b < 50) || a == -10){
 	#	vet[b] = vet[b] + vet[b-20];
	# }else{
	#	a = 50;
	# }
	# b++;
	
	# $s0 = a = 1
	# ori $s0, $zero, 1
	# $s1 = b = 2
	# ori $s1, $zero, 2
	# $s2 = vet
	
	beq $s0, 10, if # se deu boa esse aqui ja pode entrar no if 
	
	slt $t0, $s0, $s1 # if (a<b) t0 <- 1 else 0
	slti $t1, $s1, 50 # if (b<50) t1 <- 1 else 0
	and $t0, $t0, $t1 # if ((a<b) and (b<50)) t0 <- 1 else 0
	beq $t0, $zero, else # se ((a<b) and (b<50)) continua senao vai pro else
	j if # se n foi até agora pro else vai pro if

else:
	addi $s0, $zero, 50
	j fora

if:	
	sll $t0, $s1, 2 # t0 = b*4 pra dar o tamanho do shift
	add $t0, $t0, $s2 # t0 += b*4 pra dar o endereço pós shift
	lw $t4, 0($t0) # t4 = vet[b]
	sub $t1, $s1, 20 # t1 = b-20
	sll $t1, $t1, 2 # (b-20)*4 pra dar o tamanho do shift
	add $t1, $t1, $s2 # pra dar o endereço com shift
	lw $t5, 0($t1) # t5 = b[b-20]
	
	add $t6, $t4, $t5 # vet[b] = vet[b] + vet[b-20]
	sw $t6, 0($t0)
fora:
	addi $s1, $s1, 1


