.data

numa: .space 16
numb: .space 16

in: .asciiz "Input:\n"
out: .asciiz "Output:\n"
err: .asciiz "ERROR!\n"
texta: .asciiz "A"
textb: .asciiz "B\n"

.text
main:
	li $v0, 4
	la $a0, in
	
	li $v0, 5
	syscall
	move $s0, $v0
	addi $s1, $zero, 0 ## $s1 == iter;
	addi $t4, $zero, 4 ## $t4 == 4;
	addi $t9, $zero, 10 ## $t9 == 10;
	addi $s6, $zero, 0 ## $s6 == 0 == A;
	addi $s7, $zero, 0 ## $s7 == 0 == A + B;
Loop:
	sll $t0, $s1, 2
	beq $s1, $t4, exit
	addi $s1, $s1, 1
	div $s0, $t9
	mfhi $t2
	sw $t2, numa($t0) 
	mflo $s0
	j Loop
exit:

Check:
	lw $t0, numa
	lw $t1, numa + 4
	lw $t2, numa + 8
	lw $t3, numa + 12
	
	beq $t0, $t1, error			
	beq $t0, $t2, error
	beq $t0, $t3, error
	beq $t1, $t2, error
	beq $t1, $t3, error
	beq $t2, $t3, error
		
	li $v0, 5
	syscall
	move $s0, $v0
	addi $s1, $zero, 0 ## $s1 == iter;

Loop1:
	sll $t0, $s1, 2
	beq $s1, $t4, exit1
	addi $s1, $s1, 1
	div $s0, $t9
	mfhi $t2
	sw $t2, numb($t0) 
	mflo $s0
	j Loop1
exit1:
	
Check1:
	lw $t0, numb
	lw $t1, numb + 4
	lw $t2, numb + 8
	lw $t3, numb + 12
	
	beq $t0, $t1, error			
	beq $t0, $t2, error
	beq $t0, $t3, error
	beq $t1, $t2, error
	beq $t1, $t3, error
	beq $t2, $t3, error

	addi $s1, $zero, 0
A:
	sll $t0, $s1, 2
	beq $s1, $t4, exit2 
	addi $s1, $s1, 1
	lw $t1, numa($t0)
	lw $t2, numb($t0)
	beq $t1, $t2, adda
	j A

adda:
	addi $s6, $s6, 1
	j A
	
exit2:
	addi $s1, $zero, 0

AB:
	sll $t0, $s1, 2
	addi $s2, $zero, 0
	beq $s1, $t4, eab
	addi $s1, $s1, 1
	AB2:
		sll $t1, $s2, 2
		beq $s2, $t4, AB
		addi $s2, $s2, 1
		lw $t2, numa($t0)
		lw $t3, numb($t1)
		beq $t2, $t3, addab
        j AB2

addab:
	addi $s7, $s7, 1
	j AB

eab:

	li $v0, 1
	move $a0, $s6
	syscall
	
	li $v0, 4
	la $a0, texta
	syscall
	
	sub $s7, $s7, $s6
	
	li $v0, 1
	move $a0, $s7
	syscall
	
	li $v0, 4
	la $a0, textb
	syscall
	
	j end

error:
	li $v0, 4
	la $a0, err
	syscall

end:
	li $v0, 10
	syscall
