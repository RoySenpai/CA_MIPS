# Raw HEX
0x00400000 		0x20142345
0x00400004 		0x029b5822
0x00400008 		0x11740002
0x0040000C 		0x00125c00
0x00400010 		0x08100005
0x00400014 		0x16350001
0x00400018 		0x02f59804

# Translation to MIPS Assembly
addi $s4, $0, 9029
sub $t3, $s4, $k1
beq $t3, $s4, jumphere
sll $t3, $s2, 16
j jumphere
jumphere: bne $s1, $s5, done
sllv $s3, $s5, $s7

done: