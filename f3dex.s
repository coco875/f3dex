.rsp

.include "rsp/rsp_defs.inc"
.include "rsp/gbi.inc"

// This file assumes DATA_FILE and CODE_FILE are set on the command line

.if version() < 110
    .error "armips 0.11 or newer is required"
.endif

// Arguments to mtx_multiply
output_mtx  equ $18 // also dmaLen, also used by itself
input_mtx_1 equ $19 // also dmemAddr and xfrmLtPtr
input_mtx_0 equ $20 // also clipPolyWrite

// Arguments to dma_read_write
dmaLen   equ $18 // also output_mtx, also used by itself
dmemAddr equ $19 // also input_mtx_1 and xfrmLtPtr
// cmd_w1_dram   // used for all dma_read_write DRAM addresses, not just second word of command

// Tweak the li and la macros so that the output matches
.macro li, reg, imm
    addi reg, $zero, imm
.endmacro

.macro la, reg, imm
    addiu reg, $zero, imm
.endmacro

.macro move, dst, src
    ori dst, src, 0
.endmacro

// Prohibit macros involving slt; this silently clobbers $1. You can of course
// manually write the slt and branch instructions if you want this behavior.
.macro blt, ra, rb, lbl
    .error "blt is a macro using slt, and silently clobbers $1!"
.endmacro

.macro bgt, ra, rb, lbl
    .error "bgt is a macro using slt, and silently clobbers $1!"
.endmacro

.macro ble, ra, rb, lbl
    .error "ble is a macro using slt, and silently clobbers $1!"
.endmacro

.macro bge, ra, rb, lbl
    .error "bge is a macro using slt, and silently clobbers $1!"
.endmacro

// Vector macros
.macro vcopy, dst, src
    vadd dst, src, $v0[0]
.endmacro

.macro vclr, dst
    vxor dst, dst, dst
.endmacro

ACC_UPPER equ 0
ACC_MIDDLE equ 1
ACC_LOWER equ 2
.macro vreadacc, dst, N
    vsar dst, dst, dst[N]
.endmacro

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
.create CODE_FILE, 0x4001080
start:
    j branch_0x17c0
    li $29, 272
    jal branch_0x113c
    add $20, $0, $22
    lh $2, 188($1)
    jr $2
    srl $2, $25, 23
branch_0x109C:
    mfc0 $2, SP_STATUS
    andi $2, $2, 128
    bne $2, $0, branch_0x10C0
    lh $21, 38($0)
branch_0x10AC:
    bne $28, $27, 0x4001064
    lw $25, 0($27)
    j branch_0x10c8
    lh $31, 260($0)
branch_0x10BC:
    lh $21, 182($0)
branch_0x10C0:
    j branch_0x10F0
    ori $30, $0, 32
branch_0x10c8:
    li $28, 2784
    add $21, $0, $31
    li $20, 2464
    add $19, $0, $26
    addi $26, $26, 320
    jal branch_0x113c
    li $18, 319
    jr $21
    li $27, 2464
branch_0x10EC:
    add $21, $0, $31
branch_0x10F0:
    lw $19, 0($30)
    lh $18, 4($30)
    jal branch_0x113c
    lh $20, 6($30)
    jal branch_0x112C
    nop
    jr $21
branch_0x110C:
    lw $11, 184($0)
    srl $12, $19, 22
    andi $12, $12, 60
    and $19, $19, $11
    add $13, $0, $12
    lw $12, 352($13)
    jr $31
    add $19, $19, $12
branch_0x112C:
    mfc0 $11, $6
    bne $11, $0, branch_0x112C
    nop
    jr $31
branch_0x113c:
    add $17, $0, $0
branch_0x1140:
    mfc0 $11, $5
    bne $11, $0, branch_0x1140
    nop
    mtc0 $20, SP_MEM_ADDR
    bgtz $17, dma_write
    mtc0 $19, $1
    jr $31
    mtc0 dmaLen, SP_RD_LEN
