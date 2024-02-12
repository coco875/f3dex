import argparse

def show_first_diff(file1, file2):
    with open(file1, "rb") as f1:
        with open(file2, "rb") as f2:
            address = 0
            word1 = f1.read(4)
            word2 = f2.read(4)
            while word1 == word2 and word1 != b"" and word2 != b"":
                word1 = f1.read(4)
                word2 = f2.read(4)
                address += 4
            if word1 == b"" and word2 == b"":
                print(f"{file1} and {file2} are identical")
                return
            print(f"{file1}: {word1.hex()}")
            print(f"{file2}: {word2.hex()}")
            print(f"First difference at address 0x{address:08X}")
            return

show_first_diff("./build/F3DEX/F3DEX.data", "./goal/F3DEX_data.bin")