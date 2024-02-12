import os

armips = "./armips/build/armips"
id_str = "RSP Gfx ucode F3DEX         0.95 Yoshitaka Yasumoto Nintendo."
version = "F3DLX"
output = f"./build/{version}"
if not os.path.exists(output):
    os.makedirs(output)
cmd = f"{armips} -strequ ID_STR \"{id_str}\" -strequ CODE_FILE ./build/{version}/{version}.code -equ CFG_NoN 0 -strequ DATA_FILE ./build/{version}/{version}.data {version.lower()}.s -sym2 ./build/{version}/{version}.sym -temp ./build/{version}/{version}.tmp.s"

os.system(cmd)