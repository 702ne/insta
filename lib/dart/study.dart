import 'package:flutter/material.dart';

class codes extends StatelessWidget {
  codes({super.key, required this.title});
  final String title;
  final List<String> flying = ['Saturn', 'Jupiter', 'Mercury'];
  final Map<String, Object> who = {'name': 'Young Park', 'age': 51};

  void listPrint(List text) {
    print("text: $text");
    print("length: ${text.length}");
  }

  void singlefunc(String text) => print("Text: $text");

  int func(int x) => x + 3;

  int runTwice(int x, Function f) {
    x = f(x);
    x = f(x);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    listPrint(flying);
    singlefunc(title);
    print(who);
    print("call function twice for 3 is ${runTwice(3, func)}");

    var numbers = List.generate(9, (i) => i + 2);
    print(numbers);

    return Text(title);
  }
}
