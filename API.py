import os
from flask import request, app, jsonify
from fileHandling import encodeData, decodeData


def encode_data():
    data = request.form['data']
    key = request.form['key']
    image = request.files['image']
    image.save('input.png')
    encodeData(data, key, 'input.png')
    with open('output.png', 'rb') as f:
        encoded_image = f.read()
    os.remove('input.png')
    os.remove('output.png')
    return jsonify({'encoded_image': encoded_image})

@app.route('/decode', methods=['POST'])
def decode_data():
    key = request.form['key']
    image = request.files['image']
    image.save('input.png')
    data = decodeData(key, 'input.png')
    os.remove('input.png')
    return jsonify({'data': data})