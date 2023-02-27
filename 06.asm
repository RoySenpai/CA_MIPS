addi $t0, $0, 10		# max = 10

loop:
slt $t1, $s0, $t0		# Check if a ($s0) = max
beq $t1, $0, done		# If a = max - done, else continue the loop
sll $t1, $s0, 2			# Bit offset
add $t1, $t1, $s2		# Get the actualy array address with the offset	
add $t2, $s0, $s1		# $t2 = b + a
sw $t2, 0($t1)			# array[a] = $t2
addi $s0, $s0, 1		# a++
j loop				# Do the loop

done:
