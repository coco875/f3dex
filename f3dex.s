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
sbv v31[6], 127($29)
.close // CODE_FILE
