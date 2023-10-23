from extract_arg import extract_rs, extract_rt, extract_rd, extract_opcode, extract_offset

COPZ = 0b0100

BC = 0b01000
def decode_bc(asm_instruction, z):
    rt = extract_rt(asm_instruction)
    imm = asm_instruction & 0xFFFF
    return f"bc{z} ${rt}, {imm}"

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
        return decode_bc(asm_instruction, z)