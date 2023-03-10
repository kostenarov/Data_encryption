from PIL import Image
from stegano.lsb import lsb


# define function to encode message into image
def encode(src, message):
    img = Image.open(src)
    encoded_image = lsb.hide(img, message)
    encoded_image.save(r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png")


# define function to decode message from image
def decode(src):
        # Decode the message from the image
    decoded_message = lsb.reveal(src)
    return decoded_message