dma_write:
    jr $31
    mtc0 dmaLen, SP_WR_LEN
branch_0x1168:
    add $21, $0, $31
    lw $19, 24($29)
    addi $18, $23, 62240
    lw $23, 68($29)
    blez $18, branch_0x11E4
    add $20, $19, $18
    sub $20, $23, $20
    bgez $20, branch_0x11A8
branch_0x1188:
    mfc0 $20, DPC_STATUS
    andi $20, $20, DPC_STATUS_START_VALID
    bne $20, $0, branch_0x1188
branch_0x1194:
    mfc0 $23, $10
    lw $19, 64($29)
    beq $23, $19, branch_0x1194
    nop
    mtc0 $19, $8
branch_0x11A8:
    mfc0 $23, $10
    sub $20, $19, $23
    bgez $20, branch_0x11C4
    add $20, $19, $18
    sub $20, $20, $23
    bgez $20, branch_0x11A8
    nop
branch_0x11C4:
    add $23, $19, $18
    addi $18, $18, 65535
    li $20, 3296
    jal branch_0x1140
    li $17, 1
    jal branch_0x112C
    sw $23, 24($29)
    mtc0 $23, $9
branch_0x11E4:
    jr $21
    li $23, 3296
    andi $2, $2, 254
    lh $2, 118($2)
    jr $2
    lbu $1, 65535($27)
    lh $24, 190($0)
branch_0x1200:
    lh $31, 918($0)
branch_0x1204:
    lbu $1, 65533($27)
    lbu $2, 65534($27)
    lbu $3, 65535($27)
branch_0x1210:
    lhu $1, 796($1)
    lhu $2, 796($2)
    lhu $3, 796($3)
    jr $31
    addi $4, $1, 0
    jal branch_0x1200
    addi $24, $31, 0
    lbu $1, 65529($27)
    lbu $2, 65530($27)
    lbu $3, 65531($27)
    lh $31, 918($0)
    j branch_0x1210
    lh $24, 190($0)
    jal branch_0x1204
    lbu $7, 65532($27)
    lhu $7, 796($7)
    lh $8, 26($1)
    lh $10, 26($3)
    lh $9, 26($2)
    lh $11, 26($7)
    sub $6, $8, $10
    bgez $6, branch_0x1270
    sh $1, 3290($0)
    sub $6, $10, $8
branch_0x1270:
    sub $12, $9, $11
    bgez $12, branch_0x1280
    sh $3, 3292($0)
    sub $12, $11, $9
    branch_0x1280:
    sub $6, $6, $12
    blez $6, branch_0x1294
    sh $7, 3294($0)
    addi $3, $7, 0
    sh $2, 3290($0)
branch_0x1294:
    jal branch_0x19C8
    addi $24, $31, 0
    beq $31, $0, branch_0x109C
    lh $1, 3292($0)
    lh $2, 3294($0)
    lh $3, 3290($0)
    j branch_0x19C8
    lh $24, 190($0)
    sbv v31[6], 28($29)
    lw $19, 36($29)
    lw $3, 4064($0)
    li $20, 992
    sub $3, $3, $19
    bgez $3, branch_0x109C
    addi $19, $19, 65472
    jal branch_0x113c
    li $18, 63
    jal branch_0x112C
    li $3, 1120
    j branch_0x1644
    sw $19, 36($29)
    lbu $1, 65531($27)
    lhu $2, 65529($27)
    lh $5, 782($1)
    add $5, $5, $2
    j branch_0x109C
    sw $24, 0($5)
    sw $25, 16($29)
    sw $24, 20($29)
    lh $2, 6($29)
    andi $2, $2, 65533
    andi $3, $25, 1
    sll $3, $3, 1
    or $2, $2, $3
    j branch_0x109C
    sh $2, 6($29)
    j branch_0x1330
    addi $7, $29, 8
    addi $7, $29, 12
