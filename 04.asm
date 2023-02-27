lui $s0, 0x1001			# $s0 = 0x10010000
ori $s0, $s0, 0x0010		# $s0 = 0x10010010
addi $t0, $0, 9			# Loop from i=0 to i=8
add $s1, $0, $0			# i=0
addi $s2, $0, 10		# Multiple factor
add $s3, $0, $0			# High register usage counter

loop:
slt $t1, $s1, $t0		# Check if i<9
beq $t1, $0, done		# i=8 - done, else continue the loop
sll $t1, $s1, 2			# $t1 = i*4 (bit offset)
add $t1, $t1, $s0		# $t1 = i*4 + $s0 - This is the array[i] address
lw $t2, 0($t1)			# $t2 = array[i] (address $t1)
mult $t2, $s2			# mult with 64bit res: $t2 * $s2
mfhi $t3			# Get the hi register value
beq $t3, $0, hnused		# Check if $hi = 0
addi $s3, $s3, 1		# hi register used

hnused:
addi $s1, $s1, 1		# i++
j loop				# Jump back to the loop

done:
add $s5, $0, $s3		# Copy $s3 to $s5
