from encryption.textEncryption import *
from fileHandling import *

key = input("Enter the key (must be 16, 24, or 32 bytes long): ").encode()

if len(key) not in (16, 24, 32):
    key = pad(key)[:32]

print(key)

while True:
    plaintext = input("Enter the message to encrypt: ")
    if plaintext == "":
        break
    ciphertext = encrypt(plaintext.encode(), key)
    print("Ciphered text: {}".format(ciphertext))
    print("Deciphered text: {}".format(decrypt(ciphertext, key)))

filePath = "demo/file.txt"

# todo image encryption with base64
is_file_path(filePath, key)

print(filePath)
