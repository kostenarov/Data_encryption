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


def mainFileFunc(outputPath, string, key):
    write_file("demo/encryptedMessage.txt", encrypt(string.encode(), key), "wb")
    inputT = read_file("demo/encryptedMessage.txt", "rb")
    print(inputT)
    outputT = decrypt(inputT, key)
    print(outputT.decode())
    write_file(outputPath, outputT.decode(), "w")


def separateFileExtension(filePath):
    return filePath.split(".")[-1]


def is_file_path(string, key):
    if os.path.isdir(string):
        for file in os.listdir(string):
            if os.path.isfile(string + "/" + file):
                file = open(string + "/" + file, "r")
                name = file.name.split("/")[-1]
                name = name.split(".")[0]
                plainText = file.read()
                file.close()

                mainFileFunc("demo/output/output" + name, plainText, key)

    elif os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()

        mainFileFunc("demo/output/temp", plainText, key)
        return plainText

    else:
        mainFileFunc("demo/output/temp", string, key)
