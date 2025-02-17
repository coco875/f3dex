.rsp

.include "rsp/rsp_defs.inc"
.include "rsp/gbi.inc"
.include "rsp/macros.inc"

// This file assumes DATA_FILE and CODE_FILE are set on the command line

.if version() < 110
    .error "armips 0.11 or newer is required"
.endif

// RSP DMEM
.create DATA_FILE, 0x0000
overlayInfo0:
    /* 0x00 - 0x08 */
    OverlayEntry orga(Overlay0Address), orga(Overlay0End), Overlay0Address
overlayInfo1:
    /* 0x08 - 0x10 */
    OverlayEntry orga(Overlay1Address), orga(Overlay1End), Overlay1Address
overlayInfo2:
    /* 0x10 - 0x18 */
    OverlayEntry orga(Overlay2Address), orga(Overlay2End), Overlay2Address
overlayInfo3:
    /* 0x18 - 0x20 */
    OverlayEntry orga(Overlay3Address), orga(Overlay3End), Overlay3Address
overlayInfo4:
    /* 0x20 - 0x28 */
    OverlayEntry orga(Overlay4Address), orga(Overlay4End), Overlay4Address
/* 0x28 */ .dw 0x0ffaf006
/* 0x2c */ .dw 0x7fff0000
v31Value:
/* 0x30 */ .dw 0x00000001
/* 0x34 */ .dw 0x0002ffff
/* 0x38 */ .dw 0x40000004
/* 0x3c */ .dw 0x06330200
v30Value:
/* 0x40 */ .dw 0x7ffffff8
/* 0x44 */ .dw 0x00080040
/* 0x48 */ .dw 0x00208000
/* 0x4c */ .dw 0x01cccccc
/* 0x50 */ .dw 0x0001ffff
/* 0x54 */ .dw 0x00010001
/* 0x58 */ .dw 0x0001ffff
/* 0x5c */ .dw 0x00010001
/* 0x60 */ .dw 0x00020002
/* 0x64 */ .dw 0x00020002
/* 0x68 */ .dw 0x00020002
/* 0x6c */ .dw 0x00020002
/* 0x70 */ .dw 0x00010000
/* 0x74 */ .dw 0x00000001
/* 0x78 */ .dw 0x00000001
/* 0x7c */ .dw 0x00000001
/* 0x80 */ .dw 0x00010000
/* 0x84 */ .dw 0x0000ffff
/* 0x88 */ .dw 0x00000001
/* 0x8c */ .dw 0x0000ffff
.fill 4, 0
/* 0x94 */ .dw 0x0001ffff
.fill 4, 0
/* 0x9c */ .dw 0x00010001
D_0X00AO:
/* 0xa0 */ jumpTableEntry .L040017B4
/* 0xa2 */ .dh 0x7fff
/* 0xa4 */ .dw 0x571d3a0c
/* 0xa8 */ .dw 0x00010002
/* 0xac */ .dw 0x01000200
/* 0xb0 */ .dw 0x40000040
/* 0xb4 */ .dh 0x0000
D_0x00B6:
/* 0xb6 */ jumpTableEntry .L040017B4-4
lower24Mask:
/* 0xb8 */ .dw 0x00ffffff
operationJumpTable:
/* 0xbc */ jumpTableEntry dispatch_dma        // 0x00
run_next_DL_command_entry:
/* 0xbe */ jumpTableEntry run_next_DL_command // 0x01
/* 0xc0 */ jumpTableEntry dispatch_imm        // 0x02
/* 0xc2 */ jumpTableEntry dispatch_rdp        // 0x03
dmaJumpTable:
/* 0xc4 */ jumpTableEntry run_next_DL_command // 0x00
/* 0xc6 */ jumpTableEntry dma_MTX
/* 0xc8 */ jumpTableEntry run_next_DL_command
/* 0xca */ .dh 0x1758
/* 0xcc */ .dh 0x1430
/* 0xce */ jumpTableEntry run_next_DL_command
/* 0xd0 */ .dh 0x1768
/* 0xd2 */ jumpTableEntry run_next_DL_command
/* 0xd4 */ jumpTableEntry run_next_DL_command
/* 0xd6 */ jumpTableEntry run_next_DL_command
/* 0xd8 */ .dh 0x1224
/* 0xda */ .dh 0x13d8
/* 0xdc */ .dh 0x13d0
/* 0xde */ .dh 0x13c8
/* 0xe0 */ .dh 0x1244
/* 0xe2 */ .dh 0x13b4
/* 0xe4 */ .dh 0x13a4
/* 0xe6 */ .dh 0x1384
/* 0xe8 */ .dh 0x132c
/* 0xea */ .dh 0x1324
/* 0xec */ .dh 0x1300
/* 0xee */ .dh 0x12e8
/* 0xf0 */ .dh 0x12b4
/* 0xf2 */ .dh 0x1368
/* 0xf4 */ .dh 0x11fc
/* 0xf6 */ .dh 0x17fc
/* 0xf8 */ .dh 0x1800
/* 0xfa */ .dh 0x1858
/* 0xfc */ .dh 0x186c
/* 0xfe */ .dh 0x19a8
D_0x0100:
/* 0x100 */ jumpTableEntry .L040017C8-4
/* 0X102 */ .dh 0x17e0
load_wait_for_dma_and_run_next_command:
/* 0x104 */ jumpTableEntry wait_for_dma_and_run_next_command
/* 0x106 */ .dh 0x0000
.fill 8, 0
/* 0x110 */ .dw 0x0000ffff
.fill 4, 0
/* 0x118 */ .dw 0xef080cff
.fill 16, 0
/* 0x12c */ .dw 0x80000040
.fill 8, 0
/* 0x138 */ .dw 0x40004000
.fill 36, 0
/* 0x160 */
segmentTable:
.fill 0x40, 0
/* 0x1a0 */ .dw 0x80000000
/* 0x1a4 */ .dw 0x80000000
.fill 8, 0
/* 0x1b0 */ .dw 0x00800000
/* 0x1b4 */ .dw 0x00800000
/* 0x1b8 */ .dw 0x7f000000
.fill 28, 0
/* 0x1d8 */ .dw 0x007f0000
.fill 44, 0
/* 0x208 */ .dw 0xe0011fff
/* 0x20c */ .dw 0x00040000
/* 0x210 */ .dw 0xff000000
/* 0x214 */ .dw 0xff000000
.fill 152, 0
.ascii ID_STR
.align 
/* 0x2f0 */ .dw 0x038001b0
/* 0x2f4 */ .dw 0x01d001f0
/* 0x2f8 */ .dw 0x02100230
/* 0x2fc */ .dw 0x02500270
/* 0x300 */ .dw 0x029002b0
/* 0x304 */ .dw 0x02d00138
/* 0x308 */ .dw 0x04700480
/* 0x30c */ .dw 0x04900460
/* 0x310 */ .dw 0x012c0070
/* 0x314 */ .dw 0x01600390
/* 0x318 */ .dw 0x01f004a0
/* 0x31c */ .dw 0x04a004c8
/* 0x320 */ .dw 0x04f00518
/* 0x324 */ .dw 0x05400568
/* 0x328 */ .dw 0x059005b8
/* 0x32c */ .dw 0x05e00608
/* 0x330 */ .dw 0x06300658
/* 0x334 */ .dw 0x068006a8
/* 0x338 */ .dw 0x06d006f8
/* 0x33c */ .dw 0x07200748
/* 0x340 */ .dw 0x07700798
/* 0x344 */ .dw 0x07c007e8
/* 0x348 */ .dw 0x08100838
/* 0x34c */ .dw 0x08600888
/* 0x350 */ .dw 0x08b008d8
/* 0x354 */ .dw 0x09000928
/* 0x358 */ .dw 0x09500978
.fill 4, 0
/* 0x360 */ .dw 0x04040004
/* 0x364 */ .dw 0x02020002
/* 0x368 */ .dw 0x02040000
/* 0x36c */ .dw 0x04020000
/* 0x370 */ .dw 0x02020400
/* 0x374 */ .dw 0x04000000
/* 0x378 */ .dw 0x01000101
.fill 20, 0
/* 0x390 */ .dw 0x01000000
/* 0x394 */ .dw 0x00ff19c8
.fill 72,0
// 0x3e0: Modelview matrix top of stack (0x40 bytes)
mvMatrix:
.fill 0x40, 0

// 0x420 Projection Matrix top of stack (0x40 bytes)
pMatrix:
.fill 0x40, 0

// 0x460: MP matrix (Modelview * Projection)
mpMatrix:
.fill 0x40, 0
.fill 864, 0
.close // DATA_FILE

// he continue after the overlay data
inputBuffer equ 0x9A0
inputBufferLen equ 0x13F

// Must keep values during tri drawing.
// They are also used throughout the codebase, but can be overwritten once their
// use has been fulfilled for the specific command.
cmd_w1_dram equ $24 // Command word 1, which is also DMA DRAM addr; almost global, occasionally used locally
cmd_w0      equ $25 // Command word 0; almost global, occasionally used locally

// Arguments to mtx_multiply
input_mtx_1 equ $1
input_mtx_0 equ $2
output_mtx  equ $3

// Arguments to dma_read_write
dmaLen   equ $18
dmaLoad  equ $19
dmemAddr equ $20

// Arguments to load_overlay_and_enter
ovlTableEntry equ $30
postOvlRA     equ $12

inputBufferPos equ $27

.create CODE_FILE, 0x4001080
// $11: very common local
// $18: dmaLen
// $19: dmaLoad
// $20: dmemAddr
// $24: cmd_w1_dram, local
// $25: cmd_w0
// $27: inputBufferPos
// $30: ovlTableEntry
Overlay0Address:
/* 000000 04001080 090005F0 */  j           start
/* 000004 04001084 201D0110 */   li         $29, 0x110
// it's where the L04001064 continue
/* 000008 04001088 0D00044F */  jal         dma_read
/* 00000C 0400108C 0016A020 */   add        dmemAddr, $zero, $22

