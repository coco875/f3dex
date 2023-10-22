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
j 0x00001080
.close // CODE_FILE
