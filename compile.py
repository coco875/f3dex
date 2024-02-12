import os
import hashlib

def check(file, out):
    file = open(file, "rb")
    data = file.read()
    file.close()
    hash = hashlib.md5(data).hexdigest()
    
    file = open(out, "rb")
    data = file.read()
    file.close()
    if hash == hashlib.md5(data).hexdigest():
        return True
    else:
        return False

armips = "./tools/armips/build/armips"
id_str = "RSP Gfx ucode F3DEX         0.95 Yoshitaka Yasumoto Nintendo."
version = "F3DEX"
output = f"./build/{version}"
if not os.path.exists(output):
    os.makedirs(output)
cmd = f"{armips} -strequ ID_STR \"{id_str}\" -strequ CODE_FILE ./build/{version}/{version}.code -equ CFG_NoN 0 -strequ DATA_FILE ./build/{version}/{version}.data {version.lower()}.s -sym2 ./build/{version}/{version}.sym -temp ./build/{version}/{version}.tmp.s"

os.system(cmd)

if check(f"./build/{version}/{version}.code", f"./goal/{version}.bin"):
    print("Success")
else:
    print("Failed")

if check(f"./build/{version}/{version}.data", f"./goal/{version}_data.bin"):
    print("Success")
else:
    print("Failed")