// need to be already shifted of one bit for halfword
dispatch_task: 
/* 000010 04001090 842200BC */  lh          $2, operationJumpTable($1)
/* 000014 04001094 00400008 */  jr          $2
/* 000018 04001098 001915C2 */   srl        $2, cmd_w0, 23             // select first 9 bits        
run_next_DL_command:
/* 00001C 0400109C 40022000 */  mfc0        $2, SP_STATUS
/* 000020 040010A0 30420080 */  andi        $2, $2, SP_STATUS_SIG0
/* 000024 040010A4 14400006 */  bnez        $2, .L040010C0
/* 000028 040010A8 84150026 */   lh         $21, 0x26($zero)
.L040010AC:
/* 00002C 040010AC 179BFFED */  bne         $28, $27, .L04001064
/* 000030 040010B0 8F790000 */   lw         cmd_w0, 0x0(inputBufferPos)
/* 000034 040010B4 09000432 */  j           load_display_list_dma
/* 000038 040010B8 841F0104 */   lh         $ra, load_wait_for_dma_and_run_next_command
.L040010BC:
/* 00003C 040010BC 841500B6 */  lh          $21, D_0x00B6
.L040010C0:
/* 000040 040010C0 0900043C */  j           load_overlay
/* 000044 040010C4 341E0020 */   ori        ovlTableEntry, $zero, overlayInfo4
load_display_list_dma:
/* 000048 040010C8 201C0AE0 */  li          $28, 0xAE0
/* 00004C 040010CC 001FA820 */  add         $21, $zero, $ra
/* 000050 040010D0 201409A0 */  li          dmemAddr, inputBuffer
/* 000054 040010D4 001A9820 */  add         dmaLoad, $zero, $26
/* 000058 040010D8 235A0140 */  addi        $26, $26, 0x140
/* 00005C 040010DC 0D00044F */  jal         dma_read
/* 000060 040010E0 2012013F */   li         dmaLen, inputBufferLen
/* 000064 040010E4 02A00008 */  jr          $21
/* 000068 040010E8 201B09A0 */   li         inputBufferPos, inputBuffer
load_overlay_fcn:
/* 00006C 040010EC 001FA820 */  add         $21, $zero, $ra
load_overlay:
/* 000070 040010F0 8FD30000 */  lw          dmaLoad, overlay_load(ovlTableEntry)
/* 000074 040010F4 87D20004 */  lh          dmaLen, overlay_len(ovlTableEntry)
/* 000078 040010F8 0D00044F */  jal         dma_read
/* 00007C 040010FC 87D40006 */   lh         dmemAddr, overlay_imem(ovlTableEntry)
/* 000080 04001100 0D00044B */  jal         while_wait_dma_busy
/* 000084 04001104 00000000 */   nop
/* 000088 04001108 02A00008 */  jr          $21
segmented_to_physical:
/* 00008C 0400110C 8C0B00B8 */   lw         $11, lower24Mask
/* 000090 04001110 00136582 */  srl         $12, dmaLoad, 22       // upper 10 bits
/* 000094 04001114 318C003C */  andi        $12, $12, 0x3C         // keep only 6 bits
/* 000098 04001118 026B9824 */  and         dmaLoad, dmaLoad, $11  // keep only lower 24 bits
/* 00009C 0400111C 000C6820 */  add         $13, $zero, $12        // move to $13 useless can be removed
/* 0000A0 04001120 8DAC0160 */  lw          $12, segmentTable($13)
/* 0000A4 04001124 03E00008 */  jr          $ra
/* 0000A8 04001128 026C9820 */   add        dmaLoad, dmaLoad, $12
while_wait_dma_busy:
/* 0000AC 0400112C 400B3000 */  mfc0        $11, SP_DMA_BUSY
/* 0000B0 04001130 1560FFFE */  bnez        $11, while_wait_dma_busy
/* 0000B4 04001134 00000000 */   nop
/* 0000B8 04001138 03E00008 */  jr          $ra
dma_read:
/* 0000BC 0400113C 00008820 */   add        $17, $zero, $zero
dma_read_write:
/* 0000C0 04001140 400B2800 */  mfc0        $11, SP_DMA_FULL
/* 0000C4 04001144 1560FFFE */  bnez        $11, dma_read_write
/* 0000C8 04001148 00000000 */   nop
/* 0000CC 0400114C 40940000 */  mtc0        dmemAddr, SP_MEM_ADDR
/* 0000D0 04001150 1E200003 */  bgtz        $17, dma_write
/* 0000D4 04001154 40930800 */   mtc0       $19, SP_DRAM_ADDR
/* 0000D8 04001158 03E00008 */  jr          $ra
/* 0000DC 0400115C 40921000 */   mtc0       dmaLen, SP_RD_LEN
dma_write:
/* 0000E0 04001160 03E00008 */  jr          $ra
/* 0000E4 04001164 40921800 */   mtc0       dmaLen, SP_WR_LEN
func_04001168:
/* 0000E8 04001168 001FA820 */  add         $21, $zero, $ra
/* 0000EC 0400116C 8FB30018 */  lw          $19, 0x18($29)
/* 0000F0 04001170 22F2F320 */  addi        $18, $23, -0xCE0
/* 0000F4 04001174 8FB70044 */  lw          $23, 0x44($29)
/* 0000F8 04001178 1A40001A */  blez        $18, .L040011E4
/* 0000FC 0400117C 0272A020 */   add        $20, $19, $18
/* 000100 04001180 02F4A022 */  sub         $20, $23, $20
/* 000104 04001184 06810008 */  bgez        $20, .L040011A8
.L04001188:
/* 000108 04001188 40145800 */   mfc0       $20, DPC_STATUS
/* 00010C 0400118C 32940400 */  andi        $20, $20, DPC_STATUS_START_VALID
/* 000110 04001190 1680FFFD */  bnez        $20, .L04001188
.L04001194:
/* 000114 04001194 40175000 */   mfc0       $23, DPC_CURRENT
/* 000118 04001198 8FB30040 */  lw          $19, 0x40($29)
/* 00011C 0400119C 12F3FFFD */  beq         $23, $19, .L04001194
/* 000120 040011A0 00000000 */   nop
/* 000124 040011A4 40934000 */  mtc0        $19, DPC_START
.L040011A8:
/* 000128 040011A8 40175000 */  mfc0        $23, DPC_CURRENT
/* 00012C 040011AC 0277A022 */  sub         $20, $19, $23
/* 000130 040011B0 06810004 */  bgez        $20, .L040011C4
/* 000134 040011B4 0272A020 */   add        $20, $19, $18
/* 000138 040011B8 0297A022 */  sub         $20, $20, $23
/* 00013C 040011BC 0681FFFA */  bgez        $20, .L040011A8
/* 000140 040011C0 00000000 */   nop
.L040011C4:
/* 000144 040011C4 0272B820 */  add         $23, $19, $18
/* 000148 040011C8 2252FFFF */  addi        dmaLen, $18, -0x1
/* 00014C 040011CC 20140CE0 */  li          dmemAddr, 0xCE0
/* 000150 040011D0 0D000450 */  jal         dma_read_write
/* 000154 040011D4 20110001 */   li         $17, 0x1
/* 000158 040011D8 0D00044B */  jal         while_wait_dma_busy
/* 00015C 040011DC AFB70018 */   sw         $23, 0x18($29)
/* 000160 040011E0 40974800 */  mtc0        $23, DPC_END
.L040011E4:
/* 000164 040011E4 02A00008 */  jr          $21
/* 000168 040011E8 20170CE0 */   li         $23, 0xCE0
dispatch_imm:
/* 00016C 040011EC 304200FE */  andi        $2, $2, 0xFE
/* 000170 040011F0 84420076 */  lh          $2, 0x76($2)
/* 000174 040011F4 00400008 */  jr          $2
/* 000178 040011F8 9361FFFF */   lbu        $1, -0x1($27)
/* 00017C 040011FC 841800BE */  lh          $24, run_next_DL_command_entry
func_04001200:
/* 000180 04001200 841F0396 */  lh          $ra, 0x396($zero)
func_04001204:
/* 000184 04001204 9361FFFD */  lbu         $1, -0x3($27)
/* 000188 04001208 9362FFFE */  lbu         $2, -0x2($27)
/* 00018C 0400120C 9363FFFF */  lbu         $3, -0x1($27)
.L04001210:
/* 000190 04001210 9421031C */  lhu         $1, 0x31C($1)
/* 000194 04001214 9442031C */  lhu         $2, 0x31C($2)
/* 000198 04001218 9463031C */  lhu         $3, 0x31C($3)
/* 00019C 0400121C 03E00008 */  jr          $ra
/* 0001A0 04001220 20240000 */   addi       $4, $1, 0x0
/* 0001A4 04001224 0D000480 */  jal         func_04001200
/* 0001A8 04001228 23F80000 */   addi       $24, $ra, 0x0
/* 0001AC 0400122C 9361FFF9 */  lbu         $1, -0x7($27)
/* 0001B0 04001230 9362FFFA */  lbu         $2, -0x6($27)
/* 0001B4 04001234 9363FFFB */  lbu         $3, -0x5($27)
/* 0001B8 04001238 841F0396 */  lh          $ra, 0x396($zero)
/* 0001BC 0400123C 09000484 */  j           .L04001210
/* 0001C0 04001240 841800BE */   lh         $24, run_next_DL_command_entry
/* 0001C4 04001244 0D000481 */  jal         func_04001204
/* 0001C8 04001248 9367FFFC */   lbu        $7, -0x4($27)
/* 0001CC 0400124C 94E7031C */  lhu         $7, 0x31C($7)
/* 0001D0 04001250 8428001A */  lh          $8, 0x1A($1)
/* 0001D4 04001254 846A001A */  lh          $10, 0x1A($3)
/* 0001D8 04001258 8449001A */  lh          $9, 0x1A($2)
/* 0001DC 0400125C 84EB001A */  lh          $11, 0x1A($7)
/* 0001E0 04001260 010A3022 */  sub         $6, $8, $10
/* 0001E4 04001264 04C10002 */  bgez        $6, .L04001270
/* 0001E8 04001268 A4010CDA */   sh         $1, 0xCDA($zero)
/* 0001EC 0400126C 01483022 */  sub         $6, $10, $8
.L04001270:
/* 0001F0 04001270 012B6022 */  sub         $12, $9, $11
/* 0001F4 04001274 05810002 */  bgez        $12, .L04001280
/* 0001F8 04001278 A4030CDC */   sh         $3, 0xCDC($zero)
/* 0001FC 0400127C 01696022 */  sub         $12, $11, $9
.L04001280:
/* 000200 04001280 00CC3022 */  sub         $6, $6, $12
/* 000204 04001284 18C00003 */  blez        $6, .L04001294
/* 000208 04001288 A4070CDE */   sh         $7, 0xCDE($zero)
/* 00020C 0400128C 20E30000 */  addi        $3, $7, 0x0
/* 000210 04001290 A4020CDA */  sh          $2, 0xCDA($zero)
.L04001294:
/* 000214 04001294 0D000672 */  jal         func_040019C8
/* 000218 04001298 23F80000 */   addi       $24, $ra, 0x0
/* 00021C 0400129C 13E0FF7F */  beqz        $ra, run_next_DL_command
/* 000220 040012A0 84010CDC */   lh         $1, 0xCDC($zero)
/* 000224 040012A4 84020CDE */  lh          $2, 0xCDE($zero)
/* 000228 040012A8 84030CDA */  lh          $3, 0xCDA($zero)
/* 00022C 040012AC 09000672 */  j           func_040019C8
/* 000230 040012B0 841800BE */   lh         $24, run_next_DL_command_entry
/* 000234 040012B4 EBBF031C */  sbv         $v31[6], 0x1C($29)
/* 000238 040012B8 8FB30024 */  lw          $19, 0x24($29)
/* 00023C 040012BC 8C030FE0 */  lw          $3, 0xFE0($zero)
/* 000240 040012C0 201403E0 */  li          $20, 0x3E0
/* 000244 040012C4 00731822 */  sub         $3, $3, $19
/* 000248 040012C8 0461FF74 */  bgez        $3, run_next_DL_command
/* 00024C 040012CC 2273FFC0 */   addi       dmaLoad, $19, -0x40
/* 000250 040012D0 0D00044F */  jal         dma_read
/* 000254 040012D4 2012003F */   li         dmaLen, 0x3F
/* 000258 040012D8 0D00044B */  jal         while_wait_dma_busy
/* 00025C 040012DC 20030460 */   li         $3, 0x460
/* 000260 040012E0 09000591 */  j           .L04001644
/* 000264 040012E4 AFB30024 */   sw         $19, 0x24($29)
/* 000268 040012E8 9361FFFB */  lbu         $1, -0x5($27)
/* 00026C 040012EC 9762FFF9 */  lhu         $2, -0x7($27)
/* 000270 040012F0 8425030E */  lh          $5, 0x30E($1)
/* 000274 040012F4 00A22820 */  add         $5, $5, $2
/* 000278 040012F8 09000427 */  j           run_next_DL_command
/* 00027C 040012FC ACB80000 */   sw         $24, 0x0($5)
/* 000280 04001300 AFB90010 */  sw          $25, 0x10($29)
/* 000284 04001304 AFB80014 */  sw          $24, 0x14($29)
/* 000288 04001308 87A20006 */  lh          $2, 0x6($29)
/* 00028C 0400130C 3042FFFD */  andi        $2, $2, 0xFFFD
/* 000290 04001310 33230001 */  andi        $3, $25, 0x1
/* 000294 04001314 00031840 */  sll         $3, $3, 1
/* 000298 04001318 00431025 */  or          $2, $2, $3
/* 00029C 0400131C 09000427 */  j           run_next_DL_command
/* 0002A0 04001320 A7A20006 */   sh         $2, 0x6($29)
/* 0002A4 04001324 090004CC */  j           .L04001330
/* 0002A8 04001328 23A70008 */   addi       $7, $29, 0x8
/* 0002AC 0400132C 23A7000C */  addi        $7, $29, 0xC
.L04001330:
/* 0002B0 04001330 8CE30000 */  lw          $3, 0x0($7)
/* 0002B4 04001334 9365FFFB */  lbu         $5, -0x5($27)
/* 0002B8 04001338 9366FFFA */  lbu         $6, -0x6($27)
/* 0002BC 0400133C 20020001 */  li          $2, 0x1
/* 0002C0 04001340 00A21004 */  sllv        $2, $2, $5
/* 0002C4 04001344 2042FFFF */  addi        $2, $2, -0x1
/* 0002C8 04001348 00C21004 */  sllv        $2, $2, $6
/* 0002CC 0400134C 00401027 */  not         $2, $2
/* 0002D0 04001350 00431024 */  and         $2, $2, $3
/* 0002D4 04001354 00581825 */  or          $3, $2, $24
/* 0002D8 04001358 ACE30000 */  sw          $3, 0x0($7)
/* 0002DC 0400135C 8FB90008 */  lw          $25, 0x8($29)
/* 0002E0 04001360 090004FF */  j           .L040013FC
/* 0002E4 04001364 8FB8000C */   lw         $24, 0xC($29)
/* 0002E8 04001368 333903FF */  andi        $25, $25, 0x3FF
/* 0002EC 0400136C 34027070 */  ori         $2, $zero, 0x7070
.L04001370:
/* 0002F0 04001370 872304C4 */  lh          $3, 0x4C4($25)
/* 0002F4 04001374 23390028 */  addi        $25, $25, 0x28
/* 0002F8 04001378 1738FFFD */  bne         $25, $24, .L04001370
/* 0002FC 0400137C 00431024 */   and        $2, $2, $3
/* 000300 04001380 1040FF46 */  beqz        $2, run_next_DL_command
/* 000304 04001384 83A20000 */   lb         $2, 0x0($29)
/* 000308 04001388 2042FFFC */  addi        $2, $2, -0x4
/* 00030C 0400138C 0440FF4B */  bltz        $2, .L040010BC
/* 000310 04001390 20430398 */   addi       $3, $2, 0x398
/* 000314 04001394 8C7A0000 */  lw          $26, 0x0($3)
/* 000318 04001398 A3A20000 */  sb          $2, 0x0($29)
/* 00031C 0400139C 09000427 */  j           run_next_DL_command
/* 000320 040013A0 237C0000 */   addi       $28, $27, 0x0
/* 000324 040013A4 8FA20004 */  lw          $2, 0x4($29)
/* 000328 040013A8 00581025 */  or          $2, $2, $24
/* 00032C 040013AC 09000427 */  j           run_next_DL_command
/* 000330 040013B0 AFA20004 */   sw         $2, 0x4($29)
/* 000334 040013B4 8FA20004 */  lw          $2, 0x4($29)
/* 000338 040013B8 03001827 */  not         $3, $24
/* 00033C 040013BC 00431024 */  and         $2, $2, $3
/* 000340 040013C0 09000427 */  j           run_next_DL_command
/* 000344 040013C4 AFA20004 */   sw         $2, 0x4($29)
/* 000348 040013C8 09000427 */  j           run_next_DL_command
/* 00034C 040013CC A7B80002 */   sh         $24, 0x2($29)
/* 000350 040013D0 0900042B */  j           .L040010AC
/* 000354 040013D4 AFB8FFFC */   sw         $24, -0x4($29)
/* 000358 040013D8 090004FF */  j           .L040013FC
/* 00035C 040013DC 8FB9FFFC */   lw         $25, -0x4($29)
dispatch_rdp:
/* 000360 040013E0 00191603 */  sra         $2, $25, 24
/* 000364 040013E4 20420003 */  addi        $2, $2, 0x3
/* 000368 040013E8 04400004 */  bltz        $2, .L040013FC
/* 00036C 040013EC 20420018 */   addi       $2, $2, 0x18
/* 000370 040013F0 0D000443 */  jal         segmented_to_physical
/* 000374 040013F4 03009820 */   add        $19, $24, $zero
/* 000378 040013F8 0260C020 */  add         $24, $19, $zero
.L040013FC:
/* 00037C 040013FC AEF90000 */  sw          $25, 0x0($23)
/* 000380 04001400 AEF80004 */  sw          $24, 0x4($23)
/* 000384 04001404 0D00045A */  jal         func_04001168
/* 000388 04001408 22F70008 */   addi       $23, $23, 0x8
/* 00038C 0400140C 1C40FF23 */  bgtz        $2, run_next_DL_command
/* 000390 04001410 00000000 */   nop
/* 000394 04001414 0900042B */  j           .L040010AC
dispatch_dma:
/* 000398 04001418 304201FE */   andi       $2, $2, 0x1FE        // mask the 9th bit
// here $2 contains the 2-8 bit multiplied by 2
/* 00039C 0400141C 844200C4 */  lh          $2, dmaJumpTable($2)
/* 0003A0 04001420 0D00044B */  jal         while_wait_dma_busy
/* 0003A4 04001424 9361FFF9 */   lbu        $1, -0x7(inputBufferPos)
/* 0003A8 04001428 00400008 */  jr          $2
/* 0003AC 0400142C 3026000F */   andi       $6, $1, 0xF

