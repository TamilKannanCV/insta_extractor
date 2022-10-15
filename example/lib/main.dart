import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insta_extractor/insta_extractor.dart';
import 'package:insta_extractor_example/keys.dart';

Future<void> main() async {
  runApp(
    const MaterialApp(
      home: MainApp(),
    ),
  );
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
          child: const Text("Click me!"),
          onPressed: () async {
            await InstaExtractor.setCookies(
              userId: Keys.userId,
              sessionId: Keys.sessionId,
              csrftoken: Keys.csrftoken,
            );
            await InstaExtractor.getDetails(
              Keys.sample,
            ).then((value) {
              log(value.runtimeType.toString());
              log("success");
            }).catchError((err) {
              log(err.toString());
            });
          },
        ),
      ),
    );
  }
}
