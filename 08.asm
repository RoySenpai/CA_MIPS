addi $s0, $0, 0x1230
add $t0, $k0, $s0
sll $t2, $s0, 5
beq $t0, $t9, here
there: j skip
here: bne $t0, $t9, there
skip: sw $a3, (8)$t4
lw $a2, 0($sp)
sllv $s3, $s5, $s7
sub $t6, $sp, $sp

# Raw HAX:
# 0x04000000 		0x20101230
# 0x04000004 		0x03504020
# 0x04000008 		0x00105140
# 0x0400000C 		0x13280001
# 0x04000010 		0x09000006
# 0x04000014 		0x1728fffe
# 0x04000018 		0xad870008
# 0x0400001C 		0x8fc60000
# 0x04000020 		0x02f59804
# 0x04000024 		0x03bd7022