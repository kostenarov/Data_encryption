import numpy as np
from PIL import Image
from stegano import lsb

def encode(message, src):
    img = Image.open(src)
    img = img.convert("RGBA")
    width, height = img.size

    array = np.array(list(img.getdata()))
    mode = 4
    pixels = array.size // mode
    if len(message) > pixels // 4:
        raise ValueError("Message is too long for the image")
    message += '\0'
    binary_message = ''.join([format(ord(i), "08b") for i in message])
    required_pixels = len(binary_message)
    index = 0
    for p in range(pixels):
        for q in range(0, 4):
            if index < required_pixels:
                binary_pixel = format(array[p][q], "08b")
                binary_pixel = binary_pixel[:-1] + binary_message[index]
                array[p][q] = int(binary_pixel, 2)
                index += 1
            else:
                break
    array = array.reshape(height, width, mode)
    enc_img = Image.fromarray(array.astype('uint8'), img.mode)
    enc_img.save("encoded.png")
    enc_img.show()

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
