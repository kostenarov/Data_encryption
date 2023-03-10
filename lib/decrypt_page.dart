import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ytresxcvbnm/pages/after_encryption_image_page.dart';
import 'package:ytresxcvbnm/pages/decrypt_text_page.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  File? _image;
  XFile _pickedFile = XFile('');
  final _picker = ImagePicker();
  final _passwordController = TextEditingController();
  String passwordToEncrypt = "";
  Future<void> _pickImage() async {
    _pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
    if (_pickedFile != null) {
      setState(() {
        _pickedFile = _pickedFile;
        _image = File(_pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.I.M.P'),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(children: [
                Center(
                    child: GestureDetector(
                        child: const Text("Select image"),
                        onTap: () => _pickImage())),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 180,
                  color: Colors.white70,
                  child: _pickedFile.path.isNotEmpty
                      ? Image.file(
                          File(_pickedFile.path),
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Input password here',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passwordController.clear();
                            },
                            icon: const Icon(Icons.clear))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      // tuk trqbva da e vruzkata s algorituma
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DecryptTextPage()));
                    },
                    child:
                        const Text("Convert", style: TextStyle(fontSize: 26)),
                  )),
                ),
              ]))),
    );
  }
}


// zapazvane na image-a nqkude
// convert button:
// 1. Svurzano s convert algoritum