branch_0x1330:
    lw $3, 0($7)
    lbu $5, 65531($27)
    lbu $6, 65530($27)
    li $2, 1
    sllv $2, $2, $5
    addi $2, $2, 65535
    sllv $2, $2, $6
    nor $2, $2, $0
    and $2, $2, $3
    or $3, $2, $24
    sw $3, 0($7)
    lw $25, 8($29)
    j branch_0x13FC
    lw $24, 12($29)
    andi $25, $25, 1023
    ori $2, $0, 28784
branch_0x1370:
    lh $3, 1220($25)
    addi $25, $25, 40
    bne $25, $24, branch_0x1370
    and $2, $2, $3
    beq $2, $0, branch_0x109C
    lb $2, 0($29)
    addi $2, $2, 65532
    bltz $2, branch_0x10BC
    addi $3, $2, 920
    lw $26, 0($3)
    sb $2, 0($29)
    j branch_0x109C
    addi $28, $27, 0
    lw $2, 4($29)
    or $2, $2, $24
    j branch_0x109C
    sw $2, 4($29)
    lw $2, 4($29)
    nor $3, $24, $0
    and $2, $2, $3
    j branch_0x109C
    sw $2, 4($29)
    j branch_0x109C
    sh $24, 2($29)
    j branch_0x10AC
    sw $24, 65532($29)
    j branch_0x13FC
    lw $25, 65532($29)
    sra $2, $25, 24
    addi $2, $2, 3
    bltz $2, branch_0x13FC
    addi $2, $2, 24
    jal branch_0x110C
    add $19, $24, $0
    add $24, $19, $0
branch_0x13FC:
    sw $25, 0($23)
    sw $24, 4($23)
    jal branch_0x1168
    addi $23, $23, 8
    bgtz $2, branch_0x109C
    nop
    j branch_0x10AC
    andi $2, $2, 510
    lh $2, 196($2)
    jal branch_0x112C
    lbu $1, 65529($27)
    jr $2
    andi $6, $1, 15
    lh $8, 190($0)
    sh $8, 262($0)
    lbu $9, 65530($27)
    ldv v2[0], 0(r22)
    ldv v2[8], 16(r22)
    srl $9, $9, 2
    jal branch_0x16E8
    lhu $7, 796($1)
    llv v17[0], 20(r29)
    jal branch_0x1710
    llv v17[8], 20(r29)
branch_0x145C:
    vmudn v28, v12, v2[0h]
    llv v18[0], 8(r22)
    vmadh v28, v8, v2[0h]
    lw $15, 12($22)
    vmadn v28, v13, v2[1h]
    lw $16, 28($22)
    vmadh v28, v9, v2[1h]
    andi $1, $3, 2
    vmadn v28, v14, v2[2h]
    vmadh v28, v10, v2[2h]
    vmadn v28, v15, v31[1w]
    llv v18[8], 24(r22)
    vmadh v29, v11, v31[1w]
    bne $1, $0, branch_0x17B4
    addi $22, $22, 32
branch_0x1498:
    vmudm v18, v18, v17
branch_0x149C:
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
    beq $12, $0, branch_0x1590
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
branch_0x1590:
    slv v18[0], 20($7)
    sdv v6[0], 24($7)
    ssv v7[4], 30($7)
    ssv v27[6], 32($7)
    bltz $9, branch_0x15D4
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
    bgtz $9, branch_0x145C
branch_0x15D4:
    lh $8, 262($0)
    jr $8
    andi $8, $1, 1
    sbv v31[6], 28($29)
    bne $8, $0, branch_0x1654
    andi $7, $1, 2
    li $20, 992
    andi $8, $1, 4
    beq $8, $0, branch_0x1620
    lqv v26[0], 48(r22)
    lw $19, 36($29)
    lw $8, 76($29)
    li $17, 1
    addi $1, $19, 64
    beq $19, $8, branch_0x1620
    li $12, 63
    jal branch_0x1140
    sw $1, 36($29)
    jal branch_0x112C
