from extract_arg import extract_opcode
from special_decode import decode_special, SPECIAL
from copz_decode import decode_copz, COPZ
from regimm_decode import regimm_decode, REGIMM
from normal_decode import decode_normal
from addr import get_address, set_address

def decodes(file_name:str):
    file = open(file_name, "rb").read()
    for i in range(0, len(file), 4):
        int_instruction = int.from_bytes(file[i:i+4], byteorder='big')
        set_address(0x00001080+i)
        r = decode_opcode(int_instruction)
        if r is None:
            exit()
        print(r)

def decode_opcode(asm_instruction:int):
    opcode = extract_opcode(asm_instruction)
    if opcode == SPECIAL:
        return decode_special(asm_instruction)
    if opcode>>2 == COPZ:
        return decode_copz(asm_instruction)
    if opcode == REGIMM:
        return regimm_decode(asm_instruction)
    return decode_normal(asm_instruction)


if __name__ == "__main__":
    decodes("goal/F3DEX.bin")