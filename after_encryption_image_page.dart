import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/home_page.dart';
import 'dart:io';

class AfterEncryptionImagePage extends StatefulWidget {
  final String? imagePath;
  const AfterEncryptionImagePage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<AfterEncryptionImagePage> createState() =>
      _AfterEncryptionImagePageState();
}

class _AfterEncryptionImagePageState extends State<AfterEncryptionImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.I.M.P'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 180,
              color: Colors.white70,
              child: widget.imagePath != null
                  ? Image.file(File(widget.imagePath!))
                  : const SizedBox.shrink(),
            ),
          ),
          const Center(
            child: Text(
              "Press the download button to aquare your image",
              style: TextStyle(fontSize: 26, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Download", style: TextStyle(fontSize: 26)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text("Home", style: TextStyle(fontSize: 26)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
