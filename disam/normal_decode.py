from extract_arg import extract_rs, extract_rt, extract_immediate, extract_target, extract_opcode

decode_function = {}

ADDI = 0b001000
def decode_addi(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"addi ${rt}, ${rs}, {imm}"
decode_function[ADDI] = decode_addi

ADDIU = 0b001001
def decode_addiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"addiu ${rt}, ${rs}, {imm}"
decode_function[ADDIU] = decode_addiu

ANDI = 0b001100
def decode_andi(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"andi ${rt}, ${rs}, {imm}"
decode_function[ANDI] = decode_andi

BEQ = 0b000100
def decode_beq(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"beq ${rs}, ${rt}, {hex(imm)}"
decode_function[BEQ] = decode_beq

BEQL = 0b010100
def decode_beql(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"beql ${rs}, ${rt}, {hex(imm)}"
decode_function[BEQL] = decode_beql

BGTZ = 0b000111
def decode_bgtz(asm_instruction):
    rs = extract_rs(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"bgtz ${rs}, {hex(imm)}"
decode_function[BGTZ] = decode_bgtz

BGTZL = 0b010111
def decode_bgtzl(asm_instruction):
    rs = extract_rs(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"bgtzl ${rs}, {hex(imm)}"
decode_function[BGTZL] = decode_bgtzl

BLEZ = 0b000110
def decode_blez(asm_instruction):
    rs = extract_rs(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"blez ${rs}, {hex(imm)}"
decode_function[BLEZ] = decode_blez

BLEZL = 0b010110
def decode_blezl(asm_instruction):
    rs = extract_rs(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"blezl ${rs}, {hex(imm)}"
decode_function[BLEZL] = decode_blezl

BNE = 0b000101
def decode_bne(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"bne ${rs}, ${rt}, {hex(imm)}"
decode_function[BNE] = decode_bne

BNEL = 0b010101
def decode_bnel(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"bnel ${rs}, ${rt}, {hex(imm)}"
decode_function[BNEL] = decode_bnel

CACHE = 0b101111
def decode_cache(asm_instruction):
    base = extract_rs(asm_instruction)
    op = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"cache {op}, {offset}(${base})"
decode_function[CACHE] = decode_cache

DADDI = 0b011000
def decode_daddi(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"daddi ${rs}, ${rt}, {imm}"
decode_function[DADDI] = decode_daddi

DADDIU = 0b011001
def decode_daddiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"daddiu ${rs}, ${rt}, {imm}"
decode_function[DADDIU] = decode_daddiu

J = 0b000010
def decode_j(asm_instruction):
    target = extract_target(asm_instruction)
    return f"j {hex(target)}"
decode_function[J] = decode_j

JAL = 0b000011
def decode_jal(asm_instruction):
    target = extract_target(asm_instruction)
    return f"jal {hex(target)}"
decode_function[JAL] = decode_jal

LB = 0b100000
def decode_lb(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lb ${rt}, {offset}(${base})"
decode_function[LB] = decode_lb

LBU = 0b100100
def decode_lbu(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lbu ${rt}, {offset}(${base})"
decode_function[LBU] = decode_lbu

LD = 0b110111
def decode_ld(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"ld ${rt}, {offset}(${base})"
decode_function[LD] = decode_ld

LDCz = 0b1101
def decode_ldc(asm_instruction):
    z = extract_opcode(asm_instruction) & 0b11
    base = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"ldc{z} ${base}, {offset}"

LDL = 0b011010
def decode_ldl(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"ldl ${rt}, {offset}(${base})"
decode_function[LDL] = decode_ldl

LDR = 0b011011
def decode_ldr(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"ldr ${rt}, {offset}(${base})"
decode_function[LDR] = decode_ldr

LH = 0b100001
def decode_lh(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lh ${rt}, {offset}(${base})"
decode_function[LH] = decode_lh

LHU = 0b100101
def decode_lhu(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lhu ${rt}, {offset}(${base})"
decode_function[LHU] = decode_lhu

LL = 0b110000
def decode_ll(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"ll ${rt}, {offset}(${base})"
decode_function[LL] = decode_ll

LLD = 0b110100
def decode_lld(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lld ${rt}, {offset}(${base})"
decode_function[LLD] = decode_lld

LUI = 0b001111
def decode_lui(asm_instruction):
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"lui ${rt}, {imm}"
decode_function[LUI] = decode_lui

LW = 0b100011
def decode_lw(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lw ${rt}, {offset}(${base})"
decode_function[LW] = decode_lw

LWCz = 0b1100
def decode_lwc(asm_instruction):
    z = extract_opcode(asm_instruction) & 0b11
    base = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lwc{z} ${base}, {offset}"

LWL = 0b100010
def decode_lwl(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lwl ${rt}, {offset}(${base})"
decode_function[LWL] = decode_lwl

LWR = 0b100110
def decode_lwr(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lwr ${rt}, {offset}(${base})"
decode_function[LWR] = decode_lwr

LWU = 0b100111
def decode_lwu(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"lwu ${rt}, {offset}(${base})"
decode_function[LWU] = decode_lwu

ORI = 0b001101
def decode_ori(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"ori ${rt}, ${rs}, {imm}"
decode_function[ORI] = decode_ori

SB = 0b101000
def decode_sb(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sb ${rt}, {offset}(${base})"
decode_function[SB] = decode_sb

SC = 0b111000
def decode_sc(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sc ${rt}, {offset}(${base})"
decode_function[SC] = decode_sc

SCD = 0b111100
def decode_scd(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"scd ${rt}, {offset}(${base})"
decode_function[SCD] = decode_scd

SD = 0b111111
def decode_sd(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sd ${rt}, {offset}(${base})"
decode_function[SD] = decode_sd

SDCz = 0b1111
def decode_sdc(asm_instruction):
    z = extract_opcode(asm_instruction) & 0b11
    base = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sdc{z} ${base}, {offset}"

SDL = 0b101100
def decode_sdl(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sdl ${rt}, {offset}(${base})"
decode_function[SDL] = decode_sdl

SDR = 0b101101
def decode_sdr(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sdr ${rt}, {offset}(${base})"
decode_function[SDR] = decode_sdr

SH = 0b101001
def decode_sh(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sh ${rt}, {offset}(${base})"
decode_function[SH] = decode_sh

SLTI = 0b001010
def decode_slti(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"slti ${rt}, ${rs}, {imm}"
decode_function[SLTI] = decode_slti

SLTIU = 0b001011
def decode_sltiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"sltiu ${rt}, ${rs}, {imm}"

SW = 0b101011
def decode_sw(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"sw ${rt}, {offset}(${base})"
decode_function[SW] = decode_sw

SWCz = 0b1110
def decode_swc(asm_instruction):
    z = extract_opcode(asm_instruction) & 0b11
    base = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"swc{z} ${base}, {offset}"

SWL = 0b101010
def decode_swl(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"swl ${rt}, {offset}(${base})"
decode_function[SWL] = decode_swl

SWR = 0b101110
def decode_swr(asm_instruction):
    base = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    offset = extract_immediate(asm_instruction)
    return f"swr ${rt}, {offset}(${base})"
decode_function[SWR] = decode_swr

XORI = 0b001110
def decode_xori(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"xori ${rt}, ${rs}, {imm}"
decode_function[XORI] = decode_xori

def decode_normal(asm_instruction):
    opcode = extract_opcode(asm_instruction)
    if (opcode>>2) == LDCz:
        return decode_ldc(asm_instruction)
    if (opcode>>2) == LWCz:
        return decode_lwc(asm_instruction)
    if (opcode>>2) == SDCz:
        return decode_sdc(asm_instruction)
    if (opcode>>2) == SWCz:
        return decode_swc(asm_instruction)
    if opcode in decode_function:
        return decode_function[opcode](asm_instruction)
    print(bin(opcode))
    print("no normal found")
    return None