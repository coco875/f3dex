def extract_opcode(asm_instruction:int):
    return asm_instruction >> 26

def extract_rs(asm_instruction:int):
    return (asm_instruction >> 21) & 0b11111

def extract_rt(asm_instruction:int):
    return (asm_instruction >> 16) & 0b11111

def extract_rd(asm_instruction:int):
    return (asm_instruction >> 11) & 0b11111

def extract_sa(asm_instruction:int):
    return (asm_instruction >> 6) & 0b11111

def special_function(asm_instruction:int):
    return asm_instruction & 0b111111

def extract_offset(asm_instruction:int):
    return asm_instruction & 0xFFFF

def extract_immediate(asm_instruction:int):
    return asm_instruction & 0xFFFF

def extract_target(asm_instruction):
    return asm_instruction & (2**26-1)