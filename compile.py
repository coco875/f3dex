import os
import hashlib
from colorama import Fore, Back, Style

def print_if_match(file, out):
    file = open(file, "rb")
    data = file.read()
    file.close()
    hash = hashlib.md5(data).hexdigest()
    
    file = open(out, "rb")
    data = file.read()
    file.close()
    if hash == hashlib.md5(data).hexdigest():
        print(f"{Fore.GREEN}Match{Fore.WHITE}: {file.name} and {out}")
        return True
    else:
        print(f"{Fore.RED}Failed{Fore.WHITE}: {file.name} and {out}")
        return False

armips = "./tools/armips/build/armips"
def compile_and_check_file(version, asm, id_str = ""):
    print(f"Compiling {asm}")
    output = f"./build/{version}"
    if not os.path.exists(output):
        os.makedirs(output)
    cmd = f"{armips} -strequ ID_STR \"{id_str}\" -strequ CODE_FILE ./build/{version}/{version}.code -equ CFG_NoN 0 -strequ DATA_FILE ./build/{version}/{version}.data {asm} -sym2 ./build/{version}/{version}.sym -temp ./build/{version}/{version}.tmp.s"

    result = os.system(cmd)
    if result != 0:
        print(f"Failed to compile {asm}")
        return False
    code = True
    data = True
    if os.path.exists(f"./build/{version}/{version}.code"):
        code = print_if_match(f"./build/{version}/{version}.code", f"./goal/{version}.bin")

    if os.path.exists(f"./build/{version}/{version}.data"):
        data = print_if_match(f"./build/{version}/{version}.data", f"./goal/{version}_data.bin")
    return code and data

if all([
    compile_and_check_file("F3DEX", "f3dex.s", id_str = "RSP Gfx ucode F3DEX         0.95 Yoshitaka Yasumoto Nintendo."),
    compile_and_check_file("F3DLX", "f3dlx.s", id_str = "RSP Gfx ucode F3DLX         0.95 Yoshitaka Yasumoto Nintendo."),
    compile_and_check_file("F3D_boot", "f3d_boot.s")
    ]):
    print("All files compiled successfully")
else:
    print(Fore.RED + "Error:" + Fore.WHITE + "Some files failed to compile or match the goal files.")
    exit(1)