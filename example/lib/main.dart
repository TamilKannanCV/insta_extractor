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
                final storyDetails = await InstaExtractor.getStories(
                        "https://instagram.com/stories/xxxyyyzzz/2694xxxyyyzzz61989?utm_medium=share_sheet")
                    .then((value) {
                  log("success");
                }).catchError((e) {
                  log(e.toString());
                });
              })),
    );
  }
}
