from extract_arg import *

decode_functions_swc2 = {}

sbv = 0b00000
def decode_sbv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"sbv v{rt}[{idx}], {bits}(${rs})"
decode_functions_swc2[sbv] = decode_sbv

ssv = 0b00001
def decode_ssv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"ssv v{rt}[{idx}], {bits<<1}(${rs})"
decode_functions_swc2[ssv] = decode_ssv

slv = 0b00010
def decode_slv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"slv v{rt}[{idx}], {bits<<2}(${rs})"
decode_functions_swc2[slv] = decode_slv

sdv = 0b00011
def decode_sdv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"sdv v{rt}[{idx}], {bits<<3}(${rs})"
decode_functions_swc2[sdv] = decode_sdv

sqv = 0b00100
def decode_sqv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"sqv v{rt}[{idx}], {bits<<4}(${rs})"
decode_functions_swc2[sqv] = decode_sqv

srv = 0b00101
def decode_srv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"srv v{rt}[{idx}], {bits<<5}(${rs})"
decode_functions_swc2[srv] = decode_srv

spv = 0b00110
def decode_spv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"spv v{rt}[{idx}], {bits<<6}(${rs})"
decode_functions_swc2[spv] = decode_spv

suv = 0b00111
def decode_suv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"suv v{rt}[{idx}], {bits<<7}(${rs})"
decode_functions_swc2[suv] = decode_suv

shv = 0b01000
def decode_shv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"shv v{rt}[{idx}], {bits<<8}(${rs})"
decode_functions_swc2[shv] = decode_shv

sfv = 0b01001
def decode_sfv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"sfv v{rt}[{idx}], {bits<<9}(${rs})"
decode_functions_swc2[sfv] = decode_sfv

swv = 0b01010
def decode_swv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"swv v{rt}[{idx}], {bits<<10}(${rs})"
decode_functions_swc2[swv] = decode_swv

stv = 0b01011
def decode_stv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"stv v{rt}[{idx}], {bits<<11}(${rs})"
decode_functions_swc2[stv] = decode_stv

def decode_SWC2(asm_instruction):
    rd = extract_rd(asm_instruction)
    if rd in decode_functions_swc2:
        return decode_functions_swc2[rd](asm_instruction)
    print("Error: SWC2 instruction not recognized")
    return None

decode_functions_lwc2 = {}

lbv = 0b00000
def decode_lbv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lbv v{rt}[{idx}], {bits}(${rs})"
decode_functions_lwc2[lbv] = decode_lbv

lsv = 0b00001
def decode_lsv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lsv v{rt}[{idx}], {bits<<1}(${rs})"
decode_functions_lwc2[lsv] = decode_lsv

llv = 0b00010
def decode_llv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"llv v{rt}[{idx}], {bits<<2}(${rs})"
decode_functions_lwc2[llv] = decode_llv

ldv = 0b00011
def decode_ldv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"ldv v{rt}[{idx}], {bits<<3}(${rs})"
decode_functions_lwc2[ldv] = decode_ldv

lqv = 0b00100
def decode_lqv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lqv v{rt}[{idx}], {bits<<4}(${rs})"
decode_functions_lwc2[lqv] = decode_lqv

lrv = 0b00101
def decode_lrv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lrv v{rt}[{idx}], {bits<<5}(${rs})"
decode_functions_lwc2[lrv] = decode_lrv

lpv = 0b00110
def decode_lpv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lpv v{rt}[{idx}], {bits<<6}(${rs})"
decode_functions_lwc2[lpv] = decode_lpv

luv = 0b00111
def decode_luv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"luv v{rt}[{idx}], {bits<<7}(${rs})"
decode_functions_lwc2[luv] = decode_luv

lhv = 0b01000
def decode_lhv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lhv v{rt}[{idx}], {bits<<8}(${rs})"
decode_functions_lwc2[lhv] = decode_lhv

lfv = 0b01001
def decode_lfv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"lfv v{rt}[{idx}], {bits<<9}(${rs})"
decode_functions_lwc2[lfv] = decode_lfv

ltv = 0b01010
def decode_ltv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    bits = extract_7bit(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"ltv v{rt}[{idx}], {bits<<10}(${rs})"
decode_functions_lwc2[ltv] = decode_ltv

def decode_LWC2(asm_instruction):
    rd = extract_rd(asm_instruction)
    if rd in decode_functions_lwc2:
        return decode_functions_lwc2[rd](asm_instruction)
    print("Error: LWC2 instruction not recognized")
    return None