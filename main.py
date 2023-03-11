from textEncryption import *
from fileHandling import *
from PIL import Image

key = input("Enter the key (must be 16, 24, or 32 bytes long): ").encode()

if len(key) not in (16, 24, 32):
    key = pad(key)[:32]

plaintext = input("Enter the message to encrypt: ")

plaintext = encrypt(plaintext.encode(), key)
print(plaintext)
plaintext = decrypt(plaintext, key)
print(plaintext.decode())

