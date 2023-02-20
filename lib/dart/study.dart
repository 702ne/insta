import 'package:flutter/material.dart';

class codes extends StatelessWidget {
  codes({super.key, required this.title});
  final String title;
  final List<String> flying = ['Saturn', 'Jupiter', 'Mercury'];
  final Map<String, Object> who = {'name': 'Young Park', 'age': 51};

  @override
  Widget build(BuildContext context) {
    print(flying);
    print(flying.length);
    return Text(title);
  }
}
