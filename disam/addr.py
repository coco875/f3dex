address = 0

def get_address():
    return address

def set_address(addr):
    global address
    address = addr

def convert_to_signed(num, bits):
    if num & (1 << (bits - 1)):
        num ^= (1 << bits) - 1
        num += 1
        num *= -1
    return num