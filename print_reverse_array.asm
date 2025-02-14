# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array:  .word 1 2 3 4 5 6 7 8 9 10 # Write the definition here
	cout: .asciiz "The contents of the array are:\n"# Write the definition here
	newline: .asciiz "\n"

.text
printArr:
    # TODO: Write your function code here
	move $t1, $a1
	move $t3, $a0
	addi $t1, $t1, -1

loop:
	blt $t1, 0, endloop
	move $t0, $t3
	sll $t2, $t1, 2
	add $t0, $t0, $t2
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	addi $t1, $t1, -1
	j loop

endloop:
	move $a0, $t2
	jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

