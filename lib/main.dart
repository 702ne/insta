import 'package:flutter/material.dart';
import 'package:insta/const/material_white.dart';
import 'package:insta/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(), //AuthScreen(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
