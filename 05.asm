fib:
# Memory allication
addi $sp, $sp, -12		# Allocate 3 memory addresses in stack
sw $s1, 0($sp)			# Save result 2 (n-2) to stack
sw $s0, 4($sp)			# Save result 1 (n-1) to stack
sw $ra, 8($sp)			# Save return address to stack

# Handles the stopping conditions
add $v0, $0, $0			# Set result value to 0 (incase of n = 0)
blez $a1, fibexit		# Check if n <= 0 
addi $v0, $0, 1			# Set result value to 1 (incase of n = 1)
beq $a1, $v0, fibexit 		# Check if n = 1

# The actual part of the calculatiom of the fibbonchi sequance
add $s0, $0, $a1		# Get the argument value ($a1)
addi $a1, $s0, -1		# $a1 = $s0 - 1
jal fib				# Recursive Jump to fib(n-1)
add $s1, $0, $v0		# Gets the returned data back to $s1
addi $a1, $s0, -2		# $a1 = $s0 - 2
jal fib				# Recursive Jump to fib(n-2)
add $v0, $s1, $v0		# Adds the result of fib(n-1) to fib(n-2)

fibexit:
# Memory release
lw $ra, 8($sp)			# Fletchs return address from the stack
lw $s0, 4($sp)			# Fletchs result 1 (n-1) from the stack
lw $s1, 0($sp)			# Fletchs result 2 (n-2) from the stack
addi $sp, $sp, 12		# Release 3 memory addresses from the stack
jr $ra				# Return to the caller function
