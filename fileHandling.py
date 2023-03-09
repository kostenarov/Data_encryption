import os

from encryption.Steganography import encode, decode
from encryption.textEncryption import encrypt, decrypt


def encodeData(data, key, path=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\mountainLake.png"):
    temp = encrypt(data.encode(), key)
    temp = "{}".format(temp)
    encode(temp, path)


def decodeData(key, path=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png"):
    temp = decode(path)
    temp = temp.encode('latin1').decode('unicode_escape').encode('latin1')
    helper = b''
    for i in range(2, len(temp) - 1):
        helper += temp[i].to_bytes(1, 'big')
    return decrypt(helper, key).decode()


def write_file(filePath, text, extension):
    fileWrite = open(filePath, extension)
    fileWrite.write(text)
    fileWrite.close()


def read_file(filePath, extension):
    fileRead = open(filePath, extension)
    string = fileRead.read()
    fileRead.close()
    return string


def is_file_path(string, key):
    if os.path.isdir(string):
        for file in os.listdir(string):
            if os.path.isfile(string + "/" + file):
                file = open(string + "/" + file, "r")
                plainText = file.read()
                file.close()
                encodeData(plainText, key, r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\OIP.jpeg")

    elif os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()

        encodeData(plainText, key)

    else:
        encodeData(string, key, r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\OIP.jpeg")
