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