import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ytresxcvbnm/pages/after_encryption_image_page.dart';
import 'package:http/http.dart' as https;

class ImportImagePage extends StatefulWidget {
  final String textToEncrypt;
  final String passwordToEncrypt;
  const ImportImagePage(
      {Key? key, required this.textToEncrypt, required this.passwordToEncrypt})
      : super(key: key);

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
                      onPressed: () async {
                        // Encode the data as JSON
                        final data = jsonEncode({
                          'data': widget.textToEncrypt,
                          'key': widget.passwordToEncrypt,
                          'image': _pickedFile.path,
                        });

                        // Send the data to the server
                        final response = await https.post(
                          Uri.parse('https://10.0.2.2:5000/encode'),
                          body: data,
                          headers: {'Content-Type': 'application/json'},
                        );

                        // Check the response status
                        if (response.statusCode == 200) {
                          // If the server returns a success response, navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AfterEncryptionImagePage(
                                imagePath: _imagePath,
                              ),
                            ),
                          );
                        } else {
                          // If the server returns an error response, display an error message
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: Text(
                                  'Failed to encrypt data: ${response.reasonPhrase}'),
                            ),
                          );
                        }
                      },
                      child:
                          const Text("Convert", style: TextStyle(fontSize: 26)),
                    ),
                  ),
                )
              ]))),
    );
  }
}
