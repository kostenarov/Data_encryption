import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/import_image_page.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();

  String textToEncrypt = "";
  String passwordToEncrypt = "";

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
                        "Please input the message you want to encrypt and your password",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
            MaterialButton(
              onPressed: () async {
                setState(() {
                  textToEncrypt = _textController.text;
                  passwordToEncrypt = _passwordController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImportImagePage(
                              textToEncrypt: textToEncrypt,
                              passwordToEncrypt: passwordToEncrypt,
                            )),
                  );
                });
              },
              color: Colors.blue,
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