branch_0x1620:
    lqv v28[0], 16(r22)
    beq $7, $0, branch_0x1660
    lqv v27[0], 32(r22)
    sqv v26[0], 48($20)
    lqv v29[0], 0(r22)
    sqv v28[0], 16($20)
branch_0x1638:
    li $3, 1120
    sqv v27[0], 32($20)
    sqv v29[0], 0($20)
branch_0x1644:
    li $1, 992
    li $2, 1056
    j branch_0x1684
    lh $31, 190($0)
branch_0x1654:
    lqv v26[0], 48(r22)
    j branch_0x1620
    li $20, 1056
branch_0x1660:
    la $3, 3552
    addu $1, $0, $22
    jal branch_0x1684
    addu $2, $0, $20
    sqv v6[0], 48($20)
    sqv v5[0], 16($20)
    lqv v27[0], 0(r3)
    j branch_0x1638
    lqv v29[0], 2016(r3)
branch_0x1684:
    addi $19, $3, 16
branch_0x1688:
    vmudh v5, v31, v31[0w]
    addi $18, $1, 8
branch_0x1690:
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
    bne $1, $18, branch_0x1690
    vmadn v6, v31, v31[0w]
    addi $2, $2, 65504
    addi $1, $1, 8
    sqv v5[0], 0($3)
    sqv v6[0], 32($3)
    bne $3, $19, branch_0x1688
    addi $3, $3, 16
    jr $31
    nop
branch_0x16E8:
    li $8, 896
    lqv v3[0], 80(r0)
    lsv v19[0], 2(r29)
    lh $3, 4($29)
    ldv v0[0], 0(r8)
    ldv v1[0], 8(r8)
    ldv v0[8], 0(r8)
    ldv v1[8], 8(r8)
    jr $31
    vmudh v0, v0, v3
branch_0x1710:
    li $8, 1120
    ldv v11[0], 24(r8)
    ldv v11[8], 24(r8)
    ldv v15[0], 56(r8)
    ldv v15[8], 56(r8)
branch_0x1724:
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
    j branch_0x109C
    sqv v0[0], 0($5)
    bgtz $1, branch_0x1790
    lb $2, 0($29)
    addi $4, $2, 65468
    bgtz $4, branch_0x109C
    addi $3, $2, 920
    addi $2, $2, 4
    add $26, $26, $27
    sub $26, $26, $28
    sw $26, 0($3)
    sb $2, 0($29)
branch_0x1790:
    jal branch_0x110C
    add $19, $24, $0
    add $26, $19, $0
    j branch_0x109C
    addi $28, $27, 0
    nop
    branch_0x17A8:
    ori $30, $0, 16
    beq $0, $0, branch_0x10F0
    lh $21, 256($0)
branch_0x17B4:
    ori $30, $0, 24
    beq $0, $0, branch_0x10F0
    lh $21, 160($0)
branch_0x17C0:
    ori $2, $0, 10240
    mtc0 $2, $4
branch_0x17C8:
    lqv v31[0], 48(r0)
    lqv v30[0], 64(r0)
    lw $4, 4036($0)
    andi $4, $4, 1
    bne $4, $0, branch_0x18B4
    nop
    lw $23, 40($1)
    lw $3, 44($1)
    sw $23, 64($29)
    sw $3, 68($29)
    mfc0 $4, DPC_STATUS
    andi $4, $4, 1
    bne $4, $0, wait_dpc_start_valid
    mfc0 $4, $9
    sub $23, $23, $4
    bgtz $23, wait_dpc_start_valid
    mfc0 $5, $10
    beq $5, $0, wait_dpc_start_valid
    nop
branch_0x1814:
    beq $5, $4, wait_dpc_start_valid
    nop
    j branch_0x1840
    move $3, $4
