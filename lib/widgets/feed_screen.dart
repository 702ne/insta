import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Instagram",
        style: TextStyle(fontFamily: "VeganStyle", color: Colors.black87),
      )),
    );
  }
}
