from extract_arg import extract_rs, extract_rt, extract_rd, special_function

SPECIAL = 0b000000

ADD = 0b100000
def decode_add(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"add ${rd}, ${rs}, ${rt}"

ADDU = 0b100001
def decode_addu(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"addu ${rd}, ${rs}, ${rt}"

AND = 0b100100
def decode_and(asm_instruction):
    rs = extract_rs(asm_instruction)
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"and ${rd}, ${rs}, ${rt}"

def decode_special(asm_instruction):
    funct = special_function(asm_instruction)
    if funct == ADD:
        return decode_add(asm_instruction)
    if funct == ADDU:
        return decode_addu(asm_instruction)
    if funct == AND:
        return decode_and(asm_instruction)