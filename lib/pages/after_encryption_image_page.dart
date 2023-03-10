import 'package:flutter/material.dart';
import 'package:ytresxcvbnm/pages/home_page.dart';

class AfterEncryptionImagePage extends StatefulWidget {
  const AfterEncryptionImagePage({super.key});

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
            const Center(
              child: Text(
                "Press the download button to aquare your image",
                style: TextStyle(fontSize: 26, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: const Text("Download", style: TextStyle(fontSize: 26)),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("Home", style: TextStyle(fontSize: 26)),
              )),
            ),
          ],
        ));
  }
}



//kak se vzima image ot folder/file/slashtam tam kvot e 
// download opciq
// return home buton