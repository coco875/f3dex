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
    return f"spv v{rt}[{idx}], {bits<<3}(${rs})"
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
    return f"stv v{rt}[{idx}], {bits<<4}(${rs})"
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
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"lbv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lbv] = decode_lbv

lsv = 0b00001
def decode_lsv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 1
    idx = asm_instruction>>7 & 0b1111
    return f"lsv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lsv] = decode_lsv

llv = 0b00010
def decode_llv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 2
    idx = asm_instruction>>7 & 0b1111
    return f"llv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[llv] = decode_llv

ldv = 0b00011
def decode_ldv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"ldv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[ldv] = decode_ldv

lqv = 0b00100
def decode_lqv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 4
    idx = asm_instruction>>7 & 0b1111
    return f"lqv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lqv] = decode_lqv

lrv = 0b00101
def decode_lrv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"lrv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lrv] = decode_lrv

lpv = 0b00110
def decode_lpv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"lpv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lpv] = decode_lpv

luv = 0b00111
def decode_luv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"luv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[luv] = decode_luv

lhv = 0b01000
def decode_lhv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"lhv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lhv] = decode_lhv

lfv = 0b01001
def decode_lfv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 3
    idx = asm_instruction>>7 & 0b1111
    return f"lfv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[lfv] = decode_lfv

ltv = 0b01011
def decode_ltv(asm_instruction):
    rt = extract_rt(asm_instruction)
    rs = extract_rs(asm_instruction)
    imm = (asm_instruction & 0b1111111) << 4
    idx = asm_instruction>>7 & 0b1111
    return f"ltv v{rt}[{idx}], {imm}(r{rs})"
decode_functions_lwc2[ltv] = decode_ltv

def decode_LWC2(asm_instruction):
    rd = extract_rd(asm_instruction)
    if rd in decode_functions_lwc2:
        return decode_functions_lwc2[rd](asm_instruction)
    print(hex(rd))
    print("Error: LWC2 instruction not recognized")
    return None

decode_functions_cop2 = {}

