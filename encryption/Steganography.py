import numpy as np
from PIL import Image

def encode(message):
    # open image and convert from rgb to rgba and get size
    img = Image.open(r"C:\Users\emily\OneDrive\Работен плот\cupcake.png")
    img = img.convert("RGBA")
    width, height = img.size
    # convert to array of pixels and get how many there are
    array = np.array(list(img.getdata()))
    mode = 4
    pixels = array.size // mode
    # make a delimeter to know when to stop decoding, convert the message
    # to binary and calculate how many pixels you need
    message += '\0'
    binary_message = ''.join([format(ord(i), "08b") for i in message])
    required_pixels = len(binary_message)
    index = 0
    for p in range(pixels):
        for q in range(0, 4):
            if index < required_pixels:
                array[p][q] = int(bin(array[p][q])[2:9] + binary_message[index], 2)
                index += 1
            else:
                break
    array = array.reshape(height, width, mode)
    enc_img = Image.fromarray(array.astype('uint8'), img.mode)
    enc_img.save(r"C:\Users\emily\OneDrive\Работен плот\enc.png")


def decode(src):
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
    else:
        print("No Hidden Message Found")


encode("dabber is awesome :0")
decode(r"C:\Users\emily\OneDrive\Работен плот\enc.png")
