from extract_arg import extract_rs, extract_rt, extract_rd, extract_opcode, extract_offset, special_function

COPZ = 0b0100

BC = 0b01000


BCF = 0b00000
def decode_bcf(asm_instruction, z):
    offset = extract_offset(asm_instruction)
    return f"bc{z}f {offset}"

BCFL = 0b00010
def decode_bcfl(asm_instruction, z):
    offset = extract_offset(asm_instruction)
    return f"bc{z}fl {offset}"

BCT = 0b00001
def decode_bct(asm_instruction, z):
    offset = extract_offset(asm_instruction)
    return f"bc{z}t {offset}"

BCTL = 0b00011
def decode_bctl(asm_instruction, z):
    offset = extract_offset(asm_instruction)
    return f"bc{z}tl {offset}"

CF = 0b00010
def decode_cfc(asm_instruction, z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"cfc{z} ${rt}, ${rd}"

CO = 0b1
def decode_cop_operation(asm_instruction, z):
    cofun = asm_instruction & (2^26 - 1)
    return f"cop{z} {cofun}"

CT = 0b00110
def decode_ct(asm_instruction, z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"ctz{z} ${rt}, ${rd}"

DMF = 0b00001
def decode_dmf(asm_instruction, z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dmfc{z} ${rt}, ${rd}"

DMT = 0b00101
def decode_dmt(asm_instruction, z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"dmtc{z} ${rt}, ${rd}"

ERET = 0b011000
def decode_eret(asm_instruction):
    return "eret"

TLBP = 0b001000
def decode_tlbp(asm_instruction):
    return "tlbp"

TLBR = 0b000001
def decode_tlbr(asm_instruction):
    return "tlbr"

TLBWI = 0b000010
def decode_tlbwi(asm_instruction):
    return "tlbwi"

TLBWR = 0b000110
def decode_tlbwr(asm_instruction):
    return "tlbwr"

MFC = 0b00000
def decode_mfc(asm_instruction,z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"mfc{z} ${rt}, ${rd}"

MTC = 0b00100
def decode_mtc(asm_instruction,z):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"mtc{z} ${rt}, ${rd}"

def decode_copz(asm_instruction):
    z = extract_opcode(asm_instruction) & 0b11
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    if rs == BC:
        if rt == BCF:
            return decode_bcf(asm_instruction, z)
        if rt == BCFL:
            return decode_bcfl(asm_instruction, z)
        if rt == BCT:
            return decode_bct(asm_instruction, z)
        if rt == BCTL:
            return decode_bctl(asm_instruction, z)
        return None
    if rs == CF:
        return decode_cfc(asm_instruction, z)
   
    if rs == MFC:
        return decode_mfc(asm_instruction, z)
    if rs == MTC:
        return decode_mtc(asm_instruction, z)
    if (rs>>4)==CO:
        if z==0:
            if special_function(asm_instruction)==ERET:
                return decode_eret(asm_instruction)
            if special_function(asm_instruction)==TLBP:
                return decode_tlbp(asm_instruction)
            if special_function(asm_instruction)==TLBR:
                return decode_tlbr(asm_instruction)
            if special_function(asm_instruction)==TLBWI:
                return decode_tlbwi(asm_instruction)
            if special_function(asm_instruction)==TLBWR:
                return decode_tlbwr(asm_instruction)
        return decode_cop_operation(asm_instruction, z)
    if rs == CT:
        return decode_ct(asm_instruction, z)
    if rs == DMF:
        return decode_dmf(asm_instruction, z)
    if rs == DMT:
        return decode_dmt(asm_instruction, z)
    print("no copz instruction")
    return None