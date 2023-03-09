from encryption.Steganography import decode, encode
from encryption.textEncryption import *
from fileHandling import *

key = input("Enter the key (must be 16, 24, or 32 bytes long): ").encode()

if len(key) not in (16, 24, 32):
    key = pad(key)[:32]

print(key)

plaintext = input("Enter the message to encrypt: ")
ciphertext = encrypt(plaintext.encode(), key)
print("Ciphered text: {}".format(ciphertext))
print("Deciphered text: {}".format(decrypt(ciphertext, key).decode()))

# filePath = "demo/input/file.txt"

# todo image encryption with base64
# is_file_path(filePath, key)
ciphertext = "{}".format(ciphertext)
encode(ciphertext, r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\OIP.jpeg")
ciphertext = decode(r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png")
temp = ciphertext.encode('latin1').decode('unicode_escape').encode('latin1')

helper = b''

for i in range(2, len(temp) - 1):
    helper += temp[i].to_bytes(1, 'big')


print(helper)
print(decrypt(helper, key).decode())
# print(filePath
