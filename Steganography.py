import numpy as np
from PIL import Image


def encode(message, img):
    width, height = img.size

    array = np.array(list(img.getdata()))
    mode = 3
    pixels = array.size // mode
    if len(message) > pixels // 3:
        raise ValueError("Message is too long for the image")
    message += '\0\0\0\0'
    binary_message = ''.join([format(ord(i), "08b") for i in message])
    required_pixels = len(binary_message)
    index = 0
    for p in range(pixels):
        for q in range(0, 3):
            if index < required_pixels:
                binary_pixel = format(array[p][q], "08b")
                binary_pixel = binary_pixel[:-1] + binary_message[index]
                array[p][q] = int(binary_pixel, 2)
                index += 1
            else:
                break
    array = array.reshape(height, width, mode)
    enc_img = Image.fromarray(array.astype('uint8'), img.mode)
    enc_img.save(r"demo/output.png")


def decode(img):
    array = np.array(list(img.getdata()))
    mode = img.mode
    channels = len(mode)
    pixels = array.size // channels
    hidden_bits = ""
    delimiter_found = False
    for p in range(pixels):
        if delimiter_found:
            break
        for q in range(channels):
            hidden_bits += (bin(array[p][q])[2:][-1])
            if len(hidden_bits) >= 32 and hidden_bits[-32:] == "00000000000000000000000000000000":
                delimiter_found = True
                hidden_bits = hidden_bits[:-32]
                break
    if delimiter_found:
        message_bytes = [hidden_bits[i:i + 8] for i in range(0, len(hidden_bits), 8)]
        message = ''.join([chr(int(byte, 2)) for byte in message_bytes])
    else:
        print("No delimiter found")
    return message
