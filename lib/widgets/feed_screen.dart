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
      body: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: 30,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      height: 100,
    );
  }
}
