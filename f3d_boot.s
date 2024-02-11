j 0x4001064
addi $1, $0, 4032
lw $2, 16($1)
addi $3, $0, 3967
addi $7, $0, 4224
mtc0 $7, $0
mtc0 $2, $1
mtc0 $3, $2
mfc0 $4, $6
bne $4, $0, 0x1020
sll $0, $0, 0
jal 0x400103c
sll $0, $0, 0
jr $7
mtc0 $0, $7
mfc0 $8, $4
andi $8, $8, 128
bne $8, $0, 0x1050
sll $0, $0, 0
jr $31
mtc0 $0, $7
ori $8, $0, 20992
mtc0 $8, $4
break
sll $0, $0, 0
lw $2, 4($1)
andi $2, $2, 2
beq $2, $0, 0x108c
sll $0, $0, 0
jal 0x400103c
sll $0, $0, 0
mfc0 $2, $11
andi $2, $2, 256
bgtz $2, 0x103c
sll $0, $0, 0
lw $2, 24($1)
lw $3, 28($1)
addi $3, $3, 65535
mfc0 $30, $5
bne $30, $0, 0x1098
sll $0, $0, 0
mtc0 $0, $0
mtc0 $2, $1
mtc0 $3, $2
mfc0 $4, $6
bne $4, $0, 0x10b0
sll $0, $0, 0
jal 0x400103c
sll $0, $0, 0
j 0x4001008
sll $0, $0, 0
sll $0, $0, 0
