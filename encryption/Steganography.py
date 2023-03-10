import numpy as np
from PIL import Image
from stegano import lsb

def encode(message, src=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\mountainLake.png"):
    # open image and convert from rgb to rgba and get size
    img = Image.open(src)

    # Encode the message into the image using LSB
    enc_img = lsb.hide(img, message)

    # Save the encoded image
    enc_img.save(r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png")


def decode(src=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png"):
    img = Image.open(src, 'r')
    array = np.array(list(img.getdata()))
    mode = 4
    pixels = array.size // mode
    hidden_bits = ""
    second = False
    for p in range(pixels):
        for q in range(0, 4):
            hidden_bits += (bin(array[p][q])[2:][-1])
        if not second:
            second = True
        elif second:
            second = False
            hidden_char = chr(int(hidden_bits[-8:]))
            if hidden_char == '\0':
                break

    hidden_bits = [hidden_bits[i:i + 8] for i in range(0, len(hidden_bits), 8)]

    message = ""
    for i in range(len(hidden_bits)):
        if message[-1:] == '\0':
            break
        else:
            message += chr(int(hidden_bits[i], 2))
    if '\0' in message:
        print("Hidden Message:", message[:-1])
        return message[:-1]
    else:
        print("No Hidden Message Found")
