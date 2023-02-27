addi $t0, $0, 1		# A = [ 1, 3, 9, 27, ... ] = [ 3^0, 3^1, 3^2, ... ] = [ 3^n: n is natural ]
add $t1, $0, $t0	# B = [ 1, 4, 16, 64, ... ] = [ 4^0, 4^1, 4^2, ... ] = [ 4^n: n is natural ]
add $t2, $0, $t0	# C = [ 1, -1, 1, -1, ... ] = [ (-1)^0, (-1)^1, (-1)^2, ... ] = [ (-1)^n: n is natural ]
addi $t3, $0, 7		# Sum from i=0 to i=6
add $s0, $0, $0		# i=0

loop:
slt $t4, $s0, $t3	# Check if i<7
beq $t4, $0, done	# i=7 - done, else continue the loop
addi $t5, $0, 1		# Temp value storage
mul $t5, $t5, $t0	# 1*A[i]
mul $t5, $t5, $t1	# 1*A[i]*B[i]
mul $t5, $t5, $t2	# 1*A[i]*B[i]*C[i]
add $s1, $s1, $t5	# $s1 = $s1 + 1*A[i]*B[i]*C[i]
addi $t9, $0, 3		# For mult op
mul $t0, $t0, $t9	# A[i+1] = 3*A[i]
addi $t9, $0, 4		# For mult op
mul $t1, $t1, $t9	# B[i+1] = 4*B[i]
addi $t9, $0, -1	# For mult op
mul $t2, $t2, $t9	# C[i+1] = (-1)*C[i]
addi $s0, $s0, 1	# i++
j loop			# Jump back to the loop

done:
