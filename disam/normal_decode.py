from extract_arg import extract_rs, extract_rt, extract_immediate

ADDI = 0b001000
def decode_addi(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"addi ${rt}, ${rs}, {imm}"

ADDIU = 0b001001
def decode_addiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"addiu ${rt}, ${rs}, {imm}"

ANDI = 0b001100
def decode_andi(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"andi ${rt}, ${rs}, {imm}"

BEQ = 0b000100
def decode_beq(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"beq ${rs}, ${rt}, {imm}"

BEQL = 0b010100
def decode_beql(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    imm = extract_immediate(asm_instruction)
    return f"beql ${rs}, ${rt}, {imm}"

def decode_normal(asm_instruction):
    opcode = asm_instruction >> 26
    if opcode == ADDI:
        return decode_addi(asm_instruction)
    if opcode == ADDIU:
        return decode_addiu(asm_instruction)
    if opcode == ANDI:
        return decode_andi(asm_instruction)
    if opcode == BEQ:
        return decode_beq(asm_instruction)
    if opcode == BEQL:
        return decode_beql(asm_instruction)
    return f"Unknown opcode {opcode}"