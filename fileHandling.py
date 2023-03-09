import os
from encryption.textEncryption import encrypt, decrypt


def is_file_path(string, key):
    if os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()
        res = plainText.encode()
        ciphertext = encrypt(res, key)
        print(ciphertext)
        print(decrypt(ciphertext, key).decode())