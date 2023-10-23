from extract_arg import extract_opcode
from special_decode import decode_special, SPECIAL
from normal_decode import decode_normal
from copz_decode import decode_copz, COPZ

def decodes():
    file = open("goal/F3DEX.bin", "rb").read()
    for i in range(0, len(file), 4):
        int_instruction = int.from_bytes(file[i:i+4], byteorder='big')
        print(decode_opcode(int_instruction))

def decode_opcode(asm_instruction:int):
    opcode = extract_opcode(asm_instruction)
    if opcode == SPECIAL:
        return decode_special(asm_instruction)
    if opcode>>2 == COPZ:
        return decode_copz(asm_instruction)
    return decode_normal(asm_instruction)

decodes()