/* 0003B0 04001430 840800BE */  lh          $8, run_next_DL_command_entry
/* 0003B4 04001434 A4080106 */  sh          $8, 0x106($zero)
/* 0003B8 04001438 9369FFFA */  lbu         $9, -0x6(inputBufferPos)
/* 0003BC 0400143C CAC21800 */  ldv         $v2[0], 0x0($22)
/* 0003C0 04001440 CAC21C02 */  ldv         $v2[8], 0x10($22)
/* 0003C4 04001444 00094882 */  srl         $9, $9, 2
/* 0003C8 04001448 0D0005BA */  jal         func_040016E8
/* 0003CC 0400144C 9427031C */   lhu        $7, 0x31C($1)
/* 0003D0 04001450 CBB11005 */  llv         $v17[0], 0x14($29)
/* 0003D4 04001454 0D0005C4 */  jal         func_04001710
/* 0003D8 04001458 CBB11405 */   llv        $v17[8], 0x14($29)
.L0400145C:
/* 0003DC 0400145C 4A826706 */  vmudn       $v28, $v12, $v2[0h]
/* 0003E0 04001460 CAD21002 */  llv         $v18[0], 0x8($22)
/* 0003E4 04001464 4A82470F */  vmadh       $v28, $v8, $v2[0h]
/* 0003E8 04001468 8ECF000C */  lw          $15, 0xC($22)
/* 0003EC 0400146C 4AA26F0E */  vmadn       $v28, $v13, $v2[1h]
/* 0003F0 04001470 8ED0001C */  lw          $16, 0x1C($22)
/* 0003F4 04001474 4AA24F0F */  vmadh       $v28, $v9, $v2[1h]
/* 0003F8 04001478 30610002 */  andi        $1, $3, 0x2
/* 0003FC 0400147C 4AC2770E */  vmadn       $v28, $v14, $v2[2h]
/* 000400 04001480 4AC2570F */  vmadh       $v28, $v10, $v2[2h]
/* 000404 04001484 4B3F7F0E */  vmadn       $v28, $v15, $v31[1]
/* 000408 04001488 CAD21406 */  llv         $v18[8], 0x18($22)
/* 00040C 0400148C 4B3F5F4F */  vmadh       $v29, $v11, $v31[1]
/* 000410 04001490 142000C8 */  bnez        $1, .L040017B4
/* 000414 04001494 22D60020 */   addi       $22, $22, 0x20
.L04001498:
/* 000418 04001498 4A119485 */  vmudm       $v18, $v18, $v17
.L0400149C:
/* 00041C 0400149C C815083B */  lsv         $v21[0], 0x76($zero)
/* 000420 040014A0 4B15E506 */  vmudn       $v20, $v28, $v21[0]
/* 000424 040014A4 4B15ED4F */  vmadh       $v21, $v29, $v21[0]
/* 000428 040014A8 4AFDE8E5 */  vch         $v3, $v29, $v29[3h]
/* 00042C 040014AC 4AFCE0E4 */  vcl         $v3, $v28, $v28[3h]
/* 000430 040014B0 484D0800 */  cfc2        $t5, $1
/* 000434 040014B4 4AF5E8E5 */  vch         $v3, $v29, $v21[3h]
/* 000438 040014B8 4AF4E0E4 */  vcl         $v3, $v28, $v20[3h]
/* 00043C 040014BC 31A80707 */  andi        $8, $13, 0x707
/* 000440 040014C0 31AD7070 */  andi        $13, $13, 0x7070
/* 000444 040014C4 00084100 */  sll         $8, $8, 4
/* 000448 040014C8 000D6C00 */  sll         $13, $13, 16
/* 00044C 040014CC 01A86825 */  or          $13, $13, $8
/* 000450 040014D0 484E0800 */  cfc2        $t6, $1
/* 000454 040014D4 31C80707 */  andi        $8, $14, 0x707
/* 000458 040014D8 4B1FED50 */  vadd        $v21, $v29, $v31[0]
/* 00045C 040014DC 31CE7070 */  andi        $14, $14, 0x7070
/* 000460 040014E0 4B1FE510 */  vadd        $v20, $v28, $v31[0]
/* 000464 040014E4 000E7300 */  sll         $14, $14, 12
/* 000468 040014E8 4B13E704 */  vmudl       $v28, $v28, $v19[0]
/* 00046C 040014EC 010E4025 */  or          $8, $8, $14
/* 000470 040014F0 4B13EF4D */  vmadm       $v29, $v29, $v19[0]
/* 000474 040014F4 010D4025 */  or          $8, $8, $13
/* 000478 040014F8 4B1FFF0E */  vmadn       $v28, $v31, $v31[0]
/* 00047C 040014FC 0D000400 */  jal         Overlay1Address
/* 000480 04001500 A4E80024 */   sh         $8, 0x24($7)
/* 000484 04001504 4B1FD9A3 */  vge         $v6, $v27, $v31[0]
/* 000488 04001508 E8F51800 */  sdv         $v21[0], 0x0($7)
/* 00048C 0400150C 4B1ED9A7 */  vmrg        $v6, $v27, $v30[0]
/* 000490 04001510 E8F41801 */  sdv         $v20[0], 0x8($7)
/* 000494 04001514 4AFAA144 */  vmudl       $v5, $v20, $v26[3h]
/* 000498 04001518 4AFAA94D */  vmadm       $v5, $v21, $v26[3h]
/* 00049C 0400151C 4AE6A14E */  vmadn       $v5, $v20, $v6[3h]
/* 0004A0 04001520 4AE6A90F */  vmadh       $v4, $v21, $v6[3h]
/* 0004A4 04001524 2129FFFE */  addi        $9, $9, -0x2
/* 0004A8 04001528 4B132944 */  vmudl       $v5, $v5, $v19[0]
/* 0004AC 0400152C 4B13210D */  vmadm       $v4, $v4, $v19[0]
/* 0004B0 04001530 4B1FF94E */  vmadn       $v5, $v31, $v31[0]
/* 0004B4 04001534 306C0001 */  andi        $12, $3, 0x1
/* 0004B8 04001538 CAC21800 */  ldv         $v2[0], 0x0($22)
/* 0004BC 0400153C 4B3F09C7 */  vmudh       $v7, $v1, $v31[1]
/* 0004C0 04001540 CAC21C02 */  ldv         $v2[8], 0x10($22)
/* 0004C4 04001544 4A0029CE */  vmadn       $v7, $v5, $v0
/* 0004C8 04001548 C81D1805 */  ldv         $v29[0], 0x28($zero)
/* 0004CC 0400154C 4A00218F */  vmadh       $v6, $v4, $v0
/* 0004D0 04001550 C81D1C05 */  ldv         $v29[8], 0x28($zero)
/* 0004D4 04001554 4B1FF9CE */  vmadn       $v7, $v31, $v31[0]
/* 0004D8 04001558 4A7D31A3 */  vge         $v6, $v6, $v29[1q]
/* 0004DC 0400155C ACEF0010 */  sw          $15, 0x10($7)
/* 0004E0 04001560 1180000B */  beqz        $12, .L04001590
/* 0004E4 04001564 4A5D31A0 */   vlt        $v6, $v6, $v29[0q]
/* 0004E8 04001568 C8032039 */  lqv         $v3[0], 0x390($zero)
/* 0004EC 0400156C 4B032946 */  vmudn       $v5, $v5, $v3[0]
/* 0004F0 04001570 4B03210F */  vmadh       $v4, $v4, $v3[0]
/* 0004F4 04001574 4B232110 */  vadd        $v4, $v4, $v3[1]
/* 0004F8 04001578 4B1F2123 */  vge         $v4, $v4, $v31[0]
/* 0004FC 0400157C 4B432120 */  vlt         $v4, $v4, $v3[2]
/* 000500 04001580 E8E40293 */  sbv         $v4[5], 0x13($7)
/* 000504 04001584 ACF00018 */  sw          $16, 0x18($7)
/* 000508 04001588 E8E4069B */  sbv         $v4[13], 0x1B($7)
/* 00050C 0400158C 8CF00018 */  lw          $16, 0x18($7)
.L04001590:
/* 000510 04001590 E8F21005 */  slv         $v18[0], 0x14($7)
/* 000514 04001594 E8E61803 */  sdv         $v6[0], 0x18($7)
/* 000518 04001598 E8E70A0F */  ssv         $v7[4], 0x1E($7)
/* 00051C 0400159C E8FB0B10 */  ssv         $v27[6], 0x20($7)
/* 000520 040015A0 0520000C */  bltz        $9, .L040015D4
/* 000524 040015A4 E8FA0B11 */   ssv        $v26[6], 0x22($7)
/* 000528 040015A8 E8F51C05 */  sdv         $v21[8], 0x28($7)
/* 00052C 040015AC E8F41C06 */  sdv         $v20[8], 0x30($7)
/* 000530 040015B0 E8F2140F */  slv         $v18[8], 0x3C($7)
/* 000534 040015B4 ACF00038 */  sw          $16, 0x38($7)
/* 000538 040015B8 E8E61C08 */  sdv         $v6[8], 0x40($7)
/* 00053C 040015BC E8E70E23 */  ssv         $v7[12], 0x46($7)
/* 000540 040015C0 E8FB0F24 */  ssv         $v27[14], 0x48($7)
/* 000544 040015C4 E8FA0F25 */  ssv         $v26[14], 0x4A($7)
/* 000548 040015C8 ACE8004C */  sw          $8, 0x4C($7)
/* 00054C 040015CC 20E70050 */  addi        $7, $7, 0x50
/* 000550 040015D0 1D20FFA2 */  bgtz        $9, .L0400145C
.L040015D4:
/* 000554 040015D4 84080106 */   lh         $8, 0x106($zero)
/* 000558 040015D8 01000008 */  jr          $8
dma_MTX:
/* 00055C 040015DC 30280001 */   andi       $8, $1, 0x1        // 1=projection, 0=modelview
/* 000560 040015E0 EBBF031C */  sbv         $v31[6], 0x1C($29)
/* 000564 040015E4 1500001B */  bnez        $8, .L04001654     // if projection
/* 000568 040015E8 30270002 */   andi       $7, $1, 0x2        // 1=load, 0=multiply
/* 00056C 040015EC 201403E0 */  li          $20, 0x3E0
/* 000570 040015F0 30280004 */  andi        $8, $1, 0x4        // 1=push, 0=no push
/* 000574 040015F4 1100000A */  beqz        $8, .L04001620     // if no push
/* 000578 040015F8 CADA2003 */   lqv        $v26[0], 0x30($22)
/* 00057C 040015FC 8FB30024 */  lw          $19, 0x24($29)
/* 000580 04001600 8FA8004C */  lw          $8, 0x4C($29)
/* 000584 04001604 20110001 */  li          $17, 0x1
/* 000588 04001608 22610040 */  addi        $1, $19, 0x40
/* 00058C 0400160C 12680004 */  beq         $19, $8, .L04001620
/* 000590 04001610 200C003F */   li         $12, 0x3F
/* 000594 04001614 0D000450 */  jal         dma_read_write
/* 000598 04001618 AFA10024 */   sw         $1, 0x24($29)
/* 00059C 0400161C 0D00044B */  jal         while_wait_dma_busy
.L04001620:
/* 0005A0 04001620 CADC2001 */   lqv        $v28[0], 0x10($22)
/* 0005A4 04001624 10E0000E */  beqz        $7, .L04001660     // if multiply
/* 0005A8 04001628 CADB2002 */   lqv        $v27[0], 0x20($22)
/* 0005AC 0400162C EA9A2003 */  sqv         $v26[0], 0x30($20)
/* 0005B0 04001630 CADD2000 */  lqv         $v29[0], 0x0($22)
/* 0005B4 04001634 EA9C2001 */  sqv         $v28[0], 0x10($20)
.L04001638:
/* 0005B8 04001638 20030460 */  li          output_mtx, mpMatrix
/* 0005BC 0400163C EA9B2002 */  sqv         $v27[0], 0x20($20)
/* 0005C0 04001640 EA9D2000 */  sqv         $v29[0], 0x0($20)
.L04001644:
/* 0005C4 04001644 200103E0 */  li          input_mtx_1, mvMatrix
/* 0005C8 04001648 20020420 */  li          input_mtx_0, pMatrix
/* 0005CC 0400164C 090005A1 */  j           mtx_multiply
/* 0005D0 04001650 841F00BE */   lh         $ra, run_next_DL_command_entry
.L04001654:
/* 0005D4 04001654 CADA2003 */  lqv         $v26[0], 0x30($22)
/* 0005D8 04001658 09000588 */  j           .L04001620
/* 0005DC 0400165C 20140420 */   li         $20, pMatrix
.L04001660:
/* 0005E0 04001660 24030DE0 */  la          output_mtx, 0xDE0
/* 0005E4 04001664 00160821 */  addu        input_mtx_1, $zero, $22
/* 0005E8 04001668 0D0005A1 */  jal         mtx_multiply
/* 0005EC 0400166C 00141021 */   addu       input_mtx_0, $zero, $20
/* 0005F0 04001670 EA862003 */  sqv         $v6[0], 0x30($20)
/* 0005F4 04001674 EA852001 */  sqv         $v5[0], 0x10($20)
/* 0005F8 04001678 C87B2000 */  lqv         $v27[0], 0x0($3)
/* 0005FC 0400167C 0900058E */  j           .L04001638
/* 000600 04001680 C87D207E */   lqv        $v29[0], 0x7E0($3)
mtx_multiply:
/* 000604 04001684 20730010 */  addi        $19, output_mtx, 0x10
@@loop:
/* 000608 04001688 4B1FF947 */  vmudh       $v5, $v31, $v31[0]
/* 00060C 0400168C 20320008 */  addi        $18, input_mtx_1, 0x8
@@innerloop:
/* 000610 04001690 C8431800 */  ldv         $v3[0], 0x0(input_mtx_0)
/* 000614 04001694 C8441804 */  ldv         $v4[0], 0x20(input_mtx_0)
/* 000618 04001698 C8212000 */  lqv         $v1[0], 0x0(input_mtx_1)
/* 00061C 0400169C C8222002 */  lqv         $v2[0], 0x20(input_mtx_1)
/* 000620 040016A0 C8431C00 */  ldv         $v3[8], 0x0(input_mtx_0)
/* 000624 040016A4 C8441C04 */  ldv         $v4[8], 0x20(input_mtx_0)
/* 000628 040016A8 4A82218C */  vmadl       $v6, $v4, $v2[0h]
/* 00062C 040016AC 20210002 */  addi        input_mtx_1, input_mtx_1, 0x2
/* 000630 040016B0 4A82198D */  vmadm       $v6, $v3, $v2[0h]
/* 000634 040016B4 20420008 */  addi        input_mtx_0, input_mtx_0, 0x8
/* 000638 040016B8 4A81218E */  vmadn       $v6, $v4, $v1[0h]
/* 00063C 040016BC 4A81194F */  vmadh       $v5, $v3, $v1[0h]
/* 000640 040016C0 1432FFF3 */  bne         input_mtx_1, $18, @@innerloop
/* 000644 040016C4 4B1FF98E */   vmadn      $v6, $v31, $v31[0]
/* 000648 040016C8 2042FFE0 */  addi        input_mtx_0, input_mtx_0, -0x20
/* 00064C 040016CC 20210008 */  addi        input_mtx_1, input_mtx_1, 0x8
/* 000650 040016D0 E8652000 */  sqv         $v5[0], 0x0(output_mtx)
/* 000654 040016D4 E8662002 */  sqv         $v6[0], 0x20(output_mtx)
/* 000658 040016D8 1473FFEB */  bne         output_mtx, $19, @@loop
/* 00065C 040016DC 20630010 */   addi       output_mtx, output_mtx, 0x10
/* 000660 040016E0 03E00008 */  jr          $ra
/* 000664 040016E4 00000000 */   nop
func_040016E8:
/* 000668 040016E8 20080380 */  li          $8, 0x380
/* 00066C 040016EC C8032005 */  lqv         $v3[0], 0x50($zero)
/* 000670 040016F0 CBB30801 */  lsv         $v19[0], 0x2($29)
/* 000674 040016F4 87A30004 */  lh          $3, 0x4($29)
/* 000678 040016F8 C9001800 */  ldv         $v0[0], 0x0($8)
/* 00067C 040016FC C9011801 */  ldv         $v1[0], 0x8($8)
/* 000680 04001700 C9001C00 */  ldv         $v0[8], 0x0($8)
/* 000684 04001704 C9011C01 */  ldv         $v1[8], 0x8($8)
/* 000688 04001708 03E00008 */  jr          $ra
/* 00068C 0400170C 4A030007 */   vmudh      $v0, $v0, $v3
func_04001710:
/* 000690 04001710 20080460 */  li          $8, 0x460
/* 000694 04001714 C90B1803 */  ldv         $v11[0], 0x18($8)
/* 000698 04001718 C90B1C03 */  ldv         $v11[8], 0x18($8)
/* 00069C 0400171C C90F1807 */  ldv         $v15[0], 0x38($8)
/* 0006A0 04001720 C90F1C07 */  ldv         $v15[8], 0x38($8)
func_04001724:
/* 0006A4 04001724 C9081800 */  ldv         $v8[0], 0x0($8)
/* 0006A8 04001728 C9091801 */  ldv         $v9[0], 0x8($8)
/* 0006AC 0400172C C90A1802 */  ldv         $v10[0], 0x10($8)
/* 0006B0 04001730 C90C1804 */  ldv         $v12[0], 0x20($8)
/* 0006B4 04001734 C90D1805 */  ldv         $v13[0], 0x28($8)
/* 0006B8 04001738 C90E1806 */  ldv         $v14[0], 0x30($8)
/* 0006BC 0400173C C9081C00 */  ldv         $v8[8], 0x0($8)
/* 0006C0 04001740 C9091C01 */  ldv         $v9[8], 0x8($8)
/* 0006C4 04001744 C90A1C02 */  ldv         $v10[8], 0x10($8)
/* 0006C8 04001748 C90C1C04 */  ldv         $v12[8], 0x20($8)
/* 0006CC 0400174C C90D1C05 */  ldv         $v13[8], 0x28($8)
/* 0006D0 04001750 03E00008 */  jr          $ra
/* 0006D4 04001754 C90E1C06 */   ldv        $v14[8], 0x30($8)
/* 0006D8 04001758 CAC02000 */  lqv         $v0[0], 0x0($22)
/* 0006DC 0400175C 84250270 */  lh          $5, 0x270($1)
/* 0006E0 04001760 09000427 */  j           run_next_DL_command
/* 0006E4 04001764 E8A02000 */   sqv        $v0[0], 0x0($5)
/* 0006E8 04001768 1C200009 */  bgtz        $1, .L04001790
/* 0006EC 0400176C 83A20000 */   lb         $2, 0x0($29)
/* 0006F0 04001770 2044FFBC */  addi        $4, $2, -0x44
/* 0006F4 04001774 1C80FE49 */  bgtz        $4, run_next_DL_command
/* 0006F8 04001778 20430398 */   addi       $3, $2, 0x398
/* 0006FC 0400177C 20420004 */  addi        $2, $2, 0x4
/* 000700 04001780 035BD020 */  add         $26, $26, $27
/* 000704 04001784 035CD022 */  sub         $26, $26, $28
/* 000708 04001788 AC7A0000 */  sw          $26, 0x0($3)
/* 00070C 0400178C A3A20000 */  sb          $2, 0x0($29)
.L04001790:
/* 000710 04001790 0D000443 */  jal         segmented_to_physical
/* 000714 04001794 03009820 */   add        $19, $24, $zero
/* 000718 04001798 0260D020 */  add         $26, $19, $zero
/* 00071C 0400179C 09000427 */  j           run_next_DL_command
/* 000720 040017A0 237C0000 */   addi       $28, $27, 0x0
/* 000724 040017A4 00000000 */  nop
.org 0x040017A8
.L040017A8:
/* 000728 040017A8 341E0010 */  ori         ovlTableEntry, $zero, overlayInfo2
/* 00072C 040017AC 1000FE50 */  b           load_overlay
/* 000730 040017B0 84150100 */   lh         $21, D_0x0100($zero)
.L040017B4:
/* 000734 040017B4 341E0018 */  ori         ovlTableEntry, $zero, overlayInfo3
/* 000738 040017B8 1000FE4D */  b           load_overlay
/* 00073C 040017BC 841500A0 */   lh         $21, D_0X00AO($zero)
start:
/* 000740 040017C0 34022800 */  ori         $2, $zero, SP_CLR_SIG2 | SP_CLR_SIG1
/* 000744 040017C4 40822000 */  mtc0        $2, SP_STATUS
.L040017C8:
/* 000748 040017C8 C81F2003 */  lqv         $v31[0], (v31Value)($zero)
/* 00074C 040017CC C81E2004 */  lqv         $v30[0], (v30Value)($zero)
/* 000750 040017D0 8C040FC4 */  lw          $4, 0xFC4($zero)
/* 000754 040017D4 30840001 */  andi        $4, $4, 0x1
/* 000758 040017D8 14800036 */  bnez        $4, .L040018B4
/* 00075C 040017DC 00000000 */   nop
/* 000760 040017E0 8C370028 */  lw          $23, 0x28($1)
/* 000764 040017E4 8C23002C */  lw          $3, 0x2C($1)
/* 000768 040017E8 AFB70040 */  sw          $23, 0x40($29)
/* 00076C 040017EC AFA30044 */  sw          $3, 0x44($29)
/* 000770 040017F0 40045800 */  mfc0        $4, DPC_STATUS
/* 000774 040017F4 30840001 */  andi        $4, $4, DPC_STATUS_XBUS_DMA
/* 000778 040017F8 1480000A */  bnez        $4, wait_dpc_start_valid
/* 00077C 040017FC 40044800 */   mfc0       $4, DPC_END
/* 000780 04001800 02E4B822 */  sub         $23, $23, $4
/* 000784 04001804 1EE00007 */  bgtz        $23, wait_dpc_start_valid
/* 000788 04001808 40055000 */   mfc0       $5, DPC_CURRENT
/* 00078C 0400180C 10A00005 */  beqz        $5, wait_dpc_start_valid
/* 000790 04001810 00000000 */   nop
.L04001814:
/* 000794 04001814 10A40003 */  beq         $5, $4, wait_dpc_start_valid
/* 000798 04001818 00000000 */   nop
/* 00079C 0400181C 09000610 */  j           calculate_overlay_addrs
/* 0007A0 04001820 34830000 */   ori        $3, $4, 0x0
wait_dpc_start_valid:
/* 0007A4 04001824 40045800 */  mfc0        $4, DPC_STATUS
/* 0007A8 04001828 30840400 */  andi        $4, $4, DPC_STATUS_START_VALID
/* 0007AC 0400182C 1480FFFD */  bnez        $4, wait_dpc_start_valid
/* 0007B0 04001830 20040001 */   li         $4, DPC_STATUS_CLR_XBUS
/* 0007B4 04001834 40845800 */  mtc0        $4, DPC_STATUS
/* 0007B8 04001838 40834000 */  mtc0        $3, DPC_START
/* 0007BC 0400183C 40834800 */  mtc0        $3, DPC_END
calculate_overlay_addrs:
/* 0007C0 04001840 AFA30018 */  sw          $3, 0x18($29)
/* 0007C4 04001844 20170CE0 */  li          $23, 0xCE0
/* 0007C8 04001848 8C250010 */  lw          $5, OSTask_ucode($1)
/* 0007CC 0400184C 8C020008 */  lw          $2, overlayInfo1 + overlay_load
/* 0007D0 04001850 8C030010 */  lw          $3, overlayInfo2 + overlay_load
/* 0007D4 04001854 8C040018 */  lw          $4, overlayInfo3 + overlay_load
/* 0007D8 04001858 8C060020 */  lw          $6, overlayInfo4 + overlay_load
/* 0007DC 0400185C 00451020 */  add         $2, $2, $5
/* 0007E0 04001860 00651820 */  add         $3, $3, $5
/* 0007E4 04001864 00852020 */  add         $4, $4, $5
/* 0007E8 04001868 00C53020 */  add         $6, $6, $5
/* 0007EC 0400186C AC020008 */  sw          $2, overlayInfo1 + overlay_load
/* 0007F0 04001870 AC030010 */  sw          $3, overlayInfo2 + overlay_load
/* 0007F4 04001874 AC040018 */  sw          $4, overlayInfo3 + overlay_load
/* 0007F8 04001878 AC060020 */  sw          $6, overlayInfo4 + overlay_load
/* 0007FC 0400187C 0D00043B */  jal         load_overlay_fcn
/* 000800 04001880 201E0008 */   li         ovlTableEntry, overlayInfo1
/* 000804 04001884 0D000432 */  jal         load_display_list_dma
/* 000808 04001888 8C3A0030 */   lw         $26, 0x30($1)
/* 00080C 0400188C 8C220020 */  lw          $2, 0x20($1)
/* 000810 04001890 8C230024 */  lw          $3, 0x24($1)
/* 000814 04001894 AFA20020 */  sw          $2, 0x20($29)
/* 000818 04001898 AFA20024 */  sw          $2, 0x24($29)
/* 00081C 0400189C 00431020 */  add         $2, $2, $3
/* 000820 040018A0 AFA2004C */  sw          $2, 0x4C($29)
/* 000824 040018A4 8C02FFF8 */  lw          $2, -0x8($zero)
/* 000828 040018A8 AC020108 */  sw          $2, 0x108($zero)
/* 00082C 040018AC 09000416 */  j           wait_for_dma_and_run_next_command
/* 000830 040018B0 00000000 */   nop
.L040018B4:
/* 000834 040018B4 0D00043B */  jal         load_overlay_fcn
/* 000838 040018B8 201E0008 */   li         ovlTableEntry, overlayInfo1
/* 00083C 040018BC 8C170BF0 */  lw          $23, 0xBF0($zero)
/* 000840 040018C0 8C1C0BE4 */  lw          $28, 0xBE4($zero)
/* 000844 040018C4 8C1B0BE8 */  lw          $27, 0xBE8($zero)
/* 000848 040018C8 09000427 */  j           run_next_DL_command
/* 00084C 040018CC 8C1A0BEC */   lw         $26, 0xBEC($zero)
.fill 248, 0
func_040019C8:
/* 000948 040019C8 846B0024 */  lh          $11, 0x24($3)
/* 00094C 040019CC 84480024 */  lh          $8, 0x24($2)
/* 000950 040019D0 84290024 */  lh          $9, 0x24($1)
/* 000954 040019D4 01686024 */  and         $12, $11, $8
/* 000958 040019D8 01685825 */  or          $11, $11, $8
/* 00095C 040019DC 01896024 */  and         $12, $12, $9
/* 000960 040019E0 318C7070 */  andi        $12, $12, 0x7070
/* 000964 040019E4 1580016F */  bnez        $12, .L04001FA4
/* 000968 040019E8 01695825 */   or         $11, $11, $9
/* 00096C 040019EC 316B4343 */  andi        $11, $11, 0x4343
/* 000970 040019F0 1560FF6D */  bnez        $11, .L040017A8
func_040019F4:
/* 000974 040019F4 C82D1006 */   llv        $v13[0], 0x18($1)
/* 000978 040019F8 C84E1006 */  llv         $v14[0], 0x18($2)
/* 00097C 040019FC C86F1006 */  llv         $v15[0], 0x18($3)
/* 000980 04001A00 8FAD0004 */  lw          $13, 0x4($29)
/* 000984 04001A04 20080BE0 */  li          $8, 0xBE0
/* 000988 04001A08 CBB50801 */  lsv         $v21[0], 0x2($29)
/* 00098C 04001A0C C8250803 */  lsv         $v5[0], 0x6($1)
/* 000990 04001A10 4A0D7291 */  vsub        $v10, $v14, $v13
/* 000994 04001A14 C8260807 */  lsv         $v6[0], 0xE($1)
/* 000998 04001A18 4A0D7A51 */  vsub        $v9, $v15, $v13
/* 00099C 04001A1C C8450903 */  lsv         $v5[2], 0x6($2)
/* 0009A0 04001A20 4A0E6B11 */  vsub        $v12, $v13, $v14
/* 0009A4 04001A24 C8460907 */  lsv         $v6[2], 0xE($2)
/* 0009A8 04001A28 C8650A03 */  lsv         $v5[4], 0x6($3)
/* 0009AC 04001A2C C8660A07 */  lsv         $v6[4], 0xE($3)
/* 0009B0 04001A30 4B2A4C07 */  vmudh       $v16, $v9, $v10[1]
/* 0009B4 04001A34 8429001A */  lh          $9, 0x1A($1)
/* 0009B8 04001A38 4B29640F */  vmadh       $v16, $v12, $v9[1]
/* 0009BC 04001A3C 844A001A */  lh          $10, 0x1A($2)
/* 0009C0 04001A40 4B3CE71D */  vsar        $v28, $v28, $v28[1]
/* 0009C4 04001A44 846B001A */  lh          $11, 0x1A($3)
/* 0009C8 04001A48 4B1DEF5D */  vsar        $v29, $v29, $v29[0]
/* 0009CC 04001A4C 000D7C80 */  sll         $15, $13, 18
/* 0009D0 04001A50 48118000 */  mfc2        $17, $v16[0]
/* 0009D4 04001A54 A4010BE0 */  sh          $1, 0xBE0($zero)
/* 0009D8 04001A58 A4020BE2 */  sh          $2, 0xBE2($zero)
/* 0009DC 04001A5C 022F7824 */  and         $15, $17, $15
/* 0009E0 04001A60 05E0014F */  bltz        $15, .L04001FA0
/* 0009E4 04001A64 A4030BE4 */   sh         $3, 0xBE4($zero)
/* 0009E8 04001A68 016A382A */  slt         $7, $11, $10
/* 0009EC 04001A6C 0149602A */  slt         $12, $10, $9
/* 0009F0 04001A70 00E73820 */  add         $7, $7, $7
/* 0009F4 04001A74 00EC3820 */  add         $7, $7, $12
/* 0009F8 04001A78 012B602A */  slt         $12, $9, $11
/* 0009FC 04001A7C 00E73820 */  add         $7, $7, $7
/* 000A00 04001A80 00EC3820 */  add         $7, $7, $12
/* 000A04 04001A84 90E30360 */  lbu         $3, 0x360($7)
/* 000A08 04001A88 90E20367 */  lbu         $2, 0x367($7)
/* 000A0C 04001A8C 90E1036E */  lbu         $1, 0x36E($7)
/* 000A10 04001A90 84630BE0 */  lh          $3, 0xBE0($3)
/* 000A14 04001A94 84420BE0 */  lh          $2, 0xBE0($2)
/* 000A18 04001A98 84210BE0 */  lh          $1, 0xBE0($1)
/* 000A1C 04001A9C 90EC0375 */  lbu         $12, 0x375($7)
/* 000A20 04001AA0 C86F1006 */  llv         $v15[0], 0x18($3)
/* 000A24 04001AA4 C84E1006 */  llv         $v14[0], 0x18($2)
/* 000A28 04001AA8 19800003 */  blez        $12, .L04001AB8
/* 000A2C 04001AAC C82D1006 */   llv        $v13[0], 0x18($1)
/* 000A30 04001AB0 4A1CFF15 */  vsubc       $v28, $v31, $v28
/* 000A34 04001AB4 4A1DFF51 */  vsub        $v29, $v31, $v29
.L04001AB8:
/* 000A38 04001AB8 1220013A */  beqz        $17, .L04001FA4
/* 000A3C 04001ABC 4A0E7911 */   vsub       $v4, $v15, $v14
/* 000A40 04001AC0 000D74C0 */  sll         $14, $13, 19
/* 000A44 04001AC4 4A0D7291 */  vsub        $v10, $v14, $v13
/* 000A48 04001AC8 01C07027 */  not         $14, $14
/* 000A4C 04001ACC 4A0D7A51 */  vsub        $v9, $v15, $v13
/* 000A50 04001AD0 022E7025 */  or          $14, $17, $14
/* 000A54 04001AD4 4B1D5F73 */  vmov        $v29[3], $v29[0]
/* 000A58 04001AD8 05C10131 */  bgez        $14, .L04001FA0
/* 000A5C 04001ADC 4B1C5F33 */   vmov       $v28[3], $v28[0]
/* 000A60 04001AE0 EAEF0901 */  ssv         $v15[2], 0x2($23)
/* 000A64 04001AE4 4B0A5133 */  vmov        $v4[2], $v10[0]
/* 000A68 04001AE8 EAEE0902 */  ssv         $v14[2], 0x4($23)
/* 000A6C 04001AEC 4B2A5933 */  vmov        $v4[3], $v10[1]
/* 000A70 04001AF0 EAED0903 */  ssv         $v13[2], 0x6($23)
/* 000A74 04001AF4 4B096133 */  vmov        $v4[4], $v9[0]
/* 000A78 04001AF8 4806EA80 */  mfc2        $6, $v29[5]
/* 000A7C 04001AFC 4B296933 */  vmov        $v4[5], $v9[1]
/* 000A80 04001B00 0D000400 */  jal         Overlay1Address
/* 000A84 04001B04 4B9F6886 */   vmudn      $v2, $v13, $v31[4]
/* 000A88 04001B08 83A50007 */  lb          $5, 0x7($29)
/* 000A8C 04001B0C 4B9F2245 */  vmudm       $v9, $v4, $v31[4]
/* 000A90 04001B10 4B1FFA8E */  vmadn       $v10, $v31, $v31[0]
/* 000A94 04001B14 30C60080 */  andi        $6, $6, 0x80
/* 000A98 04001B18 4B244A30 */  vrcp        $v8[1], $v4[1]
/* 000A9C 04001B1C 34A500C8 */  ori         $5, $5, 0xC8
/* 000AA0 04001B20 4B1F49F2 */  vrcph       $v7[1], $v31[0]
/* 000AA4 04001B24 83A70012 */  lb          $7, 0x12($29)
/* 000AA8 04001B28 4B645A30 */  vrcp        $v8[3], $v4[3]
/* 000AAC 04001B2C 4B1F59F2 */  vrcph       $v7[3], $v31[0]
/* 000AB0 04001B30 4BA46A30 */  vrcp        $v8[5], $v4[5]
/* 000AB4 04001B34 4B1F69F2 */  vrcph       $v7[5], $v31[0]
/* 000AB8 04001B38 00C73025 */  or          $6, $6, $7
/* 000ABC 04001B3C 4B9E4204 */  vmudl       $v8, $v8, $v30[4]
/* 000AC0 04001B40 A2E50000 */  sb          $5, 0x0($23)
/* 000AC4 04001B44 4B9E39CD */  vmadm       $v7, $v7, $v30[4]
/* 000AC8 04001B48 A2E60001 */  sb          $6, 0x1($23)
/* 000ACC 04001B4C 4B1FFA0E */  vmadn       $v8, $v31, $v31[0]
/* 000AD0 04001B50 4BBF2107 */  vmudh       $v4, $v4, $v31[5]
/* 000AD4 04001B54 C84C080C */  lsv         $v12[0], 0x18($2)
/* 000AD8 04001B58 4B153184 */  vmudl       $v6, $v6, $v21[0]
/* 000ADC 04001B5C C82C0A0C */  lsv         $v12[4], 0x18($1)
/* 000AE0 04001B60 4B15294D */  vmadm       $v5, $v5, $v21[0]
/* 000AE4 04001B64 C82C0C0C */  lsv         $v12[8], 0x18($1)
/* 000AE8 04001B68 4B1FF98E */  vmadn       $v6, $v31, $v31[0]
/* 000AEC 04001B6C 4A4A4044 */  vmudl       $v1, $v8, $v10[0q]
/* 000AF0 04001B70 4A4A384D */  vmadm       $v1, $v7, $v10[0q]
/* 000AF4 04001B74 4A49404E */  vmadn       $v1, $v8, $v9[0q]
/* 000AF8 04001B78 4A49380F */  vmadh       $v0, $v7, $v9[0q]
/* 000AFC 04001B7C 4B1FF84E */  vmadn       $v1, $v31, $v31[0]
/* 000B00 04001B80 AD030000 */  sw          $3, 0x0($8)
/* 000B04 04001B84 4B9F4204 */  vmudl       $v8, $v8, $v31[4]
/* 000B08 04001B88 4B9F39CD */  vmadm       $v7, $v7, $v31[4]
/* 000B0C 04001B8C 4B1FFA0E */  vmadn       $v8, $v31, $v31[0]
/* 000B10 04001B90 4B9F0844 */  vmudl       $v1, $v1, $v31[4]
/* 000B14 04001B94 4B9F000D */  vmadm       $v0, $v0, $v31[4]
/* 000B18 04001B98 4B1FF84E */  vmadn       $v1, $v31, $v31[0]
/* 000B1C 04001B9C 4B3E0C28 */  vand        $v16, $v1, $v30[1]
.L04001BA0:
/* 000B20 04001BA0 4B9F6305 */  vmudm       $v12, $v12, $v31[4]
/* 000B24 04001BA4 AD020004 */  sw          $2, 0x4($8)
/* 000B28 04001BA8 4B1FFB4E */  vmadn       $v13, $v31, $v31[0]
/* 000B2C 04001BAC AD010008 */  sw          $1, 0x8($8)
/* 000B30 04001BB0 4BDE0026 */  vcr         $v0, $v0, $v30[6]
/* 000B34 04001BB4 EAEC0804 */  ssv         $v12[0], 0x8($23)
/* 000B38 04001BB8 4B2282C4 */  vmudl       $v11, $v16, $v2[1]
/* 000B3C 04001BBC EAED0805 */  ssv         $v13[0], 0xA($23)
/* 000B40 04001BC0 4B22028D */  vmadm       $v10, $v0, $v2[1]
/* 000B44 04001BC4 EAE00906 */  ssv         $v0[2], 0xC($23)
/* 000B48 04001BC8 4B1FFACE */  vmadn       $v11, $v31, $v31[0]
/* 000B4C 04001BCC EAE10907 */  ssv         $v1[2], 0xE($23)
/* 000B50 04001BD0 30A70002 */  andi        $7, $5, 0x2
/* 000B54 04001BD4 210F0008 */  addi        $15, $8, 0x8
/* 000B58 04001BD8 21100010 */  addi        $16, $8, 0x10
/* 000B5C 04001BDC 4A6B68D5 */  vsubc       $v3, $v13, $v11[1q]
/* 000B60 04001BE0 EAE00D0A */  ssv         $v0[10], 0x14($23)
/* 000B64 04001BE4 4A6A6251 */  vsub        $v9, $v12, $v10[1q]
/* 000B68 04001BE8 EAE10D0B */  ssv         $v1[10], 0x16($23)
/* 000B6C 04001BEC 4B263555 */  vsubc       $v21, $v6, $v6[1]
/* 000B70 04001BF0 EAE00B0E */  ssv         $v0[6], 0x1C($23)
/* 000B74 04001BF4 4B252CE0 */  vlt         $v19, $v5, $v5[1]
/* 000B78 04001BF8 EAE10B0F */  ssv         $v1[6], 0x1E($23)
/* 000B7C 04001BFC 4B263527 */  vmrg        $v20, $v6, $v6[1]
/* 000B80 04001C00 EAE90C08 */  ssv         $v9[8], 0x10($23)
/* 000B84 04001C04 4B46A555 */  vsubc       $v21, $v20, $v6[2]
/* 000B88 04001C08 EAE30C09 */  ssv         $v3[8], 0x12($23)
/* 000B8C 04001C0C 4B459CE0 */  vlt         $v19, $v19, $v5[2]
/* 000B90 04001C10 EAE90A0C */  ssv         $v9[4], 0x18($23)
/* 000B94 04001C14 4B46A527 */  vmrg        $v20, $v20, $v6[2]
/* 000B98 04001C18 EAE30A0D */  ssv         $v3[4], 0x1A($23)
/* 000B9C 04001C1C 22F70020 */  addi        $23, $23, 0x20
/* 000BA0 04001C20 18E00031 */  blez        $7, .L04001CE8
/* 000BA4 04001C24 4BBEA504 */   vmudl      $v20, $v20, $v30[5]
/* 000BA8 04001C28 8DEE0000 */  lw          $14, 0x0($15)
/* 000BAC 04001C2C 4BBE9CCD */  vmadm       $v19, $v19, $v30[5]
/* 000BB0 04001C30 8DF1FFFC */  lw          $17, -0x4($15)
/* 000BB4 04001C34 4B1FFD0E */  vmadn       $v20, $v31, $v31[0]
/* 000BB8 04001C38 8DF2FFF8 */  lw          $18, -0x8($15)
/* 000BBC 04001C3C C9C91005 */  llv         $v9[0], 0x14($14)
/* 000BC0 04001C40 CA291405 */  llv         $v9[8], 0x14($17)
/* 000BC4 04001C44 CA561005 */  llv         $v22[0], 0x14($18)
/* 000BC8 04001C48 C9CB0811 */  lsv         $v11[0], 0x22($14)
/* 000BCC 04001C4C C9CC0810 */  lsv         $v12[0], 0x20($14)
/* 000BD0 04001C50 CA2B0C11 */  lsv         $v11[8], 0x22($17)
/* 000BD4 04001C54 4B1E5273 */  vmov        $v9[2], $v30[0]
/* 000BD8 04001C58 CA2C0C10 */  lsv         $v12[8], 0x20($17)
/* 000BDC 04001C5C 4B1E7273 */  vmov        $v9[6], $v30[0]
/* 000BE0 04001C60 CA580811 */  lsv         $v24[0], 0x22($18)
/* 000BE4 04001C64 4B1E55B3 */  vmov        $v22[2], $v30[0]
/* 000BE8 04001C68 CA590810 */  lsv         $v25[0], 0x20($18)
/* 000BEC 04001C6C 4B145984 */  vmudl       $v6, $v11, $v20[0]
/* 000BF0 04001C70 4B14618D */  vmadm       $v6, $v12, $v20[0]
/* 000BF4 04001C74 E9130822 */  ssv         $v19[0], 0x44($8)
/* 000BF8 04001C78 4B13598E */  vmadn       $v6, $v11, $v19[0]
/* 000BFC 04001C7C E9140826 */  ssv         $v20[0], 0x4C($8)
/* 000C00 04001C80 4B13614F */  vmadh       $v5, $v12, $v19[0]
/* 000C04 04001C84 4B14C404 */  vmudl       $v16, $v24, $v20[0]
/* 000C08 04001C88 4B14CC0D */  vmadm       $v16, $v25, $v20[0]
/* 000C0C 04001C8C 4B13C50E */  vmadn       $v20, $v24, $v19[0]
/* 000C10 04001C90 4B13CCCF */  vmadh       $v19, $v25, $v19[0]
/* 000C14 04001C94 4A864C05 */  vmudm       $v16, $v9, $v6[0h]
/* 000C18 04001C98 4A854A4F */  vmadh       $v9, $v9, $v5[0h]
/* 000C1C 04001C9C 4B1FFA8E */  vmadn       $v10, $v31, $v31[0]
/* 000C20 04001CA0 4B14B405 */  vmudm       $v16, $v22, $v20[0]
/* 000C24 04001CA4 4B13B58F */  vmadh       $v22, $v22, $v19[0]
/* 000C28 04001CA8 4B1FFDCE */  vmadn       $v23, $v31, $v31[0]
/* 000C2C 04001CAC EA091C02 */  sdv         $v9[8], 0x10($16)
/* 000C30 04001CB0 EA0A1C03 */  sdv         $v10[8], 0x18($16)
/* 000C34 04001CB4 EA091800 */  sdv         $v9[0], 0x0($16)
/* 000C38 04001CB8 EA0A1801 */  sdv         $v10[0], 0x8($16)
/* 000C3C 04001CBC EA161804 */  sdv         $v22[0], 0x20($16)
/* 000C40 04001CC0 EA171805 */  sdv         $v23[0], 0x28($16)
/* 000C44 04001CC4 4A094A53 */  vabs        $v9, $v9, $v9
/* 000C48 04001CC8 CA131004 */  llv         $v19[0], 0x10($16)
/* 000C4C 04001CCC 4A16B593 */  vabs        $v22, $v22, $v22
/* 000C50 04001CD0 CA141006 */  llv         $v20[0], 0x18($16)
/* 000C54 04001CD4 4A139CD3 */  vabs        $v19, $v19, $v19
/* 000C58 04001CD8 4A164C63 */  vge         $v17, $v9, $v22
/* 000C5C 04001CDC 4A1754A7 */  vmrg        $v18, $v10, $v23
/* 000C60 04001CE0 4A138C63 */  vge         $v17, $v17, $v19
/* 000C64 04001CE4 4A1494A7 */  vmrg        $v18, $v18, $v20
.L04001CE8:
/* 000C68 04001CE8 E9111010 */  slv         $v17[0], 0x40($8)
/* 000C6C 04001CEC E9121012 */  slv         $v18[0], 0x48($8)
/* 000C70 04001CF0 30A70007 */  andi        $7, $5, 0x7
/* 000C74 04001CF4 18E000A8 */  blez        $7, .L04001F98
/* 000C78 04001CF8 4A1FFCAC */   vxor       $v18, $v31, $v31
/* 000C7C 04001CFC C8793802 */  luv         $v25[0], 0x10($3)
/* 000C80 04001D00 4BBE9410 */  vadd        $v16, $v18, $v30[5]
/* 000C84 04001D04 C82F3802 */  luv         $v15[0], 0x10($1)
/* 000C88 04001D08 4BBE9610 */  vadd        $v24, $v18, $v30[5]
/* 000C8C 04001D0C 31A70200 */  andi        $7, $13, 0x200
/* 000C90 04001D10 4BBE9150 */  vadd        $v5, $v18, $v30[5]
/* 000C94 04001D14 1CE00004 */  bgtz        $7, .L04001D28
/* 000C98 04001D18 C8573802 */   luv        $v23[0], 0x10($2)
/* 000C9C 04001D1C C8993802 */  luv         $v25[0], 0x10($4)
/* 000CA0 04001D20 C88F3802 */  luv         $v15[0], 0x10($4)
/* 000CA4 04001D24 C8973802 */  luv         $v23[0], 0x10($4)
.L04001D28:
/* 000CA8 04001D28 4BFFCE45 */  vmudm       $v25, $v25, $v31[7]
/* 000CAC 04001D2C 4BFF7BC5 */  vmudm       $v15, $v15, $v31[7]
/* 000CB0 04001D30 4BFFBDC5 */  vmudm       $v23, $v23, $v31[7]
/* 000CB4 04001D34 C9101C03 */  ldv         $v16[8], 0x18($8)
/* 000CB8 04001D38 C90F1C02 */  ldv         $v15[8], 0x10($8)
/* 000CBC 04001D3C C9181C05 */  ldv         $v24[8], 0x28($8)
/* 000CC0 04001D40 C9171C04 */  ldv         $v23[8], 0x20($8)
/* 000CC4 04001D44 C9051C07 */  ldv         $v5[8], 0x38($8)
/* 000CC8 04001D48 C9191C06 */  ldv         $v25[8], 0x30($8)
/* 000CCC 04001D4C C8300F0F */  lsv         $v16[14], 0x1E($1)
/* 000CD0 04001D50 C82F0F0E */  lsv         $v15[14], 0x1C($1)
/* 000CD4 04001D54 C8580F0F */  lsv         $v24[14], 0x1E($2)
/* 000CD8 04001D58 C8570F0E */  lsv         $v23[14], 0x1C($2)
/* 000CDC 04001D5C C8650F0F */  lsv         $v5[14], 0x1E($3)
/* 000CE0 04001D60 C8790F0E */  lsv         $v25[14], 0x1C($3)
/* 000CE4 04001D64 4A10C315 */  vsubc       $v12, $v24, $v16
/* 000CE8 04001D68 4A0FBAD1 */  vsub        $v11, $v23, $v15
/* 000CEC 04001D6C 4A058515 */  vsubc       $v20, $v16, $v5
/* 000CF0 04001D70 4A197CD1 */  vsub        $v19, $v15, $v25
/* 000CF4 04001D74 4A102A95 */  vsubc       $v10, $v5, $v16
/* 000CF8 04001D78 4A0FCA51 */  vsub        $v9, $v25, $v15
/* 000CFC 04001D7C 4A188595 */  vsubc       $v22, $v16, $v24
/* 000D00 04001D80 4A177D51 */  vsub        $v21, $v15, $v23
/* 000D04 04001D84 4B645186 */  vmudn       $v6, $v10, $v4[3]
/* 000D08 04001D88 4B64498F */  vmadh       $v6, $v9, $v4[3]
/* 000D0C 04001D8C 4BA4B18E */  vmadn       $v6, $v22, $v4[5]
/* 000D10 04001D90 4BA4A98F */  vmadh       $v6, $v21, $v4[5]
/* 000D14 04001D94 4B094A5D */  vsar        $v9, $v9, $v9[0]
/* 000D18 04001D98 4B2A529D */  vsar        $v10, $v10, $v10[1]
/* 000D1C 04001D9C 4B846186 */  vmudn       $v6, $v12, $v4[4]
/* 000D20 04001DA0 4B84598F */  vmadh       $v6, $v11, $v4[4]
/* 000D24 04001DA4 4B44A18E */  vmadn       $v6, $v20, $v4[2]
/* 000D28 04001DA8 4B44998F */  vmadh       $v6, $v19, $v4[2]
/* 000D2C 04001DAC 4B0B5ADD */  vsar        $v11, $v11, $v11[0]
/* 000D30 04001DB0 4B2C631D */  vsar        $v12, $v12, $v12[1]
/* 000D34 04001DB4 4B7A5184 */  vmudl       $v6, $v10, $v26[3]
/* 000D38 04001DB8 4B7A498D */  vmadm       $v6, $v9, $v26[3]
/* 000D3C 04001DBC 4B7B528E */  vmadn       $v10, $v10, $v27[3]
/* 000D40 04001DC0 4B7B4A4F */  vmadh       $v9, $v9, $v27[3]
/* 000D44 04001DC4 4B7A6184 */  vmudl       $v6, $v12, $v26[3]
/* 000D48 04001DC8 4B7A598D */  vmadm       $v6, $v11, $v26[3]
/* 000D4C 04001DCC 4B7B630E */  vmadn       $v12, $v12, $v27[3]
/* 000D50 04001DD0 EAE91801 */  sdv         $v9[0], 0x8($23)
/* 000D54 04001DD4 4B7B5ACF */  vmadh       $v11, $v11, $v27[3]
/* 000D58 04001DD8 EAEA1803 */  sdv         $v10[0], 0x18($23)
/* 000D5C 04001DDC 4B3F6186 */  vmudn       $v6, $v12, $v31[1]
/* 000D60 04001DE0 4B3F598F */  vmadh       $v6, $v11, $v31[1]
/* 000D64 04001DE4 4BA1518C */  vmadl       $v6, $v10, $v1[5]
/* 000D68 04001DE8 4BA1498D */  vmadm       $v6, $v9, $v1[5]
/* 000D6C 04001DEC 4BA0538E */  vmadn       $v14, $v10, $v0[5]
/* 000D70 04001DF0 EAEB1805 */  sdv         $v11[0], 0x28($23)
/* 000D74 04001DF4 4BA04B4F */  vmadh       $v13, $v9, $v0[5]
/* 000D78 04001DF8 EAEC1807 */  sdv         $v12[0], 0x38($23)
/* 000D7C 04001DFC 4B227704 */  vmudl       $v28, $v14, $v2[1]
/* 000D80 04001E00 EAED1804 */  sdv         $v13[0], 0x20($23)
/* 000D84 04001E04 4B22698D */  vmadm       $v6, $v13, $v2[1]
/* 000D88 04001E08 EAEE1806 */  sdv         $v14[0], 0x30($23)
/* 000D8C 04001E0C 4B1FFF0E */  vmadn       $v28, $v31, $v31[0]
/* 000D90 04001E10 4A1C8495 */  vsubc       $v18, $v16, $v28
/* 000D94 04001E14 4A067C51 */  vsub        $v17, $v15, $v6
/* 000D98 04001E18 30A70004 */  andi        $7, $5, 0x4
/* 000D9C 04001E1C 18E00004 */  blez        $7, .L04001E30
/* 000DA0 04001E20 30A70002 */   andi       $7, $5, 0x2
/* 000DA4 04001E24 22F70040 */  addi        $23, $23, 0x40
/* 000DA8 04001E28 EAF11878 */  sdv         $v17[0], 0x3C0($23)
/* 000DAC 04001E2C EAF2187A */  sdv         $v18[0], 0x3D0($23)
.L04001E30:
/* 000DB0 04001E30 18E0003E */  blez        $7, .L04001F2C
/* 000DB4 04001E34 30A70001 */   andi       $7, $5, 0x1
/* 000DB8 04001E38 20100800 */  li          $16, 0x800
/* 000DBC 04001E3C 48909800 */  mtc2        $16, $v19[0]
/* 000DC0 04001E40 4A094E13 */  vabs        $v24, $v9, $v9
/* 000DC4 04001E44 C9141C08 */  ldv         $v20[8], 0x40($8)
/* 000DC8 04001E48 4A0B5E53 */  vabs        $v25, $v11, $v11
/* 000DCC 04001E4C C9151C09 */  ldv         $v21[8], 0x48($8)
/* 000DD0 04001E50 4B13C605 */  vmudm       $v24, $v24, $v19[0]
/* 000DD4 04001E54 4B1FFE8E */  vmadn       $v26, $v31, $v31[0]
/* 000DD8 04001E58 4B13CE45 */  vmudm       $v25, $v25, $v19[0]
/* 000DDC 04001E5C 4B1FFECE */  vmadn       $v27, $v31, $v31[0]
/* 000DE0 04001E60 4B13AD44 */  vmudl       $v21, $v21, $v19[0]
/* 000DE4 04001E64 4B13A50D */  vmadm       $v20, $v20, $v19[0]
/* 000DE8 04001E68 4B1FFD4E */  vmadn       $v21, $v31, $v31[0]
/* 000DEC 04001E6C 4B5FD686 */  vmudn       $v26, $v26, $v31[2]
/* 000DF0 04001E70 4B5FC60F */  vmadh       $v24, $v24, $v31[2]
/* 000DF4 04001E74 4B1FFE8E */  vmadn       $v26, $v31, $v31[0]
/* 000DF8 04001E78 4B3FDDCE */  vmadn       $v23, $v27, $v31[1]
/* 000DFC 04001E7C 4B3FCD8F */  vmadh       $v22, $v25, $v31[1]
/* 000E00 04001E80 4B3FA98E */  vmadn       $v6, $v21, $v31[1]
/* 000E04 04001E84 4B3FA14F */  vmadh       $v5, $v20, $v31[1]
/* 000E08 04001E88 4BA635D5 */  vsubc       $v23, $v6, $v6[5]
/* 000E0C 04001E8C 4BA52963 */  vge         $v5, $v5, $v5[5]
/* 000E10 04001E90 4BA631A7 */  vmrg        $v6, $v6, $v6[5]
/* 000E14 04001E94 4BC635D5 */  vsubc       $v23, $v6, $v6[6]
/* 000E18 04001E98 4BC52963 */  vge         $v5, $v5, $v5[6]
/* 000E1C 04001E9C 4BC631A7 */  vmrg        $v6, $v6, $v6[6]
/* 000E20 04001EA0 4B7E3184 */  vmudl       $v6, $v6, $v30[3]
/* 000E24 04001EA4 4B7E294D */  vmadm       $v5, $v5, $v30[3]
/* 000E28 04001EA8 4B1FF98E */  vmadn       $v6, $v31, $v31[0]
/* 000E2C 04001EAC 4B8545F2 */  vrcph       $v23[0], $v5[4]
/* 000E30 04001EB0 4B8641B1 */  vrcpl       $v6[0], $v6[4]
/* 000E34 04001EB4 4B1F4172 */  vrcph       $v5[0], $v31[0]
/* 000E38 04001EB8 4B5F3186 */  vmudn       $v6, $v6, $v31[2]
/* 000E3C 04001EBC 4B5F294F */  vmadh       $v5, $v5, $v31[2]
/* 000E40 04001EC0 4B3F2960 */  vlt         $v5, $v5, $v31[1]
/* 000E44 04001EC4 4B1F31A7 */  vmrg        $v6, $v6, $v31[0]
/* 000E48 04001EC8 4B069504 */  vmudl       $v20, $v18, $v6[0]
/* 000E4C 04001ECC 4B068D0D */  vmadm       $v20, $v17, $v6[0]
/* 000E50 04001ED0 4B05950E */  vmadn       $v20, $v18, $v5[0]
/* 000E54 04001ED4 4B058CCF */  vmadh       $v19, $v17, $v5[0]
/* 000E58 04001ED8 4B065584 */  vmudl       $v22, $v10, $v6[0]
/* 000E5C 04001EDC 4B064D8D */  vmadm       $v22, $v9, $v6[0]
/* 000E60 04001EE0 4B05558E */  vmadn       $v22, $v10, $v5[0]
/* 000E64 04001EE4 EAF31C00 */  sdv         $v19[8], 0x0($23)
/* 000E68 04001EE8 4B054D4F */  vmadh       $v21, $v9, $v5[0]
/* 000E6C 04001EEC EAF41C02 */  sdv         $v20[8], 0x10($23)
/* 000E70 04001EF0 4B066604 */  vmudl       $v24, $v12, $v6[0]
/* 000E74 04001EF4 4B065E0D */  vmadm       $v24, $v11, $v6[0]
/* 000E78 04001EF8 4B05660E */  vmadn       $v24, $v12, $v5[0]
/* 000E7C 04001EFC EAF51C01 */  sdv         $v21[8], 0x8($23)
/* 000E80 04001F00 4B055DCF */  vmadh       $v23, $v11, $v5[0]
/* 000E84 04001F04 EAF61C03 */  sdv         $v22[8], 0x18($23)
/* 000E88 04001F08 4B067684 */  vmudl       $v26, $v14, $v6[0]
/* 000E8C 04001F0C 4B066E8D */  vmadm       $v26, $v13, $v6[0]
/* 000E90 04001F10 4B05768E */  vmadn       $v26, $v14, $v5[0]
/* 000E94 04001F14 EAF71C05 */  sdv         $v23[8], 0x28($23)
/* 000E98 04001F18 4B056E4F */  vmadh       $v25, $v13, $v5[0]
/* 000E9C 04001F1C EAF81C07 */  sdv         $v24[8], 0x38($23)
/* 000EA0 04001F20 22F70040 */  addi        $23, $23, 0x40
/* 000EA4 04001F24 EAF91C7C */  sdv         $v25[8], 0x3E0($23)
/* 000EA8 04001F28 EAFA1C7E */  sdv         $v26[8], 0x3F0($23)
.L04001F2C:
/* 000EAC 04001F2C 18E0001A */  blez        $7, .L04001F98
/* 000EB0 04001F30 4B9E7386 */   vmudn      $v14, $v14, $v30[4]
/* 000EB4 04001F34 4B9E6B4F */  vmadh       $v13, $v13, $v30[4]
/* 000EB8 04001F38 4B1FFB8E */  vmadn       $v14, $v31, $v31[0]
/* 000EBC 04001F3C 4B9E8406 */  vmudn       $v16, $v16, $v30[4]
/* 000EC0 04001F40 4B9E7BCF */  vmadh       $v15, $v15, $v30[4]
/* 000EC4 04001F44 4B1FFC0E */  vmadn       $v16, $v31, $v31[0]
.L04001F48:
/* 000EC8 04001F48 EAED0F04 */  ssv         $v13[14], 0x8($23)
/* 000ECC 04001F4C 4B9E5286 */  vmudn       $v10, $v10, $v30[4]
/* 000ED0 04001F50 EAEE0F05 */  ssv         $v14[14], 0xA($23)
/* 000ED4 04001F54 4B9E4A4F */  vmadh       $v9, $v9, $v30[4]
/* 000ED8 04001F58 4B1FFA8E */  vmadn       $v10, $v31, $v31[0]
/* 000EDC 04001F5C 4B9E6306 */  vmudn       $v12, $v12, $v30[4]
/* 000EE0 04001F60 4B9E5ACF */  vmadh       $v11, $v11, $v30[4]
/* 000EE4 04001F64 4B1FFB0E */  vmadn       $v12, $v31, $v31[0]
/* 000EE8 04001F68 EAE90F02 */  ssv         $v9[14], 0x4($23)
/* 000EEC 04001F6C 4B227704 */  vmudl       $v28, $v14, $v2[1]
/* 000EF0 04001F70 EAEA0F03 */  ssv         $v10[14], 0x6($23)
/* 000EF4 04001F74 4B22698D */  vmadm       $v6, $v13, $v2[1]
/* 000EF8 04001F78 EAEB0F06 */  ssv         $v11[14], 0xC($23)
/* 000EFC 04001F7C 4B1FFF0E */  vmadn       $v28, $v31, $v31[0]
/* 000F00 04001F80 EAEC0F07 */  ssv         $v12[14], 0xE($23)
/* 000F04 04001F84 4A1C8495 */  vsubc       $v18, $v16, $v28
/* 000F08 04001F88 4A067C51 */  vsub        $v17, $v15, $v6
/* 000F0C 04001F8C 22F70010 */  addi        $23, $23, 0x10
/* 000F10 04001F90 EAF10F78 */  ssv         $v17[14], 0xF0($23)
/* 000F14 04001F94 EAF20F79 */  ssv         $v18[14], 0xF2($23)
.L04001F98:
/* 000F18 04001F98 0D00045A */  jal         func_04001168
/* 000F1C 04001F9C 231F0000 */   addi       $ra, $24, 0x0
.L04001FA0:
/* 000F20 04001FA0 201F0000 */  addi        $ra, $zero, 0x0
.L04001FA4:
/* 000F24 04001FA4 03000008 */  jr          $24
/* 000F28 04001FA8 00000000 */   nop
/* 000F2C 04001FAC 00000000 */  nop
Overlay0End:

