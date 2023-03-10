import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/import_image_page.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final _textController = TextEditingController();

  String textToEncrypt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.I.M.P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    color: Colors.black87,
                    child: const Center(
                      child: Text(
                        "Please input the message you want to encrypt down below",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Input text here',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear))),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  textToEncrypt = _textController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImportImagePage()));
                });
              },
              color: Colors.blue,
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