mfc2 = 0b00000
def decode_mfc2(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    idx = asm_instruction>>7 & 0b1111
    return f"mfc2 ${rt}, v{rd}[{idx}]"
decode_functions_cop2[mfc2] = decode_mfc2

cfc2 = 0b00010
def decode_cfc2(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"cfc2 r{rt}, ${rd}"
decode_functions_cop2[cfc2] = decode_cfc2

mtc2 = 0b00100
def decode_mtc2(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"mtc2 ${rt}, v{rd}"
decode_functions_cop2[mtc2] = decode_mtc2

ctc2 = 0b00110
def decode_ctc2(asm_instruction):
    rt = extract_rt(asm_instruction)
    rd = extract_rd(asm_instruction)
    return f"ctc2 ${rt}, v{rd}"
decode_functions_cop2[ctc2] = decode_ctc2

decode_functions_cop2_rsp = {}

vmulf = 0b000000
def decode_vmulf(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmulf v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmulf] = decode_vmulf

vmulu = 0b000001
def decode_vmulu(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmulu v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmulu] = decode_vmulu

vrndp = 0b000010
def decode_vrndp(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vrndp v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vrndp] = decode_vrndp

vmulq = 0b000011
def decode_vmulq(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmulq v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmulq] = decode_vmulq

vmudl = 0b000100
def decode_vmudl(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmudl v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmudl] = decode_vmudl

vmudm = 0b000101
def decode_vmudm(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmudm v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmudm] = decode_vmudm

vmudn = 0b000110
def decode_vmudn(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmudn v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmudn] = decode_vmudn

vmudh = 0b000111
def decode_vmudh(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmudh v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmudh] = decode_vmudh

vmacf = 0b001000
def decode_vmacf(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmacf v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmacf] = decode_vmacf

vmacu = 0b001001
def decode_vmacu(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmacu v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmacu] = decode_vmacu

vrndn = 0b001010
def decode_vrndn(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vrndn v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vrndn] = decode_vrndn

vmacq = 0b001011
def decode_vmacq(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmacq v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmacq] = decode_vmacq

vmadl = 0b001100
def decode_vmadl(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmadl v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmadl] = decode_vmadl

vmadm = 0b001101
def decode_vmadm(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmadm v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmadm] = decode_vmadm

vmadn = 0b001110
def decode_vmadn(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmadn v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmadn] = decode_vmadn

vmadh = 0b001111
def decode_vmadh(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmadh v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmadh] = decode_vmadh

vadd = 0b010000
def decode_vadd(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vadd v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vadd] = decode_vadd

vsub = 0b010001
def decode_vsub(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsub v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsub] = decode_vsub

vsut = 0b010010
def decode_vsut(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsut v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsut] = decode_vsut

vabs = 0b010011
def decode_vabs(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vabs v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vabs] = decode_vabs

vaddc = 0b010100
def decode_vaddc(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vaddc v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vaddc] = decode_vaddc

vsubc = 0b010101
def decode_vsubc(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsubc v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsubc] = decode_vsubc

vaddb = 0b010110
def decode_vaddb(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vaddb v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vaddb] = decode_vaddb

vsubb = 0b010111
def decode_vsubb(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsubb v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsubb] = decode_vsubb

vaccb = 0b011000
def decode_vaccb(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vaccb v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vaccb] = decode_vaccb

vsucb = 0b011001
def decode_vsucb(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsucb v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsucb] = decode_vsucb

vsad = 0b011010
def decode_vsad(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsad v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsad] = decode_vsad

vsac = 0b011011
def decode_vsac(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsac v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsac] = decode_vsac

vsum = 0b011100
def decode_vsum(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsum v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsum] = decode_vsum

vsar = 0b011101
def decode_vsar(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsar v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsar] = decode_vsar

vacc = 0b011110
def decode_vacc(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vacc v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vacc] = decode_vacc

vsuc = 0b011111
def decode_vsuc(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vsuc v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vsuc] = decode_vsuc

vlt = 0b100000
def decode_vlt(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vlt v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vlt] = decode_vlt

veq = 0b100001
def decode_veq(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"veq v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[veq] = decode_veq

vne = 0b100010
def decode_vne(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vne v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vne] = decode_vne

vge = 0b100011
def decode_vge(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vge v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vge] = decode_vge

vcl = 0b100100
def decode_vcl(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vcl v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vcl] = decode_vcl

vch = 0b100101
def decode_vch(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vch v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vch] = decode_vch

vcr = 0b100110
def decode_vcr(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vcr v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vcr] = decode_vcr

vmrg = 0b100111
def decode_vmrg(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vmrg v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vmrg] = decode_vmrg

vand = 0b101000
def decode_vand(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vand v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vand] = decode_vand

vnand = 0b101001
def decode_vnand(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vnand v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vnand] = decode_vnand

vor = 0b101010
def decode_vor(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vor v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vor] = decode_vor

vnor = 0b101011
def decode_vnor(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vnor v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vnor] = decode_vnor

vxor = 0b101100
def decode_vxor(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vxor v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vxor] = decode_vxor

vnxor = 0b101101
def decode_vnxor(asm_instruction):
    idx = asm_instruction>>21 & 0b1111
    if idx & 0b1000:
        idx = f"[{idx&0b111}w]"
    elif idx & 0b100:
        idx = f"[{idx&0b11}h]"
    elif idx & 0b10:
        idx = f"[{idx&0b1}q]"
    else:
        idx = f""
    rd = extract_rd(asm_instruction)
    rt = extract_rt(asm_instruction)
    rs = asm_instruction>>6 & 0b11111
    return f"vnxor v{rs}, v{rd}, v{rt}{idx}"
decode_functions_cop2_rsp[vnxor] = decode_vnxor

vrcp = 0b110000
def decode_vrcp(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrcp v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrcp] = decode_vrcp

vrcpl = 0b110001
def decode_vrcpl(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrcpl v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrcpl] = decode_vrcpl

vrcph = 0b110010
def decode_vrcph(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrcph v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrcph] = decode_vrcph

vmov = 0b110011
def decode_vmov(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vmov v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vmov] = decode_vmov

vrsq = 0b110100
def decode_vrsq(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrsq v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrsq] = decode_vrsq

vrsql = 0b110101
def decode_vrsql(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrsql v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrsql] = decode_vrsql

vrsqh = 0b110110
def decode_vrsqh(asm_instruction):
    idx1 = asm_instruction>>21 & 0b111
    v1 = asm_instruction>>6 & 0b11111

    idx2 = asm_instruction>>11 & 0b111
    v2 = asm_instruction>>16 & 0b11111
    return f"vrsqh v{v1}[{idx2}], v{v2}[{idx1}]"
decode_functions_cop2_rsp[vrsqh] = decode_vrsqh

def decode_COP2(asm_instruction):
    rs = extract_rs(asm_instruction)
    if rs in decode_functions_cop2:
        return decode_functions_cop2[rs](asm_instruction)
    if rs & 0b10000:
        fun = special_function(asm_instruction)
        if fun in decode_functions_cop2_rsp:
            return decode_functions_cop2_rsp[fun](asm_instruction)
        print(hex(fun))
    print("Error: COP2 instruction not recognized")
    return None