// Overlay 1
.headersize 0x04001000 - orga()
.definelabel Overlay1LoadStart, orga()
// reciprocal method, see RSP Programmers Guide page 79
// $v29[3]=s_int, $v28[3]=s_frac, $v29[7]=t_int, $v28[7]=t_frac
// out: $v27[3,7]=s,t int, $v26[3,7]=s,t frac
Overlay1Address:
/* 000F30 04001000 4B7D5EF2 */  vrcph       $v27[3], $v29[3]
/* 000F34 04001004 4B7C5EB1 */  vrcpl       $v26[3], $v28[3]
/* 000F38 04001008 4BFD5EF2 */  vrcph       $v27[3], $v29[7]
/* 000F3C 0400100C 4BFC7EB1 */  vrcpl       $v26[7], $v28[7]
/* 000F40 04001010 4B1F7EF2 */  vrcph       $v27[7], $v31[0]
/* 000F44 04001014 4B5FD686 */  vmudn       $v26, $v26, $v31[2]
/* 000F48 04001018 4B5FDECF */  vmadh       $v27, $v27, $v31[2]
/* 000F4C 0400101C 4B1FFE8E */  vmadn       $v26, $v31, $v31[0]
/* 000F50 04001020 C8172006 */  lqv         $v23[0], 0x60($zero)
/* 000F54 04001024 4A1FFDAC */  vxor        $v22, $v31, $v31
/* 000F58 04001028 4A1CD604 */  vmudl       $v24, $v26, $v28
/* 000F5C 0400102C 4A1CDE0D */  vmadm       $v24, $v27, $v28
/* 000F60 04001030 4A1DD60E */  vmadn       $v24, $v26, $v29
/* 000F64 04001034 4A1DDE4F */  vmadh       $v25, $v27, $v29
/* 000F68 04001038 4A18B615 */  vsubc       $v24, $v22, $v24
/* 000F6C 0400103C 4A19BE51 */  vsub        $v25, $v23, $v25
/* 000F70 04001040 4A18D584 */  vmudl       $v22, $v26, $v24
/* 000F74 04001044 4A18DDCD */  vmadm       $v23, $v27, $v24
/* 000F78 04001048 4A19D68E */  vmadn       $v26, $v26, $v25
/* 000F7C 0400104C 4A19DECF */  vmadh       $v27, $v27, $v25
/* 000F80 04001050 03E00008 */  jr          $ra
/* 000F84 04001054 00000000 */   nop
wait_for_dma_and_run_next_command:
/* 000F88 04001058 0D00044B */  jal         while_wait_dma_busy
/* 000F8C 0400105C 201B09A0 */   li         inputBufferPos, inputBuffer         // init inputBufferPos
/* 000F90 04001060 8F790000 */  lw          cmd_w0, 0x0(inputBufferPos)         // load first word of command
.L04001064:
/* 000F94 04001064 8F780004 */  lw          cmd_w1_dram, 0x4(inputBufferPos)    // load second word of command
/* 000F98 04001068 00190F42 */  srl         $1, cmd_w0, 29                      // get 3 first bits
/* 000F9C 0400106C 30210006 */  andi        $1, $1, 0x6                         // mask out 3rd bit
/* 000FA0 04001070 237B0008 */  addi        inputBufferPos, inputBufferPos, 0x8 // next command
/* 000FA4 04001074 1C200006 */  bgtz        $1, dispatch_task
/* 000FA8 04001078 333203FF */   andi       $18, cmd_w0, 0x3FF
/* 000FAC 0400107C 20160AE0 */  li          $22, 0xAE0
/* 000FB0 04001080 0D000443 */  jal         segmented_to_physical
/* 000FB4 04001084 03009820 */   add        dmaLoad, cmd_w1_dram, $zero
Overlay1End:

