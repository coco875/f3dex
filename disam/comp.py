from disasm import decode_opcode

def comp(file1_name, file2_name):
    file1 = open(file1_name, "rb").read()
    file2 = open(file2_name, "rb").read()
    for i in range(0, len(file1), 4):
        int_instruction1 = int.from_bytes(file1[i:i+4], byteorder='big')
        int_instruction2 = int.from_bytes(file2[i:i+4], byteorder='big')
        r1 = decode_opcode(int_instruction1)
        r2 = decode_opcode(int_instruction2)
        if int_instruction1 != int_instruction2:
            print("0x{:08x}:\t{:08x}\t{}\t{}".format(0x00001080+i, int_instruction1, r1, bin(int_instruction1)))
            print("0x{:08x}:\t{:08x}\t{}\t{}".format(0x00001080+i, int_instruction2, r2, bin(int_instruction2)))
            break

if __name__ == "__main__":
    comp("goal/F3DEX.bin", "build/F3DEX/F3DEX.code")