wait_dpc_start_valid:
    mfc0 $4, DPC_STATUS
    andi $4, $4, DPC_STATUS_START_VALID
    bne $4, $0, wait_dpc_start_valid
    li $4, 1
    mtc0 $4, DPC_STATUS
    mtc0 $3, DPC_START
    mtc0 $3, DPC_END
branch_0x1840:
    sw $3, 24($29)
    li $23, 3296
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
    jal branch_0x10EC
    li $30, 8
    jal branch_0x10c8
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
    nop
branch_0x18B4:
    jal branch_0x10EC
    li $30, 8
    lw $23, 3056($0)
    lw $28, 3044($0)
    lw $27, 3048($0)
    j branch_0x109C
    lw $26, 3052($0)
    .fill 176, 0
branch_0x1980:
    .fill 72, 0
branch_0x19C8:
    lh $11, 36($3)
    lh $8, 36($2)
    lh $9, 36($1)
    and $12, $11, $8
    or $11, $11, $8
    and $12, $12, $9
    andi $12, $12, 28784
    bne $12, $0, branch_0x1FA4
    or $11, $11, $9
    andi $11, $11, 17219
    bne $11, $0, branch_0x17A8
    llv v13[0], 24(r1)
    llv v14[0], 24(r2)
    llv v15[0], 24(r3)
    lw $13, 4($29)
    li $8, 3040
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
    vreadacc v28, 1w
    lh $11, 26($3)
    vreadacc v29, 0w
    sll $15, $13, 18
    mfc2 $17, v16[0]
    sh $1, 3040($0)
    sh $2, 3042($0)
    and $15, $17, $15
    bltz $15, branch_0x1FA0
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
    llv v15[0], 24(r3)
    llv v14[0], 24(r2)
    blez $12, branch_0x1AB8
    llv v13[0], 24(r1)
    vsubc v28, v31, v28
    vsub v29, v31, v29
branch_0x1AB8:
    beq $17, $0, branch_0x1FA4
    vsub v4, v15, v14
    sll $14, $13, 19
    vsub v10, v14, v13
    nor $14, $14, $0
    vsub v9, v15, v13
    or $14, $17, $14
    vmov v29[3], v29[0]
    bgez $14, branch_0x1FA0
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
    lsv v12[0], 24(r2)
    vmudl v6, v6, v21[0w]
    lsv v12[4], 24(r1)
    vmadm v5, v5, v21[0w]
    lsv v12[8], 24(r1)
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
branch_0x1BA0:
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
    blez $7, branch_0x1CE8
    vmudl v20, v20, v30[5w]
    lw $14, 0($15)
    vmadm v19, v19, v30[5w]
    lw $17, 65532($15)
    vmadn v20, v31, v31[0w]
    lw $18, 65528($15)
    llv v9[0], 20(r14)
    llv v9[8], 20(r17)
    llv v22[0], 20(r18)
    lsv v11[0], 34(r14)
    lsv v12[0], 32(r14)
    lsv v11[8], 34(r17)
    vmov v9[2], v30[0]
    lsv v12[8], 32(r17)
    vmov v9[6], v30[0]
    lsv v24[0], 34(r18)
    vmov v22[2], v30[0]
    lsv v25[0], 32(r18)
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
    llv v19[0], 16(r16)
    vabs v22, v22, v22
    llv v20[0], 24(r16)
    vabs v19, v19, v19
    vge v17, v9, v22
    vmrg v18, v10, v23
    vge v17, v17, v19
    vmrg v18, v18, v20
branch_0x1CE8:
    slv v17[0], 64($8)
    slv v18[0], 72($8)
    andi $7, $5, 7
    blez $7, branch_0x1F98
    vxor v18, v31, v31
    luv v25[0], 16(r3)
    vadd v16, v18, v30[5w]
    luv v15[0], 16(r1)
    vadd v24, v18, v30[5w]
    andi $7, $13, 512
    vadd v5, v18, v30[5w]
    bgtz $7, branch_0x1D28
    luv v23[0], 16(r2)
    luv v25[0], 16(r4)
    luv v15[0], 16(r4)
    luv v23[0], 16(r4)