// Overlay 2
// .headersize ovl23_start - orga()
.headersize 0x040017a8 - orga()
Overlay2Address:
/* 000FB8 040017a8 10000006 */  b           .L040017C4
/* 000FBC 040017aC A41F0158 */   sh         $ra, 0x158($zero)
.L040017B0:
/* 000FC0 040017B0 00000000 */  nop
/* 000FC4 040017B4 00000000 */  nop
/* 000FC8 040017B8 341E0018 */  ori         ovlTableEntry, $zero, overlayInfo3
/* 000FCC 040017BC 1000FE4C */  b           load_overlay
/* 000FD0 040017C0 841500A0 */   lh         $21, D_0X00AO($zero)
.L040017C4:
/* 000FD4 040017C4 A4030C40 */  sh          $3, 0xC40($zero)
/* 000FD8 040017C8 A4020C42 */  sh          $2, 0xC42($zero)
/* 000FDC 040017CC A4010C44 */  sh          $1, 0xC44($zero)
/* 000FE0 040017D0 A4000C46 */  sh          $zero, 0xC46($zero)
/* 000FE4 040017D4 34070DB8 */  ori         $7, $zero, 0xDB8
/* 000FE8 040017D8 341E0C40 */  ori         $30, $zero, 0xC40
/* 000FEC 040017DC 3406000C */  ori         $6, $zero, 0xC
/* 000FF0 040017E0 03DE2825 */  or          $5, $30, $30
/* 000FF4 040017E4 3BDE0014 */  xori        $30, $30, 0x14
.L040017E8:
/* 000FF8 040017E8 10C0006A */  beqz        $6, .L04001994
/* 000FFC 040017EC 84CB00A6 */   lh         $11, 0xA6($6)
/* 001000 040017F0 20C6FFFE */  addi        $6, $6, -0x2
/* 001004 040017F4 34110000 */  ori         $17, $zero, 0x0
/* 001008 040017F8 00009025 */  or          $18, $zero, $zero
/* 00100C 040017FC 34A20000 */  ori         $2, $5, 0x0
/* 001010 04001800 09000605 */  j           .L04001814
/* 001014 04001804 23CE0002 */   addi       $14, $30, 0x2
.L04001808:
/* 001018 04001808 010B4024 */  and         $8, $8, $11
/* 00101C 0400180C 1112000D */  beq         $8, $18, .L04001844
/* 001020 04001810 20420002 */   addi       $2, $2, 0x2
/* 001024 04001814 0140A025 */  or          $20, $10, $zero
/* 001028 04001818 A5CA0000 */  sh          $10, 0x0($14)
/* 00102C 0400181C 21CE0002 */  addi        $14, $14, 0x2
.L04001820:
/* 001030 04001820 844A0000 */  lh          $10, 0x0($2)
/* 001034 04001824 1540FFF8 */  bnez        $10, .L04001808
/* 001038 04001828 85480024 */   lh         $8, 0x24($10)
/* 00103C 0400182C 2228FFFE */  addi        $8, $17, -0x2
/* 001040 04001830 1D00FFFB */  bgtz        $8, .L04001820
/* 001044 04001834 34A20000 */   move       $2, $5
/* 001048 04001838 1100FFEB */  beqz        $8, .L040017E8
/* 00104C 0400183C 00000000 */   nop
/* 001050 04001840 03000008 */  jr          $24
/* 001054 04001844 024B9026 */   xor        $18, $18, $11
/* 001058 04001848 862800F6 */  lh          $8, 0xF6($17)
/* 00105C 0400184C 22310002 */  addi        $17, $17, 0x2
/* 001060 04001850 01000008 */  jr          $8
/* 001064 04001854 84080102 */   lh         $8, 0x102($zero)
/* 001068 04001858 488A6800 */  mtc2        $10, $v13[0]
/* 00106C 0400185C 02805025 */  or          $10, $20, $zero
/* 001070 04001860 48146800 */  mfc2        $20, $v13[0]
/* 001074 04001864 37CE0000 */  move        $14, $30
/* 001078 04001868 840800F8 */  lh          $8, 0xF8($zero)
/* 00107C 0400186C A4080106 */  sh          $8, 0x106($zero)
/* 001080 04001870 20E70028 */  addi        $7, $7, 0x28
/* 001084 04001874 A5C70000 */  sh          $7, 0x0($14)
/* 001088 04001878 A5C00002 */  sh          $zero, 0x2($14)
/* 00108C 0400187C C9491800 */  ldv         $v9[0], 0x0($10)
/* 001090 04001880 C94A1801 */  ldv         $v10[0], 0x8($10)
/* 001094 04001884 CA841800 */  ldv         $v4[0], 0x0($20)
/* 001098 04001888 CA851801 */  ldv         $v5[0], 0x8($20)
/* 00109C 0400188C 00064080 */  sll         $8, $6, 2
/* 0010A0 04001890 C901180E */  ldv         $v1[0], 0x70($8)
/* 0010A4 04001894 4B7F0807 */  vmudh       $v0, $v1, $v31[3]
/* 0010A8 04001898 4A012B06 */  vmudn       $v12, $v5, $v1
/* 0010AC 0400189C 4A0122CF */  vmadh       $v11, $v4, $v1
/* 0010B0 040018A0 4B1FFB0E */  vmadn       $v12, $v31, $v31[0]
/* 0010B4 040018A4 4A00570E */  vmadn       $v28, $v10, $v0
/* 0010B8 040018A8 4A004F4F */  vmadh       $v29, $v9, $v0
/* 0010BC 040018AC 4B1FFF0E */  vmadn       $v28, $v31, $v31[0]
/* 0010C0 040018B0 4A5CE694 */  vaddc       $v26, $v28, $v28[0q]
/* 0010C4 040018B4 4A5DEED0 */  vadd        $v27, $v29, $v29[0q]
/* 0010C8 040018B8 4ABAD714 */  vaddc       $v28, $v26, $v26[1h]
/* 0010CC 040018BC 4ABBDF50 */  vadd        $v29, $v27, $v27[1h]
/* 0010D0 040018C0 4808EB00 */  mfc2        $8, $v29[6]
/* 0010D4 040018C4 4B7D59F2 */  vrcph       $v7[3], $v29[3]
/* 0010D8 040018C8 4B7C58F1 */  vrcpl       $v3[3], $v28[3]
/* 0010DC 040018CC 4B1F59F2 */  vrcph       $v7[3], $v31[0]
/* 0010E0 040018D0 4B5F18C6 */  vmudn       $v3, $v3, $v31[2]
/* 0010E4 040018D4 05010003 */  bgez        $8, .L040018E4
/* 0010E8 040018D8 4B5F39CF */   vmadh      $v7, $v7, $v31[2]
/* 0010EC 040018DC 4B7F18C6 */  vmudn       $v3, $v3, $v31[3]
/* 0010F0 040018E0 4B7F39CF */  vmadh       $v7, $v7, $v31[3]
.L040018E4:
/* 0010F4 040018E4 4B1F39E1 */  veq         $v7, $v7, $v31[0]
/* 0010F8 040018E8 4B7F18E7 */  vmrg        $v3, $v3, $v31[3]
/* 0010FC 040018EC 4B63E704 */  vmudl       $v28, $v28, $v3[3]
/* 001100 040018F0 4B63EF4D */  vmadm       $v29, $v29, $v3[3]
/* 001104 040018F4 0D000400 */  jal         Overlay1Address
/* 001108 040018F8 4B1FFF0E */   vmadn      $v28, $v31, $v31[0]
/* 00110C 040018FC 4A4C6714 */  vaddc       $v28, $v12, $v12[0q]
/* 001110 04001900 4A4B5F50 */  vadd        $v29, $v11, $v11[0q]
/* 001114 04001904 4ABCE314 */  vaddc       $v12, $v28, $v28[1h]
/* 001118 04001908 4ABDEAD0 */  vadd        $v11, $v29, $v29[1h]
/* 00111C 0400190C 4A1A63C4 */  vmudl       $v15, $v12, $v26
/* 001120 04001910 4A1A5BCD */  vmadm       $v15, $v11, $v26
/* 001124 04001914 4A1B63CE */  vmadn       $v15, $v12, $v27
/* 001128 04001918 4A1B5A0F */  vmadh       $v8, $v11, $v27
/* 00112C 0400191C 4BBFFF04 */  vmudl       $v28, $v31, $v31[5]
/* 001130 04001920 4B637BCC */  vmadl       $v15, $v15, $v3[3]
/* 001134 04001924 4B63420D */  vmadm       $v8, $v8, $v3[3]
/* 001138 04001928 4B1FFBCE */  vmadn       $v15, $v31, $v31[0]
/* 00113C 0400192C 4B1F4221 */  veq         $v8, $v8, $v31[0]
/* 001140 04001930 4B7F7BE7 */  vmrg        $v15, $v15, $v31[3]
/* 001144 04001934 4B1F7BE2 */  vne         $v15, $v15, $v31[0]
/* 001148 04001938 4B3F7BE7 */  vmrg        $v15, $v15, $v31[1]
/* 00114C 0400193C 4B1F7A2D */  vnxor       $v8, $v15, $v31[0]
/* 001150 04001940 4B3F4214 */  vaddc       $v8, $v8, $v31[1]
/* 001154 04001944 4A1DEF50 */  vadd        $v29, $v29, $v29
/* 001158 04001948 4AE82F04 */  vmudl       $v28, $v5, $v8[3h]
/* 00115C 0400194C 4AE8274D */  vmadm       $v29, $v4, $v8[3h]
/* 001160 04001950 4AEF570C */  vmadl       $v28, $v10, $v15[3h]
/* 001164 04001954 4AEF4F4D */  vmadm       $v29, $v9, $v15[3h]
/* 001168 04001958 4B1FFF0E */  vmadn       $v28, $v31, $v31[0]
/* 00116C 0400195C C94C3802 */  luv         $v12[0], 0x10($10)
/* 001170 04001960 CA8B3802 */  luv         $v11[0], 0x10($20)
/* 001174 04001964 C94C1405 */  llv         $v12[8], 0x14($10)
/* 001178 04001968 CA8B1405 */  llv         $v11[8], 0x14($20)
/* 00117C 0400196C 4B6F6485 */  vmudm       $v18, $v12, $v15[3]
/* 001180 04001970 4B685C8D */  vmadm       $v18, $v11, $v8[3]
/* 001184 04001974 E8F23800 */  suv         $v18[0], 0x0($7)
/* 001188 04001978 E8F21C01 */  sdv         $v18[8], 0x8($7)
/* 00118C 0400197C C8F21801 */  ldv         $v18[0], 0x8($7)
.L04001980:
/* 001190 04001980 0D0005BA */  jal         func_040016E8
/* 001194 04001984 8CEF0000 */   lw         $15, 0x0($7)
/* 001198 04001988 480A6800 */  mfc2        $10, $v13[0]
/* 00119C 0400198C 09000527 */  j           .L0400149C
/* 0011A0 04001990 34090001 */   ori        $9, $zero, 0x1
.L04001994:
/* 0011A4 04001994 84A80000 */  lh          $8, 0x0($5)
/* 0011A8 04001998 A4050106 */  sh          $5, 0x106($zero)
/* 0011AC 0400199C 231E0000 */  addi        $30, $24, 0x0
/* 0011B0 040019A0 841800FE */  lh          $24, 0xFE($zero)
/* 0011B4 040019A4 A40800B4 */  sh          $8, 0xB4($zero)
/* 0011B8 040019A8 84080106 */  lh          $8, 0x106($zero)
/* 0011BC 040019AC 840300B4 */  lh          $3, 0xB4($zero)
/* 0011C0 040019B0 85020002 */  lh          $2, 0x2($8)
/* 0011C4 040019B4 85010004 */  lh          $1, 0x4($8)
/* 0011C8 040019B8 21080002 */  addi        $8, $8, 0x2
/* 0011CC 040019BC 1420000D */  bnez        $1, func_040019F4
/* 0011D0 040019C0 A4080106 */   sh         $8, 0x106($zero)
/* 0011D4 040019C4 03C0F809 */  jalr        $30
Overlay2End:
// Overlay 3
.headersize 0x040017a8 - orga()
Overlay3Address:
/* 0011D8 040017A8 341E0010 */   ori        ovlTableEntry, $zero, overlayInfo2
/* 0011DC 040017AC 1000FE50 */  b           load_overlay
/* 0011E0 040017B0 84150100 */   lh         $21, D_0x0100($zero)
/* 0011E4 040017B4 8C01012C */  lw          $1, 0x12C($zero)
/* 0011E8 040017B8 ACEF0000 */  sw          $15, 0x0($7)
/* 0011EC 040017BC ACF00004 */  sw          $16, 0x4($7)
/* 0011F0 040017C0 04200022 */  bltz        $1, .L0400184C
/* 0011F4 040017C4 C8E43000 */   lpv        $v4[0], 0x0($7)
/* 0011F8 040017C8 C827383A */  luv         $v7[0], 0x1D0($1)
/* 0011FC 040017CC 4A1BDEEC */  vxor        $v27, $v27, $v27
.L040017D0:
/* 001200 040017D0 4B1F39E3 */  vge         $v7, $v7, $v31[0]
.L040017D4:
/* 001204 040017D4 C8253038 */  lpv         $v5[0], 0x1C0($1)
/* 001208 040017D8 4A07DED0 */  vadd        $v27, $v27, $v7
/* 00120C 040017DC C8273836 */  luv         $v7[0], 0x1B0($1)
/* 001210 040017E0 4B1F352A */  vor         $v20, $v6, $v31[0]
/* 001214 040017E4 4A052180 */  vmulf       $v6, $v4, $v5
/* 001218 040017E8 4A6630D0 */  vadd        $v3, $v6, $v6[1q]
/* 00121C 040017EC 4AC61990 */  vadd        $v6, $v3, $v6[2h]
/* 001220 040017F0 4A8639C0 */  vmulf       $v7, $v7, $v6[0h]
/* 001224 040017F4 1C20FFF6 */  bgtz        $1, .L040017D0
/* 001228 040017F8 2021FFE0 */   addi       $1, $1, -0x20
/* 00122C 040017FC E8FB3800 */  suv         $v27[0], 0x0($7)
/* 001230 04001800 30680004 */  andi        $8, $3, 0x4
/* 001234 04001804 A0EF0003 */  sb          $15, 0x3($7)
/* 001238 04001808 A0F00007 */  sb          $16, 0x7($7)
/* 00123C 0400180C 8CEF0000 */  lw          $15, 0x0($7)
/* 001240 04001810 1100FF21 */  beqz        $8, .L04001498
/* 001244 04001814 8CF00004 */   lw         $16, 0x4($7)
/* 001248 04001818 30680008 */  andi        $8, $3, 0x8
/* 00124C 0400181C CBA73012 */  lpv         $v7[0], 0x90($29)
/* 001250 04001820 C8061814 */  ldv         $v6[0], 0xA0($zero)
/* 001254 04001824 4A943D0E */  vmadn       $v20, $v7, $v20[0h]
/* 001258 04001828 11000006 */  beqz        $8, .L04001844
/* 00125C 0400182C 4B1FFC8D */   vmadm      $v18, $v31, $v31[0]
/* 001260 04001830 4A1291C0 */  vmulf       $v7, $v18, $v18
/* 001264 04001834 4A1239C0 */  vmulf       $v7, $v7, $v18
/* 001268 04001838 4B263D00 */  vmulf       $v20, $v7, $v6[1]
/* 00126C 0400183C 4B663D08 */  vmacf       $v20, $v7, $v6[3]
/* 001270 04001840 4B469488 */  vmacf       $v18, $v18, $v6[2]
.L04001844:
/* 001274 04001844 09000526 */  j           .L04001498
/* 001278 04001848 4B9F9490 */   vadd       $v18, $v18, $v31[4]
.L0400184C:
/* 00127C 0400184C 30210FFF */  andi        $1, $1, 0xFFF
/* 001280 04001850 AC01012C */  sw          $1, 0x12C($zero)
/* 001284 04001854 0D0005C9 */  jal         func_04001724
/* 001288 04001858 200803E0 */   li         $8, 0x3E0
/* 00128C 0400185C 34080DE0 */  ori         $8, $zero, 0xDE0
/* 001290 04001860 E9085901 */  stv         $v8[2], 0x10($8)
/* 001294 04001864 E9085A02 */  stv         $v8[4], 0x20($8)
/* 001298 04001868 E9085E03 */  stv         $v8[12], 0x30($8)
/* 00129C 0400186C E9085F04 */  stv         $v8[14], 0x40($8)
/* 0012A0 04001870 C9085F01 */  ltv         $v8[14], 0x10($8)
/* 0012A4 04001874 C9085E02 */  ltv         $v8[12], 0x20($8)
/* 0012A8 04001878 C9085A03 */  ltv         $v8[4], 0x30($8)
/* 0012AC 0400187C C9085904 */  ltv         $v8[2], 0x40($8)
/* 0012B0 04001880 E90C1C02 */  sdv         $v12[8], 0x10($8)
/* 0012B4 04001884 E90D1C04 */  sdv         $v13[8], 0x20($8)
/* 0012B8 04001888 E90E1C06 */  sdv         $v14[8], 0x30($8)
/* 0012BC 0400188C C90C1802 */  ldv         $v12[0], 0x10($8)
/* 0012C0 04001890 C90D1804 */  ldv         $v13[0], 0x20($8)
/* 0012C4 04001894 C90E1806 */  ldv         $v14[0], 0x30($8)
.L04001898:
/* 0012C8 04001898 C8253037 */  lpv         $v5[0], 0x1B8($1)
/* 0012CC 0400189C 4B9F2940 */  vmulf       $v5, $v5, $v31[4]
/* 0012D0 040018A0 4A856186 */  vmudn       $v6, $v12, $v5[0h]
/* 0012D4 040018A4 4AA5698E */  vmadn       $v6, $v13, $v5[1h]
/* 0012D8 040018A8 4AC5718E */  vmadn       $v6, $v14, $v5[2h]
/* 0012DC 040018AC 4B1FF8CD */  vmadm       $v3, $v31, $v31[0]
/* 0012E0 040018B0 4B5F1985 */  vmudm       $v6, $v3, $v31[2]
/* 0012E4 040018B4 4A8540C8 */  vmacf       $v3, $v8, $v5[0h]
/* 0012E8 040018B8 4AA548C8 */  vmacf       $v3, $v9, $v5[1h]
/* 0012EC 040018BC 4AC550C8 */  vmacf       $v3, $v10, $v5[2h]
/* 0012F0 040018C0 4B1FF98E */  vmadn       $v6, $v31, $v31[0]
/* 0012F4 040018C4 4A063144 */  vmudl       $v5, $v6, $v6
/* 0012F8 040018C8 4A06194D */  vmadm       $v5, $v3, $v6
/* 0012FC 040018CC 4A03314E */  vmadn       $v5, $v6, $v3
/* 001300 040018D0 4A031E8F */  vmadh       $v26, $v3, $v3
/* 001304 040018D4 4A6529D4 */  vaddc       $v7, $v5, $v5[1q]
/* 001308 040018D8 4A7AD110 */  vadd        $v4, $v26, $v26[1q]
/* 00130C 040018DC 4A8729D4 */  vaddc       $v7, $v5, $v7[0h]
/* 001310 040018E0 4A84D110 */  vadd        $v4, $v26, $v4[0h]
/* 001314 040018E4 4B4442F6 */  vrsqh       $v11[0], $v4[2]
/* 001318 040018E8 4B4743F5 */  vrsql       $v15[0], $v7[2]
/* 00131C 040018EC 4B1F42F6 */  vrsqh       $v11[0], $v31[0]
/* 001320 040018F0 4B7E7BC4 */  vmudl       $v15, $v15, $v30[3]
/* 001324 040018F4 4B7E5ACD */  vmadm       $v11, $v11, $v30[3]
/* 001328 040018F8 4B1FFBCE */  vmadn       $v15, $v31, $v31[0]
/* 00132C 040018FC 4B0F31C4 */  vmudl       $v7, $v6, $v15[0]
/* 001330 04001900 4B0F19CD */  vmadm       $v7, $v3, $v15[0]
/* 001334 04001904 4B0B31CE */  vmadn       $v7, $v6, $v11[0]
/* 001338 04001908 4B0B190F */  vmadh       $v4, $v3, $v11[0]
/* 00133C 0400190C 4B1FF9CE */  vmadn       $v7, $v31, $v31[0]
/* 001340 04001910 CBA2181F */  ldv         $v2[0], 0xF8($29)
/* 001344 04001914 4B0239E3 */  vge         $v7, $v7, $v2[0]
/* 001348 04001918 4B2239E0 */  vlt         $v7, $v7, $v2[1]
/* 00134C 0400191C 4B4239C6 */  vmudn       $v7, $v7, $v2[2]
/* 001350 04001920 E8273038 */  spv         $v7[0], 0x1C0($1)
/* 001354 04001924 8C2801C0 */  lw          $8, 0x1C0($1)
/* 001358 04001928 AC2801C4 */  sw          $8, 0x1C4($1)
/* 00135C 0400192C 1C20FFDA */  bgtz        $1, .L04001898
/* 001360 04001930 2021FFE0 */   addi       $1, $1, -0x20
/* 001364 04001934 090005C4 */  j           func_04001710
/* 001368 04001938 841F00A0 */   lh         $ra, D_0X00AO($zero)
/* 00136C 0400193C 00000000 */  nop
Overlay3End:

