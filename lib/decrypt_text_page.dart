import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/home_page.dart';
import 'package:ytresxcvbnm/pages/import_image_page.dart';

class DecryptTextPage extends StatefulWidget {
  const DecryptTextPage({super.key});

  @override
  State<DecryptTextPage> createState() => _DecryptTextPageState();
}

class _DecryptTextPageState extends State<DecryptTextPage> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
            MaterialButton(
              onPressed: () {
                setState(() {
                  textToEncrypt = _textController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                });
              },
              color: Colors.blue,
              child: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
