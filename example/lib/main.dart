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
                await InstaExtractor.setCookies(
                    userId: "34403629527",
                    sessionId: "34403629527%3AJU9bd3SK39IlBc%3A17",
                    csrftoken: "csrftoken");
                final storyDetails = await InstaExtractor.getStories(
                        "https://instagram.com/stories/tamilkannan2020/2694928029300261989?utm_medium=share_sheet")
                    .then((value) {
                  log("success");
                }).catchError((e) {
                  log(e.toString());
                });
              })),
    );
  }
}