// Overlay 4
.headersize 0x040017a8 - orga()
Overlay4Address:
/* 001370 040017A8 090005F2 */  j           .L040017C8
/* 001374 040017AC 00000000 */   nop
/* 001378 040017B0 00000000 */  nop
/* 00137C 040017B4 0D00044B */  jal         while_wait_dma_busy
/* 001380 040017B8 34024000 */   ori        $2, $zero, SP_STATUS_SIG7
/* 001384 040017BC 40822000 */  mtc0        $2, SP_STATUS
/* 001388 040017C0 0000000D */  break       0
/* 00138C 040017C4 00000000 */  nop
/* 001390 040017C8 34021000 */  ori         $2, $zero, 0x1000
/* 001394 040017CC AC1C0BE4 */  sw          $28, 0xBE4($zero)
/* 001398 040017D0 AC1B0BE8 */  sw          $27, 0xBE8($zero)
/* 00139C 040017D4 AC1A0BEC */  sw          $26, 0xBEC($zero)
/* 0013A0 040017D8 AC170BF0 */  sw          $23, 0xBF0($zero)
/* 0013A4 040017DC 8C130108 */  lw          dmaLoad, 0x108($zero)
/* 0013A8 040017E0 34140000 */  ori         dmemAddr, $zero, 0x0
/* 0013AC 040017E4 34120BFF */  ori         dmaLen, $zero, 0xBFF
/* 0013B0 040017E8 0D000450 */  jal         dma_read_write
/* 0013B4 040017EC 34110001 */   ori        $17, $zero, 0x1
/* 0013B8 040017F0 0D00044B */  jal         while_wait_dma_busy
/* 0013BC 040017F4 00000000 */   nop
/* 0013C0 040017F8 0900042F */  j           .L040010BC
/* 0013C4 040017FC 40822000 */   mtc0       $2, SP_STATUS
/* 0013C8 04001800 00000000 */  nop
/* 0013CC 04001804 00000000 */  nop
/* 0013D0 04001808 2400BEEF */  addiu       $zero, $zero, -0x4111
/* 0013D4 0400180C 00000000 */  nop
Overlay4End:
/* 0013D8 04002458 00000000 */  nop
/* 0013DC 0400245C 00000000 */  nop

.close // CODE_FILE
