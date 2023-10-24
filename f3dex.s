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
swc2 $31, 796
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
lwc2 $2, 6144
lwc2 $2, 7170
srl $9, $9, 2
jal 0x40016e8
lhu $7, 796($1)
lwc2 $17, 4101
jal 0x4001710
lwc2 $17, 5125
cop2 2
lwc2 $18, 4098
cop2 11
lw $15, 12($22)
cop2 10
lw $16, 28($22)
cop2 11
andi $1, $3, 2
cop2 10
cop2 11
cop2 10
lwc2 $18, 5126
cop2 11
bne $1, $0, 0x17b4
addi $22, $22, 32
cop2 1
lwc2 $21, 2107
cop2 2
cop2 11
cop2 1
cop2 0
cfc2 $13, $1
cop2 1
cop2 0
andi $8, $13, 1799
andi $13, $13, 28784
sll $8, $8, 4
sll $13, $13, 16
or $13, $13, $8
cfc2 $14, $1
andi $8, $14, 1799
cop2 16
andi $14, $14, 28784
cop2 16
sll $14, $14, 12
cop2 0
or $8, $8, $14
cop2 9
or $8, $8, $13
cop2 10
jal 0x4001000
sh $8, 36($7)
cop2 3
swc2 $21, 6144
cop2 3
swc2 $20, 6145
cop2 0
cop2 9
cop2 10
cop2 11
addi $9, $9, 65534
cop2 0
cop2 9
cop2 10
andi $12, $3, 1
lwc2 $2, 6144
cop2 3
lwc2 $2, 7170
cop2 10
lwc2 $29, 6149
cop2 11
lwc2 $29, 7173
cop2 10
cop2 3
sw $15, 16($7)
beq $12, $0, 0x1590
cop2 0
lwc2 $3, 8249
cop2 2
cop2 11
cop2 16
cop2 3
cop2 0
swc2 $4, 659
sw $16, 24($7)
swc2 $4, 1691
lw $16, 24($7)
swc2 $18, 4101
swc2 $6, 6147
swc2 $7, 2575
swc2 $27, 2832
bltz $9, 0x15d4
swc2 $26, 2833
swc2 $21, 7173
swc2 $20, 7174
swc2 $18, 5135
sw $16, 56($7)
swc2 $6, 7176
swc2 $7, 3619
swc2 $27, 3876
swc2 $26, 3877
sw $8, 76($7)
addi $7, $7, 80
bgtz $9, 0x145c
lh $8, 262($0)
jr $8
andi $8, $1, 1
swc2 $31, 796
bne $8, $0, 0x1654
andi $7, $1, 2
addi $20, $0, 992
andi $8, $1, 4
beq $8, $0, 0x1620
lwc2 $26, 8195
lw $19, 36($29)
lw $8, 76($29)
addi $17, $0, 1
addi $1, $19, 64
beq $19, $8, 0x1620
addi $12, $0, 63
jal 0x4001140
sw $1, 36($29)
jal 0x400112c
lwc2 $28, 8193
beq $7, $0, 0x1660
lwc2 $27, 8194
swc2 $26, 8195
lwc2 $29, 8192
swc2 $28, 8193
addi $3, $0, 1120
swc2 $27, 8194
swc2 $29, 8192
addi $1, $0, 992
addi $2, $0, 1056
j 0x4001684
lh $31, 190($0)
lwc2 $26, 8195
j 0x4001620
addi $20, $0, 1056
addiu $3, $0, 3552
addu $1, $0, $22
jal 0x4001684
addu $2, $0, $20
swc2 $6, 8195
swc2 $5, 8193
lwc2 $27, 8192
j 0x4001638
lwc2 $29, 8318
addi $19, $3, 16
cop2 3
addi $18, $1, 8
lwc2 $3, 6144
lwc2 $4, 6148
lwc2 $1, 8192
lwc2 $2, 8194
lwc2 $3, 7168
lwc2 $4, 7172
cop2 8
addi $1, $1, 2
cop2 9
addi $2, $2, 8
cop2 10
cop2 11
bne $1, $18, 0x1690
cop2 10
addi $2, $2, 65504
addi $1, $1, 8
swc2 $5, 8192
swc2 $6, 8194
bne $3, $19, 0x1688
addi $3, $3, 16
jr $31
sll $0, $0, 0
addi $8, $0, 896
lwc2 $3, 8197
lwc2 $19, 2049
lh $3, 4($29)
lwc2 $0, 6144
lwc2 $1, 6145
lwc2 $0, 7168
lwc2 $1, 7169
jr $31
cop2 3
addi $8, $0, 1120
lwc2 $11, 6147
lwc2 $11, 7171
lwc2 $15, 6151
lwc2 $15, 7175
lwc2 $8, 6144
lwc2 $9, 6145
lwc2 $10, 6146
lwc2 $12, 6148
lwc2 $13, 6149
lwc2 $14, 6150
lwc2 $8, 7168
lwc2 $9, 7169
lwc2 $10, 7170
lwc2 $12, 7172
lwc2 $13, 7173
jr $31
lwc2 $14, 7174
lwc2 $0, 8192
lh $5, 624($1)
j 0x400109c
swc2 $0, 8192
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
lwc2 $31, 8195
lwc2 $30, 8196
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
lwc2 $13, 4102
lwc2 $14, 4102
lwc2 $15, 4102
lw $13, 4($29)
addi $8, $0, 3040
lwc2 $21, 2049
lwc2 $5, 2051
cop2 17
lwc2 $6, 2055
cop2 17
lwc2 $5, 2307
cop2 17
lwc2 $6, 2311
lwc2 $5, 2563
lwc2 $6, 2567
cop2 3
lh $9, 26($1)
cop2 11
lh $10, 26($2)
cop2 25
lh $11, 26($3)
cop2 25
sll $15, $13, 18
mfc2 $17, $16
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
lwc2 $15, 4102
lwc2 $14, 4102
blez $12, 0x1ab8
lwc2 $13, 4102
cop2 17
cop2 17
beq $17, $0, 0x1fa4
cop2 17
sll $14, $13, 19
cop2 17
nor $14, $14, $0
cop2 17
or $14, $17, $14
cop2 19
bgez $14, 0x1fa0
cop2 19
swc2 $15, 2305
cop2 19
swc2 $14, 2306
cop2 19
swc2 $13, 2307
cop2 19
mfc2 $6, $29
cop2 19
jal 0x4001000
cop2 2
lb $5, 7($29)
cop2 1
cop2 10
andi $6, $6, 128
cop2 16
ori $5, $5, 200
cop2 18
lb $7, 18($29)
cop2 16
cop2 18
cop2 16
cop2 18
or $6, $6, $7
cop2 0
sb $5, 0($23)
cop2 9
sb $6, 1($23)
cop2 10
cop2 3
lwc2 $12, 2060
cop2 0
lwc2 $12, 2572
cop2 9
lwc2 $12, 3084
cop2 10
cop2 0
cop2 9
cop2 10
cop2 11
cop2 10
sw $3, 0($8)
cop2 0
cop2 9
cop2 10
cop2 0
cop2 9
cop2 10
cop2 8
cop2 1
sw $2, 4($8)
cop2 10
sw $1, 8($8)
cop2 2
swc2 $12, 2052
cop2 0
swc2 $13, 2053
cop2 9
swc2 $0, 2310
cop2 10
swc2 $1, 2311
andi $7, $5, 2
addi $15, $8, 8
addi $16, $8, 16
cop2 17
swc2 $0, 3338
cop2 17
swc2 $1, 3339
cop2 17
swc2 $0, 2830
cop2 0
swc2 $1, 2831
cop2 3
swc2 $9, 3080
cop2 17
swc2 $3, 3081
cop2 0
swc2 $9, 2572
cop2 3
swc2 $3, 2573
addi $23, $23, 32
blez $7, 0x1ce8
cop2 0
lw $14, 0($15)
cop2 9
lw $17, 65532($15)
cop2 10
lw $18, 65528($15)
lwc2 $9, 4101
lwc2 $9, 5125
lwc2 $22, 4101
lwc2 $11, 2065
lwc2 $12, 2064
lwc2 $11, 3089
cop2 19
lwc2 $12, 3088
cop2 19
lwc2 $24, 2065
cop2 19
lwc2 $25, 2064
cop2 0
cop2 9
swc2 $19, 2082
cop2 10
swc2 $20, 2086
cop2 11
cop2 0
cop2 9
cop2 10
cop2 11
cop2 1
cop2 11
cop2 10
cop2 1
cop2 11
cop2 10
swc2 $9, 7170
swc2 $10, 7171
swc2 $9, 6144
swc2 $10, 6145
swc2 $22, 6148
swc2 $23, 6149
cop2 19
lwc2 $19, 4100
cop2 19
lwc2 $20, 4102
cop2 19
cop2 3
cop2 3
cop2 3
cop2 3
swc2 $17, 4112
swc2 $18, 4114
andi $7, $5, 7
blez $7, 0x1f98
cop2 8
lwc2 $25, 14338
cop2 16
lwc2 $15, 14338
cop2 16
andi $7, $13, 512
cop2 16
bgtz $7, 0x1d28
lwc2 $23, 14338
lwc2 $25, 14338
lwc2 $15, 14338
lwc2 $23, 14338
cop2 1
cop2 1
cop2 1
lwc2 $16, 7171
lwc2 $15, 7170
lwc2 $24, 7173
lwc2 $23, 7172
lwc2 $5, 7175
lwc2 $25, 7174
lwc2 $16, 3855
lwc2 $15, 3854
lwc2 $24, 3855
lwc2 $23, 3854
lwc2 $5, 3855
lwc2 $25, 3854
cop2 17
cop2 17
cop2 17
cop2 17
cop2 17
cop2 17
cop2 17
cop2 17
cop2 2
cop2 11
cop2 10
cop2 11
cop2 25
cop2 25
cop2 2
cop2 11
cop2 10
cop2 11
cop2 25
cop2 25
cop2 0
cop2 9
cop2 10
cop2 11
cop2 0
cop2 9
cop2 10
swc2 $9, 6145
cop2 11
swc2 $10, 6147
cop2 2
cop2 11
cop2 8
cop2 9
cop2 10
swc2 $11, 6149
cop2 11
swc2 $12, 6151
cop2 0
swc2 $13, 6148
cop2 9
swc2 $14, 6150
cop2 10
cop2 17
cop2 17
andi $7, $5, 4
blez $7, 0x1e30
andi $7, $5, 2
addi $23, $23, 64
swc2 $17, 6264
swc2 $18, 6266
blez $7, 0x1f2c
andi $7, $5, 1
addi $16, $0, 2048
mtc2 $16, $19
cop2 19
lwc2 $20, 7176
cop2 19
lwc2 $21, 7177
cop2 1
cop2 10
cop2 1
cop2 10
cop2 0
cop2 9
cop2 10
cop2 2
cop2 11
cop2 10
cop2 10
cop2 11
cop2 10
cop2 11
cop2 17
cop2 3
cop2 3
cop2 17
cop2 3
cop2 3
cop2 0
cop2 9
cop2 10
cop2 18
cop2 17
cop2 18
cop2 2
cop2 11
cop2 0
cop2 3
cop2 0
cop2 9
cop2 10
cop2 11
cop2 0
cop2 9
cop2 10
swc2 $19, 7168
cop2 11
swc2 $20, 7170
cop2 0
cop2 9
cop2 10
swc2 $21, 7169
cop2 11
swc2 $22, 7171
cop2 0
cop2 9
cop2 10
swc2 $23, 7173
cop2 11
swc2 $24, 7175
addi $23, $23, 64
swc2 $25, 7292
swc2 $26, 7294
blez $7, 0x1f98
cop2 2
cop2 11
cop2 10
cop2 2
cop2 11
cop2 10
swc2 $13, 3844
cop2 2
swc2 $14, 3845
cop2 11
cop2 10
cop2 2
cop2 11
cop2 10
swc2 $9, 3842
cop2 0
swc2 $10, 3843
cop2 9
swc2 $11, 3846
cop2 10
swc2 $12, 3847
cop2 17
cop2 17
addi $23, $23, 16
swc2 $17, 3960
swc2 $18, 3961
jal 0x4001168
addi $31, $24, 0
addi $31, $0, 0
jr $24
sll $0, $0, 0
sll $0, $0, 0
cop2 18
cop2 17
cop2 18
cop2 17
cop2 18
cop2 2
cop2 11
cop2 10
lwc2 $23, 8198
cop2 8
cop2 0
cop2 9
cop2 10
cop2 11
cop2 17
cop2 17
cop2 0
cop2 9
cop2 10
cop2 11
jr $31
sll $0, $0, 0
jal 0x400112c
addi $27, $0, 2464
lw $25, 0($27)
lw $24, 4($27)
srl $1, $25, 29
andi $1, $1, 6
addi $27, $27, 8
bgtz $1, 0x2040
andi $18, $25, 1023
addi $22, $0, 2784
jal 0x400110c
add $19, $24, $0
beq $0, $0, 0x2054
sh $31, 344($0)
sll $0, $0, 0
sll $0, $0, 0
ori $30, $0, 24
beq $0, $0, 0x1980
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
beq $6, $0, 0x2224
lh $11, 166($6)
addi $6, $6, 65534
ori $17, $0, 0
or $18, $0, $0
ori $2, $5, 0
j 0x4001814
addi $14, $30, 2
and $8, $8, $11
beq $8, $18, 0x20d4
addi $2, $2, 2
or $20, $10, $0
sh $10, 0($14)
addi $14, $14, 2
lh $10, 0($2)
bne $10, $0, 0x2098
lh $8, 36($10)
addi $8, $17, 65534
bgtz $8, 0x20b0
ori $2, $5, 0
beq $8, $0, 0x2078
sll $0, $0, 0
jr $24
xor $18, $18, $11
lh $8, 246($17)
addi $17, $17, 2
jr $8
lh $8, 258($0)
mtc2 $10, $13
or $10, $20, $0
mfc2 $20, $13
ori $14, $30, 0
lh $8, 248($0)
sh $8, 262($0)
addi $7, $7, 40
sh $7, 0($14)
sh $0, 2($14)
lwc2 $9, 6144
lwc2 $10, 6145
lwc2 $4, 6144
lwc2 $5, 6145
sll $8, $6, 2
lwc2 $1, 6158
cop2 3
cop2 2
cop2 11
cop2 10
cop2 10
cop2 11
cop2 10
cop2 16
cop2 16
cop2 16
cop2 16
mfc2 $8, $29
cop2 18
cop2 17
cop2 18
cop2 2
bgez $8, 0x2174
cop2 11
cop2 2
cop2 11
cop2 1
cop2 3
cop2 0
cop2 9
jal 0x4001000
cop2 10
cop2 16
cop2 16
cop2 16
cop2 16
cop2 0
cop2 9
cop2 10
cop2 11
cop2 0
cop2 8
cop2 9
cop2 10
cop2 1
cop2 3
cop2 2
cop2 3
cop2 9
cop2 16
cop2 16
cop2 0
cop2 9
cop2 8
cop2 9
cop2 10
lwc2 $12, 14338
lwc2 $11, 14338
lwc2 $12, 5125
lwc2 $11, 5125
cop2 1
cop2 9
swc2 $18, 14336
swc2 $18, 7169
lwc2 $18, 6145
jal 0x40016e8
lw $15, 0($7)
mfc2 $10, $13
j 0x400149c
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
bne $1, $0, 0x2284
sh $8, 262($0)
jalr $30, $31
ori $30, $0, 16
beq $0, $0, 0x1ba0
lh $21, 256($0)
lw $1, 300($0)
sw $15, 0($7)
sw $16, 4($7)
bltz $1, 0x22fc
lwc2 $4, 12288
lwc2 $7, 14394
cop2 8
cop2 3
lwc2 $5, 12344
cop2 16
lwc2 $7, 14390
cop2 10
cop2 0
cop2 16
cop2 16
cop2 0
bgtz $1, 0x2280
addi $1, $1, 65504
swc2 $27, 14336
andi $8, $3, 4
sb $15, 3($7)
sb $16, 7($7)
lw $15, 0($7)
beq $8, $0, 0x1f48
lw $16, 4($7)
andi $8, $3, 8
lwc2 $7, 12306
lwc2 $6, 6164
cop2 10
beq $8, $0, 0x22f4
cop2 9
cop2 0
cop2 0
cop2 0
cop2 8
cop2 8
j 0x4001498
cop2 16
andi $1, $1, 4095
sw $1, 300($0)
jal 0x4001724
addi $8, $0, 992
ori $8, $0, 3552
swc2 $8, 22785
swc2 $8, 23042
swc2 $8, 24067
swc2 $8, 24324
lwc2 $8, 24321
lwc2 $8, 24066
lwc2 $8, 23043
lwc2 $8, 22788
swc2 $12, 7170
swc2 $13, 7172
swc2 $14, 7174
lwc2 $12, 6146
lwc2 $13, 6148
lwc2 $14, 6150
lwc2 $5, 12343
cop2 0
cop2 2
cop2 10
cop2 10
cop2 9
cop2 1
cop2 8
cop2 8
cop2 8
cop2 10
cop2 0
cop2 9
cop2 10
cop2 11
cop2 16
cop2 16
cop2 16
cop2 16
cop2 18
cop2 17
cop2 18
cop2 0
cop2 9
cop2 10
cop2 0
cop2 9
cop2 10
cop2 11
cop2 10
lwc2 $2, 6175
cop2 3
cop2 0
cop2 2
swc2 $7, 12344
lw $8, 448($1)
sw $8, 452($1)
bgtz $1, 0x2348
addi $1, $1, 65504
j 0x4001710
lh $31, 160($0)
sll $0, $0, 0
j 0x40017c8
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

.close // CODE_FILE
