import 'package:flutter/material.dart';
import 'package:insta/const/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          width: screenSize!.width,
          height: screenSize!.width,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              print('button Take tabbed');
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(color: Colors.black12, width: 20),
            ),
            child: const Text(
              '                             ',
            ),
          ),
        ),
        //     child: InkWell(
        //   onTap: () {},
        //   child: Padding(
        //     padding: const EdgeInsets.all(common_s_gap),
        //     child: Container(
        //       decoration: const ShapeDecoration(
        //           shape: CircleBorder(
        //               side: BorderSide(
        //         color: Colors.black12,
        //         width: 20,
        //       ))),
        //     ),
        //   ),
        // ))
      ],
    );
  }
}
