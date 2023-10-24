from extract_arg import extract_rs, extract_rt, extract_rd, special_function, extract_offset

decode_function = {}

REGIMM = 0b000001

BGEZ = 0b00001
def decode_bgez(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bgez ${rs}, {offset}"
decode_function[BGEZ] = decode_bgez

BGEZAL = 0b10001
def decode_bgezal(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bgezal ${rs}, {offset}"
decode_function[BGEZAL] = decode_bgezal

BGEZALL = 0b10011
def decode_bgezall(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bgezall ${rs}, {offset}"
decode_function[BGEZALL] = decode_bgezall

BGEZL = 0b00011
def decode_bgezl(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bgezl ${rs}, {offset}"
decode_function[BGEZL] = decode_bgezl

BLTZ = 0b00000
def decode_bltz(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bltz ${rs}, {offset}"
decode_function[BLTZ] = decode_bltz

BLTZAL = 0b10000
def decode_bltzal(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bltzal ${rs}, {offset}"
decode_function[BLTZAL] = decode_bltzal

BLTZALL = 0b10010
def decode_bltzall(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bltzall ${rs}, {offset}"
decode_function[BLTZALL] = decode_bltzall

BLTZL = 0b00010
def decode_bltzl(asm_instruction):
    rs = extract_rs(asm_instruction)
    offset = extract_offset(asm_instruction)
    return f"bltzl ${rs}, {offset}"
decode_function[BLTZL] = decode_bltzl

TEQI = 0b01100
def decode_teqi(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"teqi ${rs}, {immediate}"
decode_function[TEQI] = decode_teqi

TGEI = 0b01000
def decode_tgei(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"tgei ${rs}, {immediate}"
decode_function[TGEI] = decode_tgei

TGEIU = 0b01001
def decode_tgeiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"tgeiu ${rs}, {immediate}"
decode_function[TGEIU] = decode_tgeiu

TLTI = 0b01010
def decode_tlti(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"tlti ${rs}, {immediate}"
decode_function[TLTI] = decode_tlti

TLTIU = 0b01011
def decode_tltiu(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"tltiu ${rs}, {immediate}"
decode_function[TLTIU] = decode_tltiu

TNEI = 0b01110
def decode_tnei(asm_instruction):
    rs = extract_rs(asm_instruction)
    immediate = extract_offset(asm_instruction)
    return f"tnei ${rs}, {immediate}"
decode_function[TNEI] = decode_tnei

def regimm_decode(asm_instruction):
    """Decode a REGIMM instruction."""
    rt = extract_rt(asm_instruction)
    if rt in decode_function:
        return decode_function[rt](asm_instruction)
    print(f"Unknown REGIMM instruction: {bin(rt)}")
    return None