branch_0x1D28:
    vmudm v25, v25, v31[7w]
    vmudm v15, v15, v31[7w]
    vmudm v23, v23, v31[7w]
    ldv v16[8], 24(r8)
    ldv v15[8], 16(r8)
    ldv v24[8], 40(r8)
    ldv v23[8], 32(r8)
    ldv v5[8], 56(r8)
    ldv v25[8], 48(r8)
    lsv v16[14], 30(r1)
    lsv v15[14], 28(r1)
    lsv v24[14], 30(r2)
    lsv v23[14], 28(r2)
    lsv v5[14], 30(r3)
    lsv v25[14], 28(r3)
    vsubc v12, v24, v16
    vsub v11, v23, v15
    vsubc v20, v16, v5
    vsub v19, v15, v25
    vsubc v10, v5, v16
    vsub v9, v25, v15
    vsubc v22, v16, v24
    vsub v21, v15, v23
    vmudn v6, v10, v4[3w]
    vmadh v6, v9, v4[3w]
    vmadn v6, v22, v4[5w]
    vmadh v6, v21, v4[5w]
    vreadacc v9, 0w
    vreadacc v10, 1w
    vmudn v6, v12, v4[4w]
    vmadh v6, v11, v4[4w]
    vmadn v6, v20, v4[2w]
    vmadh v6, v19, v4[2w]
    vreadacc v11, 0w
    vreadacc v12, 1w
    vmudl v6, v10, v26[3w]
    vmadm v6, v9, v26[3w]
    vmadn v10, v10, v27[3w]
    vmadh v9, v9, v27[3w]
    vmudl v6, v12, v26[3w]
    vmadm v6, v11, v26[3w]
    vmadn v12, v12, v27[3w]
    sdv v9[0], 8($23)
    vmadh v11, v11, v27[3w]
    sdv v10[0], 24($23)
    vmudn v6, v12, v31[1w]
    vmadh v6, v11, v31[1w]
    vmadl v6, v10, v1[5w]
    vmadm v6, v9, v1[5w]
    vmadn v14, v10, v0[5w]
    sdv v11[0], 40($23)
    vmadh v13, v9, v0[5w]
    sdv v12[0], 56($23)
    vmudl v28, v14, v2[1w]
    sdv v13[0], 32($23)
    vmadm v6, v13, v2[1w]
    sdv v14[0], 48($23)
    vmadn v28, v31, v31[0w]
    vsubc v18, v16, v28
    vsub v17, v15, v6
    andi $7, $5, 4
    blez $7, branch_0x1E30
    andi $7, $5, 2
    addi $23, $23, 64
    sdv v17[0], 960($23)
    sdv v18[0], 976($23)
