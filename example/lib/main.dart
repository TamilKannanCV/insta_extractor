import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insta_extractor/insta_extractor.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              child: Text("Click me!"),
              onPressed: () async {
                final graphql = await InstaExtractor.getDetails(
                        "https://www.instagram.com/p/CVfozhNPFrB/?__a=1")
                    .then((value) {
                  log(value.shortcodeMedia.owner.username.toString());
                }).catchError((e) {
                  log(e.toString());
                });
              })),
    );
  }
}
