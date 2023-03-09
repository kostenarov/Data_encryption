import os
from encryption.textEncryption import encrypt, decrypt


def is_file_path(string, key):
    if os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()

        res = plainText.encode()
        ciphertext = encrypt(res, key)
        file = open("demo/output.txt", "wb+")
        file.write(ciphertext)
        file.close()

        file = open("demo/output.txt", "rb")
        inputT = file.read()
        file.close()

        print(inputT)
        outputT = decrypt(inputT, key)
        print(outputT.decode())
        file = open("demo/output2.txt", "w")
        file.write(outputT.decode())
        file.close()
