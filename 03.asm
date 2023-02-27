lui $s0, 0x1001			# $s0 = 0x10010000
ori $s0, $s0, 0x0060 		# $s0 = 0x10010060
addi $t2, $0, 8			# Loop from i=0 to i=7
add $s1, $0, $0			# i=0
addi $t3, $0, 4			# Offset = 4

loop:
slt $t0, $s1, $t2		# Check if i<8
beq $t0, $0, done		# i=8 - done, else continue the loop
sll $t0, $s1, 2			# $t0 = i*4 (bit offset)
add $t0, $t0, $s0		# $t0 = $t0 + $s0
mul $t1, $s1, $t3		# $t1 = i*offset
addi $t1, $t1, 1		# $t1++
sw $t1, 0($t0)			# array[i] = $t1
addi $s1, $s1, 1		# i++
j loop				# Jump back to the loop

done:
