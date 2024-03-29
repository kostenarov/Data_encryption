import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ytresxcvbnm/pages/import_image_page.dart';
import 'package:ytresxcvbnm/pages/import_image_page_file.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  late File _file;
  String _text = '';
  String? _fileName;
  final _passwordController = TextEditingController();
  String passwordToEncrypt = "";
  late File fileToEncrypt;

  Future<void> _importFile() async {
    // Show file picker dialog
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'], // Only allow text files to be picked
    );

    if (result != null) {
      // Get file path from result
      final path = result.files.single.path!;

      // Create file object
      _file = File(path);

      try {
        // Read contents of file
        final contents = await _file.readAsString();

        setState(() {
          _fileName = result.files.single.name;
          _text = contents;
        });
      } catch (e) {
        print('Error reading file: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.I.M.P'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _importFile,
              child: const Text(
                'Import Text File',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            if (_fileName != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Selected file: $_fileName',
                  style: const TextStyle(fontSize: 26),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // tuk trqbva da e vruzkata s algorituma
                passwordToEncrypt = _passwordController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImportImagePageFile(
                              fileToEncrypt: fileToEncrypt,
                              passwordToEncrypt: passwordToEncrypt,
                            )));
              },
              child: const Text("Convert", style: TextStyle(fontSize: 28)),
            ),
          ],
        ),
      ),
    );
  }
}
