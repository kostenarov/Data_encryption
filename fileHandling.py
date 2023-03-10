import os

from Steganography import encode, decode
from textEncryption import encrypt, decrypt


def encodeData(data, key, img):
    temp = encrypt(data.encode(), key)
    temp = "{}".format(temp)
    encode(temp, img)


def decodeData(key, img):
    temp = decode(img)
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


def is_file_path(string, key, img):
    if os.path.isdir(string):
        for file in os.listdir(string):
            if os.path.isfile(string + "/" + file):
                file = open(string + "/" + file, "r")
                plainText = file.read()
                file.close()
                encodeData(plainText, key, img)

    elif os.path.isfile(string):
        file = open(string, "r")
        plainText = file.read()
        file.close()

        encodeData(plainText, key, img)

    else:
        encodeData(string, key, img)