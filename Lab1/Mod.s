.data

.text

# s1 = a
# s2 = b
# s3 = m
main:
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	div $s1, $s3
	mfhi $s4 ## the value of a % m
	
	move $a0, $s2
	
	jal mod_op
	
	move $t0, $v0
	div $t0, $s3
	mfhi $a0
	
	li $v0, 1
	
	syscall
	
	li $v0, 10
	syscall
	
	## a0 = y
mod_op:
	addi $sp, $sp, -8
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)
	bne $a0, $zero, L1 #branch to L1 if a1 != 0, 
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra
	
L1:
	addi $t0, $zero, 2
	div $a0, $t0
	mfhi $t0 ## result of y % 2
	mflo $t1 ## result of y / 2 
	move $a0, $t1 ## y /= 2
	beq $t0, $zero, even 
	jal mod_op	
	lw $a0, 0($sp)	#restore the value of arguments
	lw $ra, 4($sp)
	addi $sp, $sp, 8 # pop two items from the stack
	div $v0, $s3 
	mfhi $v0
	mult $v0, $v0
	mflo $v0
	div $v0, $s3
	mfhi $v0
	mult $v0, $s4
	mflo $v0
	div $v0, $s3
	mfhi $v0
	jr $ra
	
	even:
	jal mod_op
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	div $v0, $s3
	mfhi $v0
	mult $v0, $v0
	mflo $v0
	div $v0, $s3
	mfhi $v0
	jr $ra
