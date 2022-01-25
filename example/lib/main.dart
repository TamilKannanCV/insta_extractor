import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insta_extractor/insta_extractor.dart';

void main() {
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
            final storyDetails = await InstaExtractor.getDetails(
                    "https://www.instagram.com/p/CZDsNYiJtxR/?utm_medium=copy_link")
                .then((value) {
              log(value.runtimeType.toString());
              log(value.carouselMedia!.length.toString());
              log("success");
            });
          },
        ),
      ),
    );
  }
}
