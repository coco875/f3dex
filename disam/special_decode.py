from extract_arg import extract_rs, extract_rt, extract_rd, special_function, extract_sa

SPECIAL = 0b000000

decode_function = {}

ADD = 0b100000
def decode_add(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"add ${rd}, ${rs}, ${rt}"
decode_function[ADD] = decode_add

ADDU = 0b100001
def decode_addu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"addu ${rd}, ${rs}, ${rt}"
decode_function[ADDU] = decode_addu

AND = 0b100100
def decode_and(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"and ${rd}, ${rs}, ${rt}"
decode_function[AND] = decode_and

BREAK = 0b001101
def decode_break(asm_instruction):
    return "break"
decode_function[BREAK] = decode_break

DADD = 0b101100
def decode_dadd(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dadd ${rd}, ${rs}, ${rt}"
decode_function[DADD] = decode_dadd

DADDU = 0b101101
def decode_daddu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"daddu ${rd}, ${rs}, ${rt}"
decode_function[DADDU] = decode_daddu

DDIV = 0b011110
def decode_ddiv(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"ddiv ${rs}, ${rt}"
decode_function[DDIV] = decode_ddiv

DDIVU = 0b011111
def decode_ddivu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"ddivu ${rs}, ${rt}"
decode_function[DDIVU] = decode_ddivu

DIV = 0b011010
def decode_div(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"div ${rs}, ${rt}"
decode_function[DIV] = decode_div

DIVU = 0b011011
def decode_divu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"div ${rs}, ${rt}"
decode_function[DIVU] = decode_divu

DMULT = 0b011100
def decode_dmult(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"dmult ${rs}, ${rt}"
decode_function[DMULT] = decode_dmult

DMULTU = 0b011101
def decode_dmultu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"dmult ${rs}, ${rt}"
decode_function[DMULTU] = decode_dmultu

DSLL = 0b111000
def decode_dsll(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsll ${rs}, ${rt}, {sa}"
decode_function[DSLL] = decode_dsll

DSLLV = 0b010100
def decode_dsllv(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dsllv ${rd}, ${rt}, ${rs}"
decode_function[DSLLV] = decode_dsllv

DSLL32 = 0b111100
def decode_dsll32(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsll32 ${rs}, ${rt}, {sa}"
decode_function[DSLL32] = decode_dsll32

DSRA = 0b111011
def decode_dsra(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsra ${rd}, ${rt}, {sa}"
decode_function[DSRA] = decode_dsra

DSRAV = 0b010111
def decode_dsrav(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dsrav ${rd}, ${rt}, ${rs}"
decode_function[DSRAV] = decode_dsrav

DSRA32 = 0b111111
def decode_dsra32(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsra32 ${rd}, ${rt}, {sa}"
decode_function[DSRA32] = decode_dsra32

DSRL = 0b111010
def decode_dsrl(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsrl ${rd}, ${rt}, {sa}"
decode_function[DSRL] = decode_dsrl

DSRLV = 0b010110
def decode_dsrlv(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dsrlv ${rd}, ${rt}, ${rs}"
decode_function[DSRLV] = decode_dsrlv

DSRL32 = 0b111110
def decode_dsrl32(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"dsrl32 ${rd}, ${rt}, {sa}"
decode_function[DSRL32] = decode_dsrl32

DSUB = 0b101110
def decode_dsub(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dsub ${rd}, ${rt}, ${rs}"
decode_function[DSUB] = decode_dsub

DSUBU = 0b101111
def decode_dsubu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dsubu ${rd}, ${rt}, ${rs}"
decode_function[DSUBU] = decode_dsubu

JALR = 0b001001
def decode_jalr(asm_instruction):
    rs = extract_rs(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"jalr ${rs}, ${rd}"
decode_function[JALR] = decode_jalr

JR = 0b001000
def decode_jr(asm_instruction):
    rs = extract_rs(asm_instruction)
    return f"jr ${rs}"
decode_function[JR] = decode_jr

MFHI = 0b010000
def decode_mfhi(asm_instruction):
    rd = extract_rd(asm_instruction)
    return f"mfhi ${rd}"
decode_function[MFHI] = decode_mfhi

MFLO = 0b010010
def decode_mflo(asm_instruction):
    rd = extract_rd(asm_instruction)
    return f"mflo ${rd}"
decode_function[MFLO] = decode_mflo

MTHI = 0b010001
def decode_mthi(asm_instruction):
    rs = extract_rs(asm_instruction)
    return f"mthi ${rs}"
decode_function[MTHI] = decode_mthi

MTLO = 0b010011
def decode_mtlo(asm_instruction):
    rs = extract_rs(asm_instruction)
    return f"mtlo ${rs}"
decode_function[MTLO] = decode_mtlo

MULT = 0b011000
def decode_mult(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"mult ${rs}, ${rt}"
decode_function[MULT] = decode_mult

MULTU = 0b011001
def decode_multu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"multu ${rs}, ${rt}"
decode_function[MULTU] = decode_multu

NOR = 0b100111
def decode_nor(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"nor ${rd}, ${rs}, ${rt}"
decode_function[NOR] = decode_nor

OR = 0b100101
def decode_or(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"or ${rd}, ${rs}, ${rt}"
decode_function[OR] = decode_or

SLL = 0b000000
def decode_sll(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"sll ${rd}, ${rt}, {sa}"
decode_function[SLL] = decode_sll

SLLV = 0b000100
def decode_sllv(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"sllv ${rd}, ${rt}, ${rs}"
decode_function[SLLV] = decode_sllv

SLT = 0b101010
def decode_slt(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"slt ${rd}, ${rs}, ${rt}"
decode_function[SLT] = decode_slt

SLTU = 0b101011
def decode_sltu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"sltu ${rd}, ${rs}, ${rt}"
decode_function[SLTU] = decode_sltu

SRA = 0b000011
def decode_sra(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"sra ${rd}, ${rt}, {sa}"
decode_function[SRA] = decode_sra

SRAV = 0b000111
def decode_srav(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"srav ${rd}, ${rt}, ${rs}"
decode_function[SRAV] = decode_srav

SRL = 0b000010
def decode_srl(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    sa = extract_sa(asm_instruction)
    return f"srl ${rd}, ${rt}, {sa}"
decode_function[SRL] = decode_srl

SRLV = 0b000110
def decode_srlv(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"srlv ${rd}, ${rt}, ${rs}"
decode_function[SRLV] = decode_srlv

SUB = 0b100010
def decode_sub(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"sub ${rd}, ${rs}, ${rt}"
decode_function[SUB] = decode_sub

SUBU = 0b100011
def decode_subu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"subu ${rd}, ${rs}, ${rt}"
decode_function[SUBU] = decode_subu

SYNC = 0b001111
def decode_sync(asm_instruction):
    return "sync"
decode_function[SYNC] = decode_sync

SYSCALL = 0b001100
def decode_syscall(asm_instruction):
    return "syscall"
decode_function[SYSCALL] = decode_syscall

TEQ = 0b110100
def decode_teq(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"teq ${rs}, ${rt}"
decode_function[TEQ] = decode_teq

TGE = 0b110000
def decode_tge(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"tge ${rs}, ${rt}"
decode_function[TGE] = decode_tge

TGEU = 0b110001
def decode_tgeu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"tgeu ${rs}, ${rt}"
decode_function[TGEU] = decode_tgeu

TLT = 0b110010
def decode_tlt(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"tlt ${rs}, ${rt}"
decode_function[TLT] = decode_tlt

TLTU = 0b110011
def decode_tltu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"tltu ${rs}, ${rt}"
decode_function[TLTU] = decode_tltu

TNE = 0b110110
def decode_tne(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    return f"tne ${rs}, ${rt}"
decode_function[TNE] = decode_tne

XOR = 0b100110
def decode_xor(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"xor ${rd}, ${rs}, ${rt}"
decode_function[XOR] = decode_xor

def decode_special(asm_instruction):
    funct = special_function(asm_instruction)
    if funct in decode_function:
        return decode_function[funct](asm_instruction)
    print(bin(funct))
    print("no special found")
    return None
    