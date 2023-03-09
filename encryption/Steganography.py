from PIL import Image
from stegano.lsb import lsb


def encode(message, src=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png"):
    img = Image.open(src)

    # Encode the message into the image using LSB
    encoded_image = lsb.hide(img, message)

    # Save the encoded image
    encoded_image.save(r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png")


def decode(src=r"C:\Users\petoc\PycharmProjects\Data_encryption\demo\test.png"):
    # Decode the message from the image
    decoded_message = lsb.reveal(src)

    # Print the decoded message
    return decoded_message
