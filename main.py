from encryption.textEncryption import *
from fileHandling import *

key = input("Enter the key (must be 16, 24, or 32 bytes long): ").encode()

if len(key) not in (16, 24, 32):
    key = pad(key)[:32]


filePath = "demo/input/file.txt"

# todo image encryption with base64
is_file_path(filePath, key)
print(decodeData(key))
# print(filePath
