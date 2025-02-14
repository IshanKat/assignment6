# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $v0, 0
    li $t0, 0
    li $t4, 1
loop:
    bge $t0, 8, endloop
    sll $t1, $a0, 3
    sub $v0, $v0, $t1
    add $v0, $v0, $a1
    slt $t2, $t4, $a0
    sub $a1, $a1, $t2
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j loop

endloop:
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall
