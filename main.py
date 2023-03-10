from textEncryption import *
from fileHandling import *
from PIL import Image

key = input("Enter the key (must be 16, 24, or 32 bytes long): ").encode()

if len(key) not in (16, 24, 32):
    key = pad(key)[:32]

print(key)

plaintext = input("Enter the message to encrypt: ")


filePath = "demo/input/file.txt"

# todo image encryption with base64
img = Image.open(r"demo/mountainLake.png")
is_file_path(filePath, key, img)
res = Image.open(r"demo/output.png")
print(decodeData(key, res))
