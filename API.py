from PIL import Image
from flask import request, app, jsonify, Flask
from fileHandling import decodeData, is_file_path, encodeData
from textEncryption import pad

app = Flask(__name__)


@app.route('/encode', methods=['POST'])
def encode_data():
    if 'data' in request.files:
        data = request.files['data']
        data.save(r"demo/input.txt")
        data = open(r"demo/input.txt", "r").read()
    elif 'data' in request.form:
        data = request.form['data']
    else:
        return jsonify({"status": "error", "message": "No data provided"})

    key = request.form['key']
    if len(key.encode()) not in (16, 24, 32):
        key = pad(key.encode())[:32]
    img = request.files['image']
    img.save(r"demo/input.png")
    img = Image.open(r"demo/input.png")
    encodeData(data, key, img)
    return jsonify({"status": "success"})


@app.route('/decode', methods=['POST'])
def decode_data():
    key = request.form['key']
    if len(key.encode()) not in (16, 24, 32):
        key = pad(key.encode())[:32]
    print(key)
    image = request.files['image']
    image.save(r"demo/input.png")
    image = Image.open(r"demo/input.png")
    data = decodeData(key, image)
    return data


if __name__ == '__main__':
    app.run(debug=True)
