.rsp

.include "rsp/rsp_defs.inc"
.include "rsp/gbi.inc"

// This file assumes DATA_FILE and CODE_FILE are set on the command line

.if version() < 110
    .error "armips 0.11 or newer is required"
.endif

// RSP DMEM
.create DATA_FILE, 0x0000
// 0x0000-0x0004
unklabel_0000:
    .fill 4

// 0x0004-0x0009
unklabel_0004:
    .byte 0x0F, 0x2F, 0x10, 0x80, 0x00, 0x00

// 0x02b0-0x02f0
.ascii ID_STR
.align

.close // DATA_FILE
.create CODE_FILE, 0x00001080
j 0x40017c0
addi $29, $0, 272
jal 0x400113c
add $20, $0, $22
lh $2, 188($1)
jr $2
srl $2, $25, 23
mfc0 $2, $4
andi $2, $2, 128
bne $2, $0, 0x10c0
lh $21, 38($0)
bne $28, $27, 0x1064
lw $25, 0($27)
j 0x40010c8
lh $31, 260($0)
lh $21, 182($0)
j 0x40010f0
ori $30, $0, 32
addi $28, $0, 2784
add $21, $0, $31
addi $20, $0, 2464
add $19, $0, $26
addi $26, $26, 320
jal 0x400113c
addi $18, $0, 319
jr $21
addi $27, $0, 2464
add $21, $0, $31
lw $19, 0($30)
lh $18, 4($30)
jal 0x400113c
lh $20, 6($30)
jal 0x400112c
sll $0, $0, 0
jr $21
lw $11, 184($0)
srl $12, $19, 22
andi $12, $12, 60
and $19, $19, $11
add $13, $0, $12
lw $12, 352($13)
jr $31
add $19, $19, $12
mfc0 $11, $6
bne $11, $0, 0x112c
sll $0, $0, 0
jr $31
add $17, $0, $0
mfc0 $11, $5
bne $11, $0, 0x1140
sll $0, $0, 0
mtc0 $20, $0
bgtz $17, 0x1160
mtc0 $19, $1
jr $31
mtc0 $18, $2
jr $31
mtc0 $18, $3
add $21, $0, $31
lw $19, 24($29)
addi $18, $23, 62240
lw $23, 68($29)
blez $18, 0x11e4
add $20, $19, $18
sub $20, $23, $20
bgez $20, 0x11a8
mfc0 $20, $11
andi $20, $20, 1024
bne $20, $0, 0x1188
mfc0 $23, $10
lw $19, 64($29)
beq $23, $19, 0x1194
sll $0, $0, 0
mtc0 $19, $8
mfc0 $23, $10
sub $20, $19, $23
bgez $20, 0x11c4
add $20, $19, $18
sub $20, $20, $23
bgez $20, 0x11a8
sll $0, $0, 0
add $23, $19, $18
addi $18, $18, 65535
addi $20, $0, 3296
jal 0x4001140
addi $17, $0, 1
jal 0x400112c
sw $23, 24($29)
mtc0 $23, $9
jr $21
addi $23, $0, 3296
andi $2, $2, 254
lh $2, 118($2)
jr $2
lbu $1, 65535($27)
lh $24, 190($0)
lh $31, 918($0)
lbu $1, 65533($27)
lbu $2, 65534($27)
lbu $3, 65535($27)
lhu $1, 796($1)
lhu $2, 796($2)
lhu $3, 796($3)
jr $31
addi $4, $1, 0
jal 0x4001200
addi $24, $31, 0
lbu $1, 65529($27)
lbu $2, 65530($27)
lbu $3, 65531($27)
lh $31, 918($0)
j 0x4001210
lh $24, 190($0)
jal 0x4001204
lbu $7, 65532($27)
lhu $7, 796($7)
lh $8, 26($1)
lh $10, 26($3)
lh $9, 26($2)
lh $11, 26($7)
sub $6, $8, $10
bgez $6, 0x1270
sh $1, 3290($0)
sub $6, $10, $8
sub $12, $9, $11
bgez $12, 0x1280
sh $3, 3292($0)
sub $12, $11, $9
sub $6, $6, $12
blez $6, 0x1294
sh $7, 3294($0)
addi $3, $7, 0
sh $2, 3290($0)
jal 0x40019c8
addi $24, $31, 0
beq $31, $0, 0x109c
lh $1, 3292($0)
lh $2, 3294($0)
lh $3, 3290($0)
j 0x40019c8
lh $24, 190($0)
sbv v31[6], 28($29)
lw $19, 36($29)
lw $3, 4064($0)
addi $20, $0, 992
sub $3, $3, $19
bgez $3, 0x109c
addi $19, $19, 65472
jal 0x400113c
addi $18, $0, 63
jal 0x400112c
addi $3, $0, 1120
j 0x4001644
sw $19, 36($29)
lbu $1, 65531($27)
lhu $2, 65529($27)
lh $5, 782($1)
add $5, $5, $2
j 0x400109c
sw $24, 0($5)
sw $25, 16($29)
sw $24, 20($29)
lh $2, 6($29)
andi $2, $2, 65533
andi $3, $25, 1
sll $3, $3, 1
or $2, $2, $3
j 0x400109c
sh $2, 6($29)
j 0x4001330
addi $7, $29, 8
addi $7, $29, 12
lw $3, 0($7)
lbu $5, 65531($27)
lbu $6, 65530($27)
addi $2, $0, 1
sllv $2, $2, $5
addi $2, $2, 65535
sllv $2, $2, $6
nor $2, $2, $0
and $2, $2, $3
or $3, $2, $24
sw $3, 0($7)
lw $25, 8($29)
j 0x40013fc
lw $24, 12($29)
andi $25, $25, 1023
ori $2, $0, 28784
lh $3, 1220($25)
addi $25, $25, 40
bne $25, $24, 0x1370
and $2, $2, $3
beq $2, $0, 0x109c
lb $2, 0($29)
addi $2, $2, 65532
bltz $2, 0x10bc
addi $3, $2, 920
lw $26, 0($3)
sb $2, 0($29)
j 0x400109c
addi $28, $27, 0
lw $2, 4($29)
or $2, $2, $24
j 0x400109c
sw $2, 4($29)
lw $2, 4($29)
nor $3, $24, $0
and $2, $2, $3
j 0x400109c
sw $2, 4($29)
j 0x400109c
sh $24, 2($29)
j 0x40010ac
sw $24, 65532($29)
j 0x40013fc
lw $25, 65532($29)
sra $2, $25, 24
addi $2, $2, 3
bltz $2, 0x13fc
addi $2, $2, 24
jal 0x400110c
add $19, $24, $0
add $24, $19, $0
sw $25, 0($23)
sw $24, 4($23)
jal 0x4001168
addi $23, $23, 8
bgtz $2, 0x109c
sll $0, $0, 0
j 0x40010ac
andi $2, $2, 510
lh $2, 196($2)
jal 0x400112c
lbu $1, 65529($27)
jr $2
andi $6, $1, 15
lh $8, 190($0)
sh $8, 262($0)
lbu $9, 65530($27)
ldv v2[0], 0($22)
ldv v2[8], 16($22)
srl $9, $9, 2
jal 0x40016e8
lhu $7, 796($1)
llv v17[0], 20($29)
jal 0x4001710
llv v17[8], 20($29)
vmudn v28, v12, v2[0h]
llv v18[0], 8($22)
vmadh v28, v8, v2[0h]
lw $15, 12($22)
vmadn v28, v13, v2[1h]
lw $16, 28($22)
vmadh v28, v9, v2[1h]
andi $1, $3, 2
vmadn v28, v14, v2[2h]
vmadh v28, v10, v2[2h]
vmadn v28, v15, v31[1w]
llv v18[8], 24($22)
vmadh v29, v11, v31[1w]
bne $1, $0, 0x17b4
addi $22, $22, 32
vmudm v18, v18, v17
lsv v21[0], 118($0)
vmudn v20, v28, v21[0w]
vmadh v21, v29, v21[0w]
vch v3, v29, v29[3h]
vcl v3, v28, v28[3h]
cfc2 r13, $1
vch v3, v29, v21[3h]
vcl v3, v28, v20[3h]
andi $8, $13, 1799
andi $13, $13, 28784
sll $8, $8, 4
sll $13, $13, 16
or $13, $13, $8
cfc2 r14, $1
andi $8, $14, 1799
vadd v21, v29, v31[0w]
andi $14, $14, 28784
vadd v20, v28, v31[0w]
sll $14, $14, 12
vmudl v28, v28, v19[0w]
or $8, $8, $14
vmadm v29, v29, v19[0w]
or $8, $8, $13
vmadn v28, v31, v31[0w]
jal 0x4001000
sh $8, 36($7)
vge v6, v27, v31[0w]
sdv v21[0], 0($7)
vmrg v6, v27, v30[0w]
sdv v20[0], 8($7)
vmudl v5, v20, v26[3h]
vmadm v5, v21, v26[3h]
vmadn v5, v20, v6[3h]
vmadh v4, v21, v6[3h]
addi $9, $9, 65534
vmudl v5, v5, v19[0w]
vmadm v4, v4, v19[0w]
vmadn v5, v31, v31[0w]
andi $12, $3, 1
ldv v2[0], 0($22)
vmudh v7, v1, v31[1w]
ldv v2[8], 16($22)
vmadn v7, v5, v0
ldv v29[0], 40($0)
vmadh v6, v4, v0
ldv v29[8], 40($0)
vmadn v7, v31, v31[0w]
vge v6, v6, v29[1q]
sw $15, 16($7)
beq $12, $0, 0x1590
vlt v6, v6, v29[0q]
lqv v3[0], 912($0)
vmudn v5, v5, v3[0w]
vmadh v4, v4, v3[0w]
vadd v4, v4, v3[1w]
vge v4, v4, v31[0w]
vlt v4, v4, v3[2w]
sbv v4[5], 19($7)
sw $16, 24($7)
sbv v4[13], 27($7)
lw $16, 24($7)
slv v18[0], 20($7)
sdv v6[0], 24($7)
ssv v7[4], 30($7)
ssv v27[6], 32($7)
bltz $9, 0x15d4
ssv v26[6], 34($7)
sdv v21[8], 40($7)
sdv v20[8], 48($7)
slv v18[8], 60($7)
sw $16, 56($7)
sdv v6[8], 64($7)
ssv v7[12], 70($7)
ssv v27[14], 72($7)
ssv v26[14], 74($7)
sw $8, 76($7)
addi $7, $7, 80
bgtz $9, 0x145c
lh $8, 262($0)
jr $8
andi $8, $1, 1
sbv v31[6], 28($29)
bne $8, $0, 0x1654
andi $7, $1, 2
addi $20, $0, 992
andi $8, $1, 4
beq $8, $0, 0x1620
lqv v26[0], 48($22)
lw $19, 36($29)
lw $8, 76($29)
addi $17, $0, 1
addi $1, $19, 64
beq $19, $8, 0x1620
addi $12, $0, 63
jal 0x4001140
sw $1, 36($29)
jal 0x400112c
lqv v28[0], 16($22)
beq $7, $0, 0x1660
lqv v27[0], 32($22)
sqv v26[0], 48($20)
lqv v29[0], 0($22)
sqv v28[0], 16($20)
addi $3, $0, 1120
sqv v27[0], 32($20)
sqv v29[0], 0($20)
addi $1, $0, 992
addi $2, $0, 1056
j 0x4001684
lh $31, 190($0)
lqv v26[0], 48($22)
j 0x4001620
addi $20, $0, 1056
addiu $3, $0, 3552
addu $1, $0, $22
jal 0x4001684
addu $2, $0, $20
sqv v6[0], 48($20)
sqv v5[0], 16($20)
lqv v27[0], 0($3)
j 0x4001638
lqv v29[0], 2016($3)
addi $19, $3, 16
vmudh v5, v31, v31[0w]
addi $18, $1, 8
ldv v3[0], 0($2)
ldv v4[0], 32($2)
lqv v1[0], 0($1)
lqv v2[0], 32($1)
ldv v3[8], 0($2)
ldv v4[8], 32($2)
vmadl v6, v4, v2[0h]
addi $1, $1, 2
vmadm v6, v3, v2[0h]
addi $2, $2, 8
vmadn v6, v4, v1[0h]
vmadh v5, v3, v1[0h]
bne $1, $18, 0x1690
vmadn v6, v31, v31[0w]
addi $2, $2, 65504
addi $1, $1, 8
sqv v5[0], 0($3)
sqv v6[0], 32($3)
bne $3, $19, 0x1688
addi $3, $3, 16
jr $31
sll $0, $0, 0
addi $8, $0, 896
lqv v3[0], 80($0)
lsv v19[0], 2($29)
lh $3, 4($29)
ldv v0[0], 0($8)
ldv v1[0], 8($8)
ldv v0[8], 0($8)
ldv v1[8], 8($8)
jr $31
vmudh v0, v0, v3
addi $8, $0, 1120
ldv v11[0], 24($8)
ldv v11[8], 24($8)
ldv v15[0], 56($8)
ldv v15[8], 56($8)
ldv v8[0], 0($8)
ldv v9[0], 8($8)
ldv v10[0], 16($8)
ldv v12[0], 32($8)
ldv v13[0], 40($8)
ldv v14[0], 48($8)
ldv v8[8], 0($8)
ldv v9[8], 8($8)
ldv v10[8], 16($8)
ldv v12[8], 32($8)
ldv v13[8], 40($8)
jr $31
ldv v14[8], 48($8)
lqv v0[0], 0($22)
lh $5, 624($1)
j 0x400109c
sqv v0[0], 0($5)
bgtz $1, 0x1790
lb $2, 0($29)
addi $4, $2, 65468
bgtz $4, 0x109c
addi $3, $2, 920
addi $2, $2, 4
add $26, $26, $27
sub $26, $26, $28
sw $26, 0($3)
sb $2, 0($29)
jal 0x400110c
add $19, $24, $0
add $26, $19, $0
j 0x400109c
addi $28, $27, 0
sll $0, $0, 0
ori $30, $0, 16
beq $0, $0, 0x10f0
lh $21, 256($0)
ori $30, $0, 24
beq $0, $0, 0x10f0
lh $21, 160($0)
ori $2, $0, 10240
mtc0 $2, $4
lqv v31[0], 48($0)
lqv v30[0], 64($0)
lw $4, 4036($0)
andi $4, $4, 1
bne $4, $0, 0x18b4
sll $0, $0, 0
lw $23, 40($1)
lw $3, 44($1)
sw $23, 64($29)
sw $3, 68($29)
mfc0 $4, $11
andi $4, $4, 1
bne $4, $0, 0x1824
mfc0 $4, $9
sub $23, $23, $4
bgtz $23, 0x1824
mfc0 $5, $10
beq $5, $0, 0x1824
sll $0, $0, 0
beq $5, $4, 0x1824
sll $0, $0, 0
j 0x4001840
ori $3, $4, 0
mfc0 $4, $11
andi $4, $4, 1024
bne $4, $0, 0x1824
addi $4, $0, 1
mtc0 $4, $11
mtc0 $3, $8
mtc0 $3, $9
sw $3, 24($29)
addi $23, $0, 3296
lw $5, 16($1)
lw $2, 8($0)
lw $3, 16($0)
lw $4, 24($0)
lw $6, 32($0)
add $2, $2, $5
add $3, $3, $5
add $4, $4, $5
add $6, $6, $5
sw $2, 8($0)
sw $3, 16($0)
sw $4, 24($0)
sw $6, 32($0)
jal 0x40010ec
addi $30, $0, 8
jal 0x40010c8
lw $26, 48($1)
lw $2, 32($1)
lw $3, 36($1)
sw $2, 32($29)
sw $2, 36($29)
add $2, $2, $3
sw $2, 76($29)
lw $2, 65528($0)
sw $2, 264($0)
j 0x4001058
sll $0, $0, 0
jal 0x40010ec
addi $30, $0, 8
lw $23, 3056($0)
lw $28, 3044($0)
lw $27, 3048($0)
j 0x400109c
lw $26, 3052($0)
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
lh $11, 36($3)
lh $8, 36($2)
lh $9, 36($1)
and $12, $11, $8
or $11, $11, $8
and $12, $12, $9
andi $12, $12, 28784
bne $12, $0, 0x1fa4
or $11, $11, $9
andi $11, $11, 17219
bne $11, $0, 0x17a8
llv v13[0], 24($1)
llv v14[0], 24($2)
llv v15[0], 24($3)
lw $13, 4($29)
addi $8, $0, 3040
lsv v21[0], 2($29)
lsv v5[0], 6($1)
vsub v10, v14, v13
lsv v6[0], 14($1)
vsub v9, v15, v13
lsv v5[2], 6($2)
vsub v12, v13, v14
lsv v6[2], 14($2)
lsv v5[4], 6($3)
lsv v6[4], 14($3)
vmudh v16, v9, v10[1w]
lh $9, 26($1)
vmadh v16, v12, v9[1w]
lh $10, 26($2)
vsar v28, v28, v28[1w]
lh $11, 26($3)
vsar v29, v29, v29[0w]
sll $15, $13, 18
mfc2 $17, v16[0]
sh $1, 3040($0)
sh $2, 3042($0)
and $15, $17, $15
bltz $15, 0x1fa0
sh $3, 3044($0)
slt $7, $11, $10
slt $12, $10, $9
add $7, $7, $7
add $7, $7, $12
slt $12, $9, $11
add $7, $7, $7
add $7, $7, $12
lbu $3, 864($7)
lbu $2, 871($7)
lbu $1, 878($7)
lh $3, 3040($3)
lh $2, 3040($2)
lh $1, 3040($1)
lbu $12, 885($7)
llv v15[0], 24($3)
llv v14[0], 24($2)
blez $12, 0x1ab8
llv v13[0], 24($1)
vsubc v28, v31, v28
vsub v29, v31, v29
beq $17, $0, 0x1fa4
vsub v4, v15, v14
sll $14, $13, 19
vsub v10, v14, v13
nor $14, $14, $0
vsub v9, v15, v13
or $14, $17, $14
vmov v29[3], v29[0]
bgez $14, 0x1fa0
vmov v28[3], v28[0]
ssv v15[2], 2($23)
vmov v4[2], v10[0]
ssv v14[2], 4($23)
vmov v4[3], v10[1]
ssv v13[2], 6($23)
vmov v4[4], v9[0]
mfc2 $6, v29[5]
vmov v4[5], v9[1]
jal 0x4001000
vmudn v2, v13, v31[4w]
lb $5, 7($29)
vmudm v9, v4, v31[4w]
vmadn v10, v31, v31[0w]
andi $6, $6, 128
vrcp v8[1], v4[1]
ori $5, $5, 200
vrcph v7[1], v31[0]
lb $7, 18($29)
vrcp v8[3], v4[3]
vrcph v7[3], v31[0]
vrcp v8[5], v4[5]
vrcph v7[5], v31[0]
or $6, $6, $7
vmudl v8, v8, v30[4w]
sb $5, 0($23)
vmadm v7, v7, v30[4w]
sb $6, 1($23)
vmadn v8, v31, v31[0w]
vmudh v4, v4, v31[5w]
lsv v12[0], 24($2)
vmudl v6, v6, v21[0w]
lsv v12[4], 24($1)
vmadm v5, v5, v21[0w]
lsv v12[8], 24($1)
vmadn v6, v31, v31[0w]
vmudl v1, v8, v10[0q]
vmadm v1, v7, v10[0q]
vmadn v1, v8, v9[0q]
vmadh v0, v7, v9[0q]
vmadn v1, v31, v31[0w]
sw $3, 0($8)
vmudl v8, v8, v31[4w]
vmadm v7, v7, v31[4w]
vmadn v8, v31, v31[0w]
vmudl v1, v1, v31[4w]
vmadm v0, v0, v31[4w]
vmadn v1, v31, v31[0w]
vand v16, v1, v30[1w]
vmudm v12, v12, v31[4w]
sw $2, 4($8)
vmadn v13, v31, v31[0w]
sw $1, 8($8)
vcr v0, v0, v30[6w]
ssv v12[0], 8($23)
vmudl v11, v16, v2[1w]
ssv v13[0], 10($23)
vmadm v10, v0, v2[1w]
ssv v0[2], 12($23)
vmadn v11, v31, v31[0w]
ssv v1[2], 14($23)
andi $7, $5, 2
addi $15, $8, 8
addi $16, $8, 16
vsubc v3, v13, v11[1q]
ssv v0[10], 20($23)
vsub v9, v12, v10[1q]
ssv v1[10], 22($23)
vsubc v21, v6, v6[1w]
ssv v0[6], 28($23)
vlt v19, v5, v5[1w]
ssv v1[6], 30($23)
vmrg v20, v6, v6[1w]
ssv v9[8], 16($23)
vsubc v21, v20, v6[2w]
ssv v3[8], 18($23)
vlt v19, v19, v5[2w]
ssv v9[4], 24($23)
vmrg v20, v20, v6[2w]
ssv v3[4], 26($23)
addi $23, $23, 32
blez $7, 0x1ce8
vmudl v20, v20, v30[5w]
lw $14, 0($15)
vmadm v19, v19, v30[5w]
lw $17, 65532($15)
vmadn v20, v31, v31[0w]
lw $18, 65528($15)
llv v9[0], 20($14)
llv v9[8], 20($17)
llv v22[0], 20($18)
lsv v11[0], 34($14)
lsv v12[0], 32($14)
lsv v11[8], 34($17)
vmov v9[2], v30[0]
lsv v12[8], 32($17)
vmov v9[6], v30[0]
lsv v24[0], 34($18)
vmov v22[2], v30[0]
lsv v25[0], 32($18)
vmudl v6, v11, v20[0w]
vmadm v6, v12, v20[0w]
ssv v19[0], 68($8)
vmadn v6, v11, v19[0w]
ssv v20[0], 76($8)
vmadh v5, v12, v19[0w]
vmudl v16, v24, v20[0w]
vmadm v16, v25, v20[0w]
vmadn v20, v24, v19[0w]
vmadh v19, v25, v19[0w]
vmudm v16, v9, v6[0h]
vmadh v9, v9, v5[0h]
vmadn v10, v31, v31[0w]
vmudm v16, v22, v20[0w]
vmadh v22, v22, v19[0w]
vmadn v23, v31, v31[0w]
sdv v9[8], 16($16)
sdv v10[8], 24($16)
sdv v9[0], 0($16)
sdv v10[0], 8($16)
sdv v22[0], 32($16)
sdv v23[0], 40($16)
vabs v9, v9, v9
llv v19[0], 16($16)
vabs v22, v22, v22
llv v20[0], 24($16)
vabs v19, v19, v19
vge v17, v9, v22
vmrg v18, v10, v23
vge v17, v17, v19
vmrg v18, v18, v20
slv v17[0], 64($8)
slv v18[0], 72($8)
andi $7, $5, 7
blez $7, 0x1f98
vxor v18, v31, v31
luv v0[0], 0(r0)
.close // CODE_FILE
