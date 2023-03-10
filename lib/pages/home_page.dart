import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/decrypt_page.dart';

import 'file_page.dart';
import 'text_page.dart';
import 'decrypt_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('S.I.M.P'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Please input the message you want to encrypt down below",
                style: TextStyle(fontSize: 26, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextPage()));
                },
                child:
                    const Text("Import Text", style: TextStyle(fontSize: 26)),
              )),
            ),
            // nameri kak se importva txt file
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilePage()));
                },
                child:
                    const Text("Import File", style: TextStyle(fontSize: 26)),
              )),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DecryptPage()));
              },
              child: const Text("Import directory"),
            )),
          ],
        ));
  }
}
