import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ytresxcvbnm/pages/after_encryption_image_page.dart';
import 'package:http/http.dart' as http;

class ImportImagePage extends StatefulWidget {
  const ImportImagePage({super.key});

  @override
  State<ImportImagePage> createState() => _ImportImagePageState();
}

class _ImportImagePageState extends State<ImportImagePage> {
  File? _image;
  XFile _pickedFile = XFile('');
  final _picker = ImagePicker();
  late String _imagePath = "";

  Future<void> _pickImage() async {
    _pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
    if (_pickedFile != null) {
      setState(() {
        _pickedFile = _pickedFile;
        _image = File(_pickedFile.path);
        _imagePath = _pickedFile.path;
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
                const SizedBox(height: 10),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AfterEncryptionImagePage(
                                    imagePath: _imagePath,
                                  )));
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

