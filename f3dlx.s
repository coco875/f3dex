j 0x40017e8
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
blez $18, 0x11dc
add $6, $19, $18
sub $6, $23, $6
bgez $6, 0x11a8
mfc0 $6, $11
andi $6, $6, 1024
bne $6, $0, 0x1188
mfc0 $23, $10
lw $19, 64($29)
beq $23, $19, 0x1194
sll $0, $0, 0
mtc0 $19, $8
mfc0 $23, $10
sub $6, $19, $23
bgez $6, 0x11c4
add $6, $19, $18
sub $6, $6, $23
bgez $6, 0x11a8
sll $0, $0, 0
add $23, $19, $18
addi $18, $18, 65535
addi $20, $0, 3296
jal 0x4001140
addi $17, $0, 1
sw $23, 24($29)
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
jal 0x40011f8
addi $24, $31, 0
lbu $1, 65529($27)
lbu $2, 65530($27)
lbu $3, 65531($27)
lh $31, 918($0)
j 0x4001208
lh $24, 190($0)
jal 0x40011fc
lbu $7, 65532($27)
lhu $7, 796($7)
lh $8, 26($1)
lh $10, 26($3)
lh $9, 26($2)
lh $11, 26($7)
sub $6, $8, $10
bgez $6, 0x1268
sh $1, 3290($0)
sub $6, $10, $8
sub $12, $9, $11
bgez $12, 0x1278
sh $3, 3292($0)
sub $12, $11, $9
sub $6, $6, $12
blez $6, 0x128c
sh $7, 3294($0)
addi $3, $7, 0
sh $2, 3290($0)
jal 0x40019f0
addi $24, $31, 0
beq $31, $0, 0x109c
lh $1, 3292($0)
lh $2, 3294($0)
lh $3, 3290($0)
j 0x40019f0
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
j 0x4001670
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
j 0x4001328
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
j 0x40013f4
lw $24, 12($29)
andi $25, $25, 1023
ori $2, $0, 28784
lh $3, 1220($25)
addi $25, $25, 40
bne $25, $24, 0x1368
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
j 0x40013f4
lw $25, 65532($29)
sra $2, $25, 24
addi $2, $2, 3
bltz $2, 0x13f4
addi $2, $2, 24
jal 0x400110c
add $19, $24, $0
add $24, $19, $0
jal 0x400112c
lw $21, 24($29)
mtc0 $21, $9
sw $25, 0($23)
sw $24, 4($23)
jal 0x4001168
addi $23, $23, 8
jal 0x400112c
lw $21, 24($29)
mtc0 $21, $9
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
ldv v2[0], 0(r22)
ldv v2[8], 16(r22)
srl $9, $9, 2
jal 0x4001714
lhu $7, 796($1)
llv v17[0], 20(r29)
jal 0x400173c
llv v17[8], 20(r29)
vmudn v28, v12, v2[0h]
llv v18[0], 8(r22)
vmadh v28, v8, v2[0h]
lw $15, 12($22)
vmadn v28, v13, v2[1h]
lw $16, 28($22)
vmadh v28, v9, v2[1h]
andi $1, $3, 2
vmadn v28, v14, v2[2h]
andi $24, $3, 128
vmadh v28, v10, v2[2h]
vmadn v28, v15, v31[1w]
llv v18[8], 24(r22)
vmadh v29, v11, v31[1w]
bne $1, $0, 0x17dc
addi $22, $22, 32
vmudm v18, v18, v17
beq $24, $0, 0x14f0
lsv v21[0], 118(r0)
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
ldv v2[0], 0(r22)
vmudh v7, v1, v31[1w]
ldv v2[8], 16(r22)
vmadn v7, v5, v0
ldv v29[0], 40(r0)
vmadh v6, v4, v0
ldv v29[8], 40(r0)
vmadn v7, v31, v31[0w]
vge v6, v6, v29[1q]
sw $15, 16($7)
vor v28, v31, v30[1w]
beq $12, $0, 0x15ac
vlt v6, v6, v29[0q]
lqv v3[0], 912(r0)
vmudn v5, v5, v3[0w]
vmadh v4, v4, v3[0w]
vadd v4, v4, v3[1w]
vge v4, v4, v31[0w]
vlt v4, v4, v3[2w]
sbv v4[5], 19($7)
sw $16, 24($7)
sbv v4[13], 27($7)
lw $16, 24($7)
vadd v4, v6, v31[2w]
slv v18[0], 20($7)
sdv v6[0], 24($7)
vand v4, v4, v28[5w]
ssv v7[4], 30($7)
ssv v27[6], 32($7)
ssv v26[6], 34($7)
bltz $9, 0x1600
ssv v4[2], 26($7)
sdv v21[8], 40($7)
sdv v20[8], 48($7)
slv v18[8], 60($7)
sw $16, 56($7)
sdv v6[8], 64($7)
ssv v4[10], 66($7)
ssv v7[12], 70($7)
ssv v27[14], 72($7)
ssv v26[14], 74($7)
sw $8, 76($7)
addi $7, $7, 80
bgtz $9, 0x146c
lh $8, 262($0)
jr $8
andi $8, $1, 1
sbv v31[6], 28($29)
bne $8, $0, 0x1680
andi $7, $1, 2
addi $20, $0, 992
andi $8, $1, 4
beq $8, $0, 0x164c
lqv v26[0], 48(r22)
lw $19, 36($29)
lw $8, 76($29)
addi $17, $0, 1
addi $1, $19, 64
beq $19, $8, 0x164c
addi $12, $0, 63
jal 0x4001140
sw $1, 36($29)
jal 0x400112c
lqv v28[0], 16(r22)
beq $7, $0, 0x168c
lqv v27[0], 32(r22)
sqv v26[0], 48($20)
lqv v29[0], 0(r22)
sqv v28[0], 16($20)
addi $3, $0, 1120
sqv v27[0], 32($20)
sqv v29[0], 0($20)
addi $1, $0, 992
addi $2, $0, 1056
j 0x40016b0
lh $31, 190($0)
lqv v26[0], 48(r22)
j 0x400164c
addi $20, $0, 1056
addiu $3, $0, 3552
addu $1, $0, $22
jal 0x40016b0
addu $2, $0, $20
sqv v6[0], 48($20)
sqv v5[0], 16($20)
lqv v27[0], 0(r3)
j 0x4001664
lqv v29[0], 2016(r3)
addi $19, $3, 16
vmudh v5, v31, v31[0w]
addi $18, $1, 8
ldv v3[0], 0(r2)
ldv v4[0], 32(r2)
lqv v1[0], 0(r1)
lqv v2[0], 32(r1)
ldv v3[8], 0(r2)
ldv v4[8], 32(r2)
vmadl v6, v4, v2[0h]
addi $1, $1, 2
vmadm v6, v3, v2[0h]
addi $2, $2, 8
vmadn v6, v4, v1[0h]
vmadh v5, v3, v1[0h]
bne $1, $18, 0x16bc
vmadn v6, v31, v31[0w]
addi $2, $2, 65504
addi $1, $1, 8
sqv v5[0], 0($3)
sqv v6[0], 32($3)
bne $3, $19, 0x16b4
addi $3, $3, 16
jr $31
sll $0, $0, 0
addi $8, $0, 896
lqv v3[0], 80(r0)
lsv v19[0], 2(r29)
lh $3, 4($29)
ldv v0[0], 0(r8)
ldv v1[0], 8(r8)
ldv v0[8], 0(r8)
ldv v1[8], 8(r8)
jr $31
vmudh v0, v0, v3
addi $8, $0, 1120
ldv v11[0], 24(r8)
ldv v11[8], 24(r8)
ldv v15[0], 56(r8)
ldv v15[8], 56(r8)
ldv v8[0], 0(r8)
ldv v9[0], 8(r8)
ldv v10[0], 16(r8)
ldv v12[0], 32(r8)
ldv v13[0], 40(r8)
ldv v14[0], 48(r8)
ldv v8[8], 0(r8)
ldv v9[8], 8(r8)
ldv v10[8], 16(r8)
ldv v12[8], 32(r8)
ldv v13[8], 40(r8)
jr $31
ldv v14[8], 48(r8)
lqv v0[0], 0(r22)
lh $5, 624($1)
j 0x400109c
sqv v0[0], 0($5)
bgtz $1, 0x17bc
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
ori $30, $0, 16
beq $0, $0, 0x10f0
lh $21, 256($0)
ori $30, $0, 24
beq $0, $0, 0x10f0
lh $21, 160($0)
ori $2, $0, 10240
mtc0 $2, $4
lqv v31[0], 48(r0)
lqv v30[0], 64(r0)
lw $4, 4036($0)
andi $4, $4, 1
bne $4, $0, 0x18dc
sll $0, $0, 0
lw $23, 40($1)
lw $3, 44($1)
sw $23, 64($29)
sw $3, 68($29)
mfc0 $4, $11
andi $4, $4, 1
bne $4, $0, 0x184c
mfc0 $4, $9
sub $23, $23, $4
bgtz $23, 0x184c
mfc0 $5, $10
beq $5, $0, 0x184c
sll $0, $0, 0
beq $5, $4, 0x184c
sll $0, $0, 0
j 0x4001868
ori $3, $4, 0
mfc0 $4, $11
andi $4, $4, 1024
bne $4, $0, 0x184c
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
lb $9, 5($29)
lh $11, 36($3)
lh $8, 36($2)
bgez $9, 0x1a24
lh $9, 36($1)
and $12, $11, $8
or $11, $11, $8
and $12, $12, $9
andi $12, $12, 28784
bne $12, $0, 0x1fd8
or $11, $11, $9
andi $11, $11, 17219
bne $11, $0, 0x17d0
llv v13[0], 24(r1)
llv v14[0], 24(r2)
llv v15[0], 24(r3)
addi $8, $0, 3040
lw $13, 4($29)
lsv v21[0], 2(r29)
lsv v5[0], 6(r1)
vsub v10, v14, v13
lsv v6[0], 14(r1)
vsub v9, v15, v13
lsv v5[2], 6(r2)
vsub v12, v13, v14
lsv v6[2], 14(r2)
lsv v5[4], 6(r3)
lsv v6[4], 14(r3)
vmudh v16, v9, v10[1w]
lh $9, 26($1)
vmadh v16, v12, v9[1w]
lh $10, 26($2)
vsar v28, v28, v28[1w]
lh $11, 26($3)
vsar v29, v29, v29[0w]
sll $15, $13, 18
vmudl v6, v6, v21[0w]
mfc2 $17, v16[0]
vmadm v5, v5, v21[0w]
sh $1, 3040($0)
vmadn v6, v31, v31[0w]
sh $2, 3042($0)
and $15, $17, $15
bltz $15, 0x1fd4
sh $3, 3044($0)
vsubc v21, v6, v6[1w]
slt $7, $11, $10
vlt v19, v5, v5[1w]
slt $12, $10, $9
vmrg v20, v6, v6[1w]
add $7, $7, $7
add $7, $7, $12
slt $12, $9, $11
add $7, $7, $7
add $7, $7, $12
vsubc v21, v20, v6[2w]
lbu $3, 864($7)
vlt v19, v19, v5[2w]
lbu $2, 871($7)
vmrg v20, v20, v6[2w]
lbu $1, 878($7)
lh $3, 3040($3)
lh $2, 3040($2)
lh $1, 3040($1)
lbu $12, 885($7)
vmudl v20, v20, v30[5w]
llv v15[0], 24(r3)
vmadm v19, v19, v30[5w]
llv v14[0], 24(r2)
vmadn v20, v31, v31[0w]
blez $12, 0x1b18
llv v13[0], 24(r1)
vsubc v28, v31, v28
vsub v29, v31, v29
beq $17, $0, 0x1fd8
vsub v4, v15, v14
sll $14, $13, 19
vsub v10, v14, v13
nor $14, $14, $0
vsub v9, v15, v13
or $14, $17, $14
vmov v29[3], v29[0]
mfc0 $7, $6
vmov v28[3], v28[0]
bgez $14, 0x1fd4
vmov v4[2], v10[0]
bne $7, $0, 0x1b38
lw $12, 24($29)
mtc0 $12, $9
ssv v15[2], 2($23)
vmov v4[3], v10[1]
ssv v14[2], 4($23)
vmov v4[4], v9[0]
ssv v13[2], 6($23)
vmov v4[5], v9[1]
jal 0x4001000
mfc2 $6, v29[5]
lb $5, 7($29)
vmudm v10, v4, v31[4w]
lsv v13[0], 24(r2)
vmadn v9, v31, v31[0w]
lsv v13[4], 24(r1)
vrcp v8[1], v4[1]
lsv v13[8], 24(r1)
vrcph v7[1], v31[0]
ori $5, $5, 200
lb $7, 18($29)
vrcp v8[3], v4[3]
ssv v19[0], 68($8)
vrcph v7[3], v31[0]
lsv v11[0], 34(r1)
vrcp v8[5], v4[5]
lsv v11[8], 34(r2)
vrcph v7[5], v31[0]
lsv v12[0], 32(r1)
vmudm v13, v13, v31[4w]
lsv v12[8], 32(r2)
vmadn v14, v31, v31[0w]
andi $6, $6, 128
or $6, $6, $7
vmudl v8, v8, v30[4w]
sb $5, 0($23)
vmadm v7, v7, v30[4w]
sb $6, 1($23)
vmadn v8, v31, v31[0w]
ssv v13[0], 8($23)
vmudl v6, v11, v20[0w]
ssv v14[0], 10($23)
vmadm v6, v12, v20[0w]
ssv v13[8], 16($23)
vmadn v6, v11, v19[0w]
ssv v14[8], 18($23)
vmadh v5, v12, v19[0w]
ssv v20[0], 76($8)
vmudl v1, v8, v9[0q]
ssv v13[4], 24($23)
vmadm v1, v7, v9[0q]
ssv v14[4], 26($23)
vmadn v1, v8, v10[0q]
llv v9[0], 20(r1)
vmadh v0, v7, v10[0q]
llv v9[8], 20(r2)
vmudl v8, v8, v31[4w]
lsv v9[4], 64(r0)
vmadm v7, v7, v31[4w]
lsv v9[12], 64(r0)
vmadn v8, v31, v31[0w]
addi $31, $24, 0
vmudl v1, v1, v31[4w]
vmadm v0, v0, v31[4w]
lsv v24[0], 34(r3)
vmadn v1, v31, v31[0w]
lsv v25[0], 32(r3)
vmudm v16, v9, v6[0h]
llv v22[0], 20(r3)
vmadh v9, v9, v5[0h]
lsv v22[4], 64(r0)
vmadn v10, v31, v31[0w]
addi $23, $23, 32
vcr v0, v0, v30[6w]
ssv v1[2], 238($23)
vmudh v4, v4, v31[5w]
ssv v1[10], 246($23)
vmudl v16, v24, v20[0w]
ssv v1[6], 254($23)
vmadm v20, v25, v20[0w]
sdv v9[8], 32($8)
vmadn v20, v24, v19[0w]
ssv v0[2], 236($23)
vmadh v19, v25, v19[0w]
ssv v0[10], 244($23)
vabs v5, v9, v9
ssv v0[6], 252($23)
vxor v6, v31, v31
andi $7, $5, 7
vmudm v29, v22, v20[0w]
sdv v9[0], 16($8)
vmadh v22, v22, v19[0w]
sdv v10[8], 40($8)
vmadn v29, v31, v31[0w]
llv v20[0], 40(r8)
blez $7, 0x1168
vmov v19[0], v5[4]
sdv v22[0], 48($8)
vmov v19[1], v5[5]
sdv v10[0], 24($8)
vabs v22, v22, v22
sdv v29[0], 56($8)
vadd v16, v6, v30[5w]
andi $7, $13, 512
vadd v24, v6, v30[5w]
bne $7, $0, 0x1d0c
vadd v28, v6, v30[5w]
luv v15[0], 16(r4)
vge v17, v5, v22
luv v23[0], 16(r4)
vmrg v18, v10, v29
j 0x4001d20
luv v25[0], 16(r4)
luv v15[0], 16(r1)
vge v17, v5, v22
luv v23[0], 16(r2)
vmrg v18, v10, v29
luv v25[0], 16(r3)
ldv v16[8], 24(r8)
lsv v16[14], 30(r1)
vmudm v15, v15, v31[7w]
ldv v24[8], 40(r8)
vmudm v23, v23, v31[7w]
lsv v24[14], 30(r2)
vmudm v25, v25, v31[7w]
ldv v15[8], 16(r8)
vge v17, v17, v19
ldv v23[8], 32(r8)
vmrg v18, v18, v20
lsv v15[14], 28(r1)
lsv v23[14], 28(r2)
ldv v28[8], 56(r8)
lsv v28[14], 30(r3)
ldv v25[8], 48(r8)
vsubc v12, v24, v16
lsv v25[14], 28(r3)
vsub v11, v23, v15
slv v17[0], 64($8)
vsubc v22, v16, v24
slv v18[0], 72($8)
vsub v21, v15, v23
sdv v15[0], 0($23)
vsubc v20, v16, v28
sdv v16[0], 16($23)
vsub v19, v15, v25
andi $7, $5, 4
vsubc v10, v28, v16
andi $6, $5, 1
vsub v9, v25, v15
vmudn v5, v12, v4[4w]
vmadh v5, v11, v4[4w]
vmadn v5, v20, v4[2w]
vmadh v5, v19, v4[2w]
vsar v11, v11, v11[0w]
vsar v12, v12, v12[1w]
vmudn v5, v10, v4[3w]
vmadh v5, v9, v4[3w]
vmadn v5, v22, v4[5w]
vmadh v5, v21, v4[5w]
vsar v9, v9, v9[0w]
vsar v10, v10, v10[1w]
vmudl v5, v12, v26[3w]
addi $16, $0, 2048
vmadm v5, v11, v26[3w]
mtc2 $16, v19
vmadn v12, v12, v27[3w]
ldv v20[8], 64(r8)
vmadh v11, v11, v27[3w]
ldv v21[8], 72(r8)
vmudl v5, v10, v26[3w]
vmadm v5, v9, v26[3w]
vmadn v10, v10, v27[3w]
sdv v12[0], 56($23)
vmadh v9, v9, v27[3w]
sdv v11[0], 40($23)
vmudn v5, v12, v31[1w]
vmadh v5, v11, v31[1w]
sdv v10[0], 24($23)
vmadl v5, v10, v1[5w]
sdv v9[0], 8($23)
vmadm v5, v9, v1[5w]
vmadn v14, v10, v0[5w]
vmadh v13, v9, v0[5w]
vabs v25, v11, v11
vmudl v21, v21, v19[0w]
vmadm v20, v20, v19[0w]
sdv v14[0], 48($23)
vmadn v21, v31, v31[0w]
sdv v13[0], 32($23)
vabs v24, v9, v9
beq $7, $0, 0x1e4c
vmudm v25, v25, v19[0w]
addi $23, $23, 64
vmadn v27, v31, v31[0w]
andi $7, $5, 2
vmudm v24, v24, v19[0w]
blez $7, 0x1f78
vmadn v26, v31, v31[0w]
vmudn v19, v21, v31[1w]
vmadh v19, v20, v31[1w]
vmadn v19, v27, v31[1w]
vmadh v19, v25, v31[1w]
vmadn v6, v26, v31[2w]
vmadh v5, v24, v31[2w]
addi $23, $23, 64
vsubc v19, v6, v6[5w]
vge v5, v5, v5[5w]
vmrg v6, v6, v6[5w]
vmudn v21, v14, v30[4w]
vmadh v20, v13, v30[4w]
vmadn v21, v31, v31[0w]
vsubc v19, v6, v6[6w]
vge v5, v5, v5[6w]
vmrg v6, v6, v6[6w]
ssv v20[14], 8($23)
vmudn v23, v16, v30[4w]
ssv v21[14], 10($23)
vmadh v22, v15, v30[4w]
vmadn v23, v31, v31[0w]
vmudl v6, v6, v30[3w]
vmadm v5, v5, v30[3w]
vmadn v6, v31, v31[0w]
ssv v22[14], 0($23)
ssv v23[14], 2($23)
vrcph v19[0], v5[4]
vrcpl v6[0], v6[4]
vrcph v5[0], v31[0]
vmudn v6, v6, v31[2w]
vmadh v5, v5, v31[2w]
vmudn v21, v10, v30[4w]
vmadh v20, v9, v30[4w]
vmadn v21, v31, v31[0w]
vlt v5, v5, v31[1w]
vmrg v6, v6, v31[0w]
vmudn v23, v12, v30[4w]
ssv v20[14], 4($23)
vmadh v22, v11, v30[4w]
ssv v21[14], 6($23)
vmadn v23, v31, v31[0w]
vmudl v21, v16, v6[0w]
vmadm v21, v15, v6[0w]
vmadn v21, v16, v5[0w]
ssv v22[14], 12($23)
ssv v23[14], 14($23)
vmadh v20, v15, v5[0w]
vmudl v23, v10, v6[0w]
vmadm v23, v9, v6[0w]
vmadn v23, v10, v5[0w]
sdv v21[8], 976($23)
vmadh v22, v9, v5[0w]
sdv v20[8], 960($23)
vmudl v21, v12, v6[0w]
vmadm v21, v11, v6[0w]
vmadn v21, v12, v5[0w]
sdv v23[8], 984($23)
vmadh v20, v11, v5[0w]
sdv v22[8], 968($23)
vmudl v23, v14, v6[0w]
vmadm v23, v13, v6[0w]
vmadn v23, v14, v5[0w]
sdv v21[8], 1016($23)
vmadh v22, v13, v5[0w]
sdv v20[8], 1000($23)
sdv v23[8], 1008($23)
beq $6, $0, 0x1168
sdv v22[8], 992($23)
j 0x4001168
addi $23, $23, 16
blez $6, 0x1168
vmudn v14, v14, v30[4w]
vmadh v13, v13, v30[4w]
vmadn v14, v31, v31[0w]
vmudn v16, v16, v30[4w]
vmadh v15, v15, v30[4w]
vmadn v16, v31, v31[0w]
ssv v13[14], 8($23)
vmudn v10, v10, v30[4w]
ssv v14[14], 10($23)
vmadh v9, v9, v30[4w]
vmadn v10, v31, v31[0w]
ssv v15[14], 0($23)
vmudn v12, v12, v30[4w]
ssv v16[14], 2($23)
vmadh v11, v11, v30[4w]
addi $23, $23, 16
vmadn v12, v31, v31[0w]
ssv v9[14], 244($23)
ssv v10[14], 246($23)
ssv v11[14], 252($23)
j 0x4001168
ssv v12[14], 254($23)
addi $31, $0, 0
jr $24
sll $0, $0, 0
vrcph v27[3], v29[3]
vrcpl v26[3], v28[3]
vrcph v27[3], v29[7]
vrcpl v26[7], v28[7]
vrcph v27[7], v31[0]
vmudn v26, v26, v31[2w]
vmadh v27, v27, v31[2w]
vmadn v26, v31, v31[0w]
lqv v23[0], 96(r0)
vxor v22, v31, v31
vmudl v24, v26, v28
vmadm v24, v27, v28
vmadn v24, v26, v29
vmadh v25, v27, v29
vsubc v24, v22, v24
vsub v25, v23, v25
vmudl v22, v26, v24
vmadm v23, v27, v24
vmadn v26, v26, v25
vmadh v27, v27, v25
jr $31
sll $0, $0, 0
jal 0x400112c
addi $27, $0, 2464
lw $25, 0($27)
lw $24, 4($27)
srl $1, $25, 29
andi $1, $1, 6
addi $27, $27, 8
bgtz $1, 0x2070
andi $18, $25, 1023
addi $22, $0, 2784
jal 0x400110c
add $19, $24, $0
beq $0, $0, 0x2084
sh $31, 344($0)
sll $0, $0, 0
sll $0, $0, 0
ori $30, $0, 24
beq $0, $0, 0x1988
lh $21, 160($0)
sh $3, 3136($0)
sh $2, 3138($0)
sh $1, 3140($0)
sh $0, 3142($0)
ori $7, $0, 3512
ori $30, $0, 3136
ori $6, $0, 12
or $5, $30, $30
xori $30, $30, 20
beq $6, $0, 0x2254
lh $11, 166($6)
addi $6, $6, 65534
ori $17, $0, 0
or $18, $0, $0
ori $2, $5, 0
j 0x400183c
addi $14, $30, 2
and $8, $8, $11
beq $8, $18, 0x2104
addi $2, $2, 2
or $20, $10, $0
sh $10, 0($14)
addi $14, $14, 2
lh $10, 0($2)
bne $10, $0, 0x20c8
lh $8, 36($10)
addi $8, $17, 65534
bgtz $8, 0x20e0
ori $2, $5, 0
beq $8, $0, 0x20a8
sll $0, $0, 0
jr $24
xor $18, $18, $11
lh $8, 246($17)
addi $17, $17, 2
jr $8
lh $8, 258($0)
mtc2 $10, v13
or $10, $20, $0
mfc2 $20, v13[0]
ori $14, $30, 0
lh $8, 248($0)
sh $8, 262($0)
addi $7, $7, 40
sh $7, 0($14)
sh $0, 2($14)
ldv v9[0], 0(r10)
ldv v10[0], 8(r10)
ldv v4[0], 0(r20)
ldv v5[0], 8(r20)
sll $8, $6, 2
ldv v1[0], 112(r8)
vmudh v0, v1, v31[3w]
vmudn v12, v5, v1
vmadh v11, v4, v1
vmadn v12, v31, v31[0w]
vmadn v28, v10, v0
vmadh v29, v9, v0
vmadn v28, v31, v31[0w]
vaddc v26, v28, v28[0q]
vadd v27, v29, v29[0q]
vaddc v28, v26, v26[1h]
vadd v29, v27, v27[1h]
mfc2 $8, v29[6]
vrcph v7[3], v29[3]
vrcpl v3[3], v28[3]
vrcph v7[3], v31[0]
vmudn v3, v3, v31[2w]
bgez $8, 0x21a4
vmadh v7, v7, v31[2w]
vmudn v3, v3, v31[3w]
vmadh v7, v7, v31[3w]
veq v7, v7, v31[0w]
vmrg v3, v3, v31[3w]
vmudl v28, v28, v3[3w]
vmadm v29, v29, v3[3w]
jal 0x4001000
vmadn v28, v31, v31[0w]
vaddc v28, v12, v12[0q]
vadd v29, v11, v11[0q]
vaddc v12, v28, v28[1h]
vadd v11, v29, v29[1h]
vmudl v15, v12, v26
vmadm v15, v11, v26
vmadn v15, v12, v27
vmadh v8, v11, v27
vmudl v28, v31, v31[5w]
vmadl v15, v15, v3[3w]
vmadm v8, v8, v3[3w]
vmadn v15, v31, v31[0w]
veq v8, v8, v31[0w]
vmrg v15, v15, v31[3w]
vne v15, v15, v31[0w]
vmrg v15, v15, v31[1w]
vnxor v8, v15, v31[0w]
vaddc v8, v8, v31[1w]
vadd v29, v29, v29
vmudl v28, v5, v8[3h]
vmadm v29, v4, v8[3h]
vmadl v28, v10, v15[3h]
vmadm v29, v9, v15[3h]
vmadn v28, v31, v31[0w]
luv v12[0], 16(r10)
luv v11[0], 16(r20)
llv v12[8], 20(r10)
llv v11[8], 20(r20)
vmudm v18, v12, v15[3w]
vmadm v18, v11, v8[3w]
suv v18[0], 0($7)
sdv v18[8], 8($7)
ldv v18[0], 8(r7)
jal 0x4001714
lw $15, 0($7)
mfc2 $10, v13[0]
j 0x40014b4
ori $9, $0, 1
lh $8, 0($5)
sh $5, 262($0)
addi $30, $24, 0
lh $24, 254($0)
sh $8, 180($0)
lh $8, 262($0)
lh $3, 180($0)
lh $2, 2($8)
lh $1, 4($8)
addi $8, $8, 2
bne $1, $0, 0x22bc
sh $8, 262($0)
jalr $30, $31
ori $30, $0, 16
beq $0, $0, 0x1ba8
lh $21, 256($0)
lw $1, 300($0)
sw $15, 0($7)
sw $16, 4($7)
bltz $1, 0x232c
lpv v4[0], 0(r7)
luv v7[0], 464(r1)
vxor v27, v27, v27
vge v7, v7, v31[0w]
lpv v5[0], 448(r1)
vadd v27, v27, v7
luv v7[0], 432(r1)
vor v20, v6, v31[0w]
vmulf v6, v4, v5
vadd v3, v6, v6[1q]
vadd v6, v3, v6[2h]
vmulf v7, v7, v6[0h]
bgtz $1, 0x22b0
addi $1, $1, 65504
suv v27[0], 0($7)
andi $8, $3, 4
sb $15, 3($7)
sb $16, 7($7)
lw $15, 0($7)
beq $8, $0, 0x1f64
lw $16, 4($7)
andi $8, $3, 8
lpv v7[0], 144(r29)
ldv v6[0], 160(r0)
vmadn v20, v7, v20[0h]
beq $8, $0, 0x2324
vmadm v18, v31, v31[0w]
vmulf v7, v18, v18
vmulf v7, v7, v18
vmulf v20, v7, v6[1w]
vmacf v20, v7, v6[3w]
vmacf v18, v18, v6[2w]
j 0x40014ac
vadd v18, v18, v31[4w]
andi $1, $1, 4095
sw $1, 300($0)
jal 0x4001750
addi $8, $0, 992
ori $8, $0, 3552
stv v8[2], 16($8)
stv v8[4], 32($8)
stv v8[12], 48($8)
stv v8[14], 64($8)
ltv v8[14], 16(r8)
ltv v8[12], 32(r8)
ltv v8[4], 48(r8)
ltv v8[2], 64(r8)
sdv v12[8], 16($8)
sdv v13[8], 32($8)
sdv v14[8], 48($8)
ldv v12[0], 16(r8)
ldv v13[0], 32(r8)
ldv v14[0], 48(r8)
lpv v5[0], 440(r1)
vmulf v5, v5, v31[4w]
vmudn v6, v12, v5[0h]
vmadn v6, v13, v5[1h]
vmadn v6, v14, v5[2h]
vmadm v3, v31, v31[0w]
vmudm v6, v3, v31[2w]
vmacf v3, v8, v5[0h]
vmacf v3, v9, v5[1h]
vmacf v3, v10, v5[2h]
vmadn v6, v31, v31[0w]
vmudl v5, v6, v6
vmadm v5, v3, v6
vmadn v5, v6, v3
vmadh v26, v3, v3
vaddc v7, v5, v5[1q]
vadd v4, v26, v26[1q]
vaddc v7, v5, v7[0h]
vadd v4, v26, v4[0h]
vrsqh v11[0], v4[2]
vrsql v15[0], v7[2]
vrsqh v11[0], v31[0]
vmudl v15, v15, v30[3w]
vmadm v11, v11, v30[3w]
vmadn v15, v31, v31[0w]
vmudl v7, v6, v15[0w]
vmadm v7, v3, v15[0w]
vmadn v7, v6, v11[0w]
vmadh v4, v3, v11[0w]
vmadn v7, v31, v31[0w]
ldv v2[0], 248(r29)
vge v7, v7, v2[0w]
vlt v7, v7, v2[1w]
vmudn v7, v7, v2[2w]
spv v7[0], 448($1)
lw $8, 448($1)
sw $8, 452($1)
bgtz $1, 0x2378
addi $1, $1, 65504
j 0x400173c
lh $31, 160($0)
sll $0, $0, 0
j 0x40017f0
sll $0, $0, 0
sll $0, $0, 0
jal 0x400112c
ori $2, $0, 16384
mtc0 $2, $4
break
sll $0, $0, 0
ori $2, $0, 4096
sw $28, 3044($0)
sw $27, 3048($0)
sw $26, 3052($0)
sw $23, 3056($0)
lw $19, 264($0)
ori $20, $0, 0
ori $18, $0, 3071
jal 0x4001140
ori $17, $0, 1
jal 0x400112c
sll $0, $0, 0
j 0x40010bc
mtc0 $2, $4
sll $0, $0, 0
sll $0, $0, 0
addiu $0, $0, 48879
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
