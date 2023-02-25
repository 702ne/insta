import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double progressSize;
  final double containerSize;

  const MyProgressIndicator(
      {super.key, required this.containerSize, this.progressSize = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerSize,
      width: containerSize,
      child: Center(
        child: SizedBox(
            height: progressSize,
            width: progressSize,
            child: Image.asset('assets/images/loading_img.gif')),
      ),
    );
  }
}
