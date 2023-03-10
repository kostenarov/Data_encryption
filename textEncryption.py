from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os

BLOCK_SIZE = 16


def pad(text):
    """
    Pads the given text to be a multiple of the block size using PKCS7 padding.
    """
    padding_size = BLOCK_SIZE - len(text) % BLOCK_SIZE
    padding = bytes([padding_size] * padding_size)
    return text + padding


def unpad(text):
    """
    Removes PKCS7 padding from the given text.
    """
    padding_size = text[-1]
    return text[:-padding_size]


def encrypt(plaintext, key):
    """
    Encrypts the given plaintext using AES in CBC mode with the given key.
    """
    iv = os.urandom(BLOCK_SIZE)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(pad(plaintext)) + encryptor.finalize()
    return iv + ciphertext


def decrypt(inputText, key):
    """
    Decrypts the given ciphertext using AES in CBC mode with the given key.
    """
    iv = inputText[:BLOCK_SIZE]
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    outputText = unpad(decryptor.update(inputText[BLOCK_SIZE:]) + decryptor.finalize())
    return outputText
