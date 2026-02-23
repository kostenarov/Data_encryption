# Data Encryption (Steganography + Password Protection)

A simple end-to-end project that hides (encrypts) text or files inside an image and allows you to decrypt/extract them using the correct password.  
Backend is a **Flask API (Python)** and the frontend is a **Flutter** app.

## Tech Stack

- **Backend:** Python, Flask  
- **Frontend:** Flutter  
- **Python deps:** `flask`, `pillow`, `cryptography`, `numpy`

## Setup & Run

### Backend (Flask API)

1. Navigate to the project directory.
2. Install dependencies:

```bash
pip install flask pillow cryptography numpy
```

3. Run the API server:

```bash
python API.py
```

### Frontend (Flutter)

1. Ensure you have the **Flutter SDK** installed.
2. Install Flutter dependencies:

```bash
flutter pub get
```

3. Launch the app on an emulator or physical device:

```bash
flutter run
```

#### Android Emulator Note

If you are running on an **Android emulator**, make sure the API endpoint in `import_image_page.dart` points to:

- `10.0.2.2` (instead of `localhost`)

## Usage

### Select Action
On the Home Screen choose one of:
- **Import Text**
- **Import File**
- **Decrypt Image**

### Encrypt
1. Enter your message **or** select a file.
2. Provide a secure password.
3. Choose a carrier image from your gallery.
4. Click **Convert** to generate the protected (steganographic) image.

### Decrypt
1. Upload the steganographic image.
2. Enter the correct password used during encryption.
3. Retrieve the hidden message instantly.

## License

This project is open-source and free to use for **personal or educational purposes**.