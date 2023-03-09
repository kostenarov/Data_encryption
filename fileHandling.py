import os
from encryption.textEncryption import encrypt, decrypt


def write_file(filePath, text, extension):
    fileWrite = open(filePath, extension)
    fileWrite.write(text)
    fileWrite.close()


def read_file(filePath, extension):
    fileRead = open(filePath, extension)
    string = fileRead.read()
    fileRead.close()
    return string


def mainFileFunc(string, key):
    write_file("demo/output.txt", encrypt(string.encode(), key), "wb")
    inputT = read_file("demo/output.txt", "rb")
    print(inputT)
    outputT = decrypt(inputT, key)
    print(outputT.decode())
    write_file("demo/output2.txt", outputT.decode(), "w")


def is_file_path(string, key):
    if os.path.isdir(string):
        print("This is a directory")
    if os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()

        mainFileFunc(plainText, key)

    else:
        mainFileFunc(string, key)