branch_0x1E30:
    blez $7, branch_0x1F2C
    andi $7, $5, 1
    li $16, 2048
    mtc2 $16, v19
    vabs v24, v9, v9
    ldv v20[8], 64(r8)
    vabs v25, v11, v11
    ldv v21[8], 72(r8)
    vmudm v24, v24, v19[0w]
    vmadn v26, v31, v31[0w]
    vmudm v25, v25, v19[0w]
    vmadn v27, v31, v31[0w]
    vmudl v21, v21, v19[0w]
    vmadm v20, v20, v19[0w]
    vmadn v21, v31, v31[0w]
    vmudn v26, v26, v31[2w]
    vmadh v24, v24, v31[2w]
    vmadn v26, v31, v31[0w]
    vmadn v23, v27, v31[1w]
    vmadh v22, v25, v31[1w]
    vmadn v6, v21, v31[1w]
    vmadh v5, v20, v31[1w]
    vsubc v23, v6, v6[5w]
    vge v5, v5, v5[5w]
    vmrg v6, v6, v6[5w]
    vsubc v23, v6, v6[6w]
    vge v5, v5, v5[6w]
    vmrg v6, v6, v6[6w]
    vmudl v6, v6, v30[3w]
    vmadm v5, v5, v30[3w]
    vmadn v6, v31, v31[0w]
    vrcph v23[0], v5[4]
    vrcpl v6[0], v6[4]
    vrcph v5[0], v31[0]
    vmudn v6, v6, v31[2w]
    vmadh v5, v5, v31[2w]
    vlt v5, v5, v31[1w]
    vmrg v6, v6, v31[0w]
    vmudl v20, v18, v6[0w]
    vmadm v20, v17, v6[0w]
    vmadn v20, v18, v5[0w]
    vmadh v19, v17, v5[0w]
    vmudl v22, v10, v6[0w]
    vmadm v22, v9, v6[0w]
    vmadn v22, v10, v5[0w]
    sdv v19[8], 0($23)
    vmadh v21, v9, v5[0w]
    sdv v20[8], 16($23)
    vmudl v24, v12, v6[0w]
    vmadm v24, v11, v6[0w]
    vmadn v24, v12, v5[0w]
    sdv v21[8], 8($23)
    vmadh v23, v11, v5[0w]
    sdv v22[8], 24($23)
    vmudl v26, v14, v6[0w]
    vmadm v26, v13, v6[0w]
    vmadn v26, v14, v5[0w]
    sdv v23[8], 40($23)
    vmadh v25, v13, v5[0w]
    sdv v24[8], 56($23)
    addi $23, $23, 64
    sdv v25[8], 992($23)
    sdv v26[8], 1008($23)
branch_0x1F2C:
    blez $7, branch_0x1F98
    vmudn v14, v14, v30[4w]
    vmadh v13, v13, v30[4w]
    vmadn v14, v31, v31[0w]
    vmudn v16, v16, v30[4w]
    vmadh v15, v15, v30[4w]
    vmadn v16, v31, v31[0w]
branch_0x1F48:
    ssv v13[14], 8($23)
    vmudn v10, v10, v30[4w]
    ssv v14[14], 10($23)
    vmadh v9, v9, v30[4w]
    vmadn v10, v31, v31[0w]
    vmudn v12, v12, v30[4w]
    vmadh v11, v11, v30[4w]
    vmadn v12, v31, v31[0w]
    ssv v9[14], 4($23)
    vmudl v28, v14, v2[1w]
    ssv v10[14], 6($23)
    vmadm v6, v13, v2[1w]
    ssv v11[14], 12($23)
    vmadn v28, v31, v31[0w]
    ssv v12[14], 14($23)
    vsubc v18, v16, v28
    vsub v17, v15, v6
    addi $23, $23, 16
    ssv v17[14], 240($23)
    ssv v18[14], 242($23)
branch_0x1F98:
    jal branch_0x1168
    addi $31, $24, 0
branch_0x1FA0:
    li $31, 0
branch_0x1FA4:
    jr $24
    nop
    nop
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
    nop
    jal branch_0x112C
    li $27, 2464
    lw $25, 0($27)
    lw $24, 4($27)
    srl $1, $25, 29
    andi $1, $1, 6
    addi $27, $27, 8
    bgtz $1, branch_0x2040
    andi $18, $25, 1023
    li $22, 2784
    jal branch_0x110C
    add $19, $24, $0
    beq $0, $0, branch_0x2054
    sh $31, 344($0)
branch_0x2040:
    nop
    nop
    ori $30, $0, 24
    beq $0, $0, branch_0x1980
    lh $21, 160($0)
branch_0x2054:
    sh $3, 3136($0)
    sh $2, 3138($0)
    sh $1, 3140($0)
    sh $0, 3142($0)
    ori $7, $0, 3512
    ori $30, $0, 3136
    ori $6, $0, 12
    or $5, $30, $30
    xori $30, $30, 20
branch_0x2078:
    beq $6, $0, branch_0x2224
    lh $11, 166($6)
    addi $6, $6, 65534
    move $17, $0
    or $18, $0, $0
    move $2, $5
    j branch_0x1814
    addi $14, $30, 2
