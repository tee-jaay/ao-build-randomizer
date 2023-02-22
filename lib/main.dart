import 'package:flutter/material.dart';

import 'widgets/randomizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Randomizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Randomizer(),
    );
  }
}
