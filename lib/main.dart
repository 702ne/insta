import 'package:flutter/material.dart';
import 'package:insta/const/material_white.dart';
import 'package:insta/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthScreen(), //HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
