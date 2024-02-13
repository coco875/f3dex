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

/*
There are two different memory spaces for the overlays: (a) IMEM and (b) the
microcode file (which, plus an offset, is also the location in DRAM).

A label marks both an IMEM addresses and a file address, but evaluating the
label in an integer context (e.g. in a branch) gives the IMEM address.
`orga(your_label)` gets the file address of the label, and `.orga` sets the
file address.
`.headersize`, as well as the value after `.create`, sets the difference
between IMEM addresses and file addresses, so you can set the IMEM address
with `.headersize desired_imem_addr - orga()`.

In IMEM, the whole microcode is organized as (each row is the same address):

0x80 space             |                |
for boot code       Overlay 0       Overlay 1
                      (End          (More cmd 
start                 task)         handlers)
(initialization)       |                |

Many command
handlers

Overlay 2           Overlay 3
(Lighting)          (Clipping)

Vertex and
tri handlers

DMA code

In the file, the microcode is organized as:
start (file addr 0x0 = IMEM 0x1080)
Many command handlers
Overlay 3
Vertex and tri handlers
DMA code (end of this = IMEM 0x2000 = file 0xF80)
Overlay 0
Overlay 1
Overlay 2
*/

// Overlay table data member offsets
overlay_load equ 0x0000
overlay_len  equ 0x0004
overlay_imem equ 0x0006

.macro OverlayEntry, loadStart, loadEnd, imemAddr
  .dw loadStart
  .dh (loadEnd - loadStart - 1) & 0xFFFF
  .dh (imemAddr) & 0xFFFF
.endmacro

.macro jumpTableEntry, addr
  .dh addr & 0xFFFF
.endmacro