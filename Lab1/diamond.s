.data 
space: .asciiz  " "
star: .asciiz "*"
puts: .asciiz "\n"

# t0 = n
# t1 = i
# t2 = j
# t3 = n - i
# t4 = n + i
.text
main:
	li $v0, 5 	#read the input (integer)
	syscall
	move $t0, $v0	#save the input to reg
	add $t1, $zero, 1
	
Loop1:
	bgt $t1, $t0, Exit  #if i > n branch to exit
	sub $t3, $t0, $t1   #set t3 = n - i
	add $t4, $t0, $t1   #set t4 = n + i
	add $t1, $t1, 1
	add $t2, $zero, 1
	Loop2:
		bgt $t2, $t3, Loop3
		li $v0, 4
		la $a0, space
		syscall			#print space
		add $t2, $t2, 1  #j++
		j Loop2
	
	Loop3:
		bge $t2, $t4, P
		li $v0, 4
		la $a0, star
		syscall
		add $t2, $t2, 1
		j Loop3
	P:
		li $v0, 4
		la $a0, puts
		syscall
		j Loop1
Exit:
	sub $t1, $t0, 1 #set i = n - 1
	
Loop4:
	blt $t1, 1, Exit1 #if i <= 1, branch to exit
	add $t2, $zero, 1  #set j = 1
	sub $t3, $t0, $t1   #set t3 = n - i
	add $t4, $t0, $t1   #set t4 = n + i
	sub $t1, $t1, 1  # i--
	
	Loop5:
	bgt $t2, $t3, Loop6
	add $t2, $t2, 1
	li $v0, 4
	la $a0, space
	syscall
	j Loop5
	
	Loop6:
	bge $t2, $t4, P1
	add $t2, $t2, 1
	li $v0, 4
	la $a0, star
	syscall
	j Loop6
		
	P1:
	li $v0, 4
	la $a0, puts	
	syscall
	j Loop4

Exit1:
	li $v0, 10
	syscall
		
		
		
		
		