branch_0x2098:
    and $8, $8, $11
    beq $8, $18, branch_0x20D4
    addi $2, $2, 2
    or $20, $10, $0
    sh $10, 0($14)
    addi $14, $14, 2
branch_0x20B0:
    lh $10, 0($2)
    bne $10, $0, branch_0x2098
    lh $8, 36($10)
    addi $8, $17, 65534
    bgtz $8, branch_0x20B0
    move $2, $5
    beq $8, $0, branch_0x2078
    nop
    jr $24
branch_0x20D4:
    xor $18, $18, $11
    lh $8, 246($17)
    addi $17, $17, 2
    jr $8
    lh $8, 258($0)
    mtc2 $10, v13
    or $10, $20, $0
    mfc2 $20, v13[0]
    move $14, $30
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
    bgez $8, branch_0x2174
    vmadh v7, v7, v31[2w]
    vmudn v3, v3, v31[3w]
    vmadh v7, v7, v31[3w]
branch_0x2174:
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
    jal branch_0x16E8
    lw $15, 0($7)
    mfc2 $10, v13[0]
    j branch_0x149C
    ori $9, $0, 1
branch_0x2224:
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
    bne $1, $0, branch_0x2284
    sh $8, 262($0)
    jalr $30, $31
    ori $30, $0, 16
    beq $0, $0, branch_0x1BA0
    lh $21, 256($0)
    lw $1, 300($0)
    sw $15, 0($7)
    sw $16, 4($7)
    bltz $1, branch_0x22FC
    lpv v4[0], 0(r7)
    luv v7[0], 464(r1)
    vclr v27
branch_0x2280:
    vge v7, v7, v31[0w]
branch_0x2284:
    lpv v5[0], 448(r1)
    vadd v27, v27, v7
    luv v7[0], 432(r1)
    vor v20, v6, v31[0w]
    vmulf v6, v4, v5
    vadd v3, v6, v6[1q]
    vadd v6, v3, v6[2h]
    vmulf v7, v7, v6[0h]
    bgtz $1, branch_0x2280
    addi $1, $1, 65504
    suv v27[0], 0($7)
    andi $8, $3, 4
    sb $15, 3($7)
    sb $16, 7($7)
    lw $15, 0($7)
    beq $8, $0, branch_0x1F48
    lw $16, 4($7)
    andi $8, $3, 8
    lpv v7[0], 144(r29)
    ldv v6[0], 160(r0)
    vmadn v20, v7, v20[0h]
    beq $8, $0, branch_0x22F4
    vmadm v18, v31, v31[0w]
    vmulf v7, v18, v18
    vmulf v7, v7, v18
    vmulf v20, v7, v6[1w]
    vmacf v20, v7, v6[3w]
    vmacf v18, v18, v6[2w]
branch_0x22F4:
    j branch_0x1498
    vadd v18, v18, v31[4w]
branch_0x22FC:
    andi $1, $1, 4095
    sw $1, 300($0)
    jal branch_0x1724
    li $8, 992
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
branch_0x2348:
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
    bgtz $1, branch_0x2348
    addi $1, $1, 65504
    j branch_0x1710
    lh $31, 160($0)
    nop
    j branch_0x17C8
    nop
    nop
    jal branch_0x112C
    ori $2, $0, 16384
    mtc0 $2, $4
    break
    nop
    ori $2, $0, 4096
    sw $28, 3044($0)
    sw $27, 3048($0)
    sw $26, 3052($0)
    sw $23, 3056($0)
    lw $19, 264($0)
    move $20, $0
    ori $18, $0, 3071
    jal branch_0x1140
    ori $17, $0, 1
    jal branch_0x112C
    nop
    j branch_0x10BC
    mtc0 $2, $4
    nop
    nop
    la $0, 48879
    nop
    nop
    nop

.close // CODE_FILE
