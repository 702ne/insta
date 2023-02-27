import 'package:flutter/material.dart';
import 'package:insta/widgets/rounded_avatar.dart';

import '../const/common_size.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String username, text;
  final DateTime? dateTime;

  const Comment(
      {super.key,
      this.showImage = true,
      required this.username,
      required this.text,
      this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage) const RoundedAvatar(size: 24),
        if (showImage) const SizedBox(width: common_xxx_gap),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
                const TextSpan(text: ' '),
                TextSpan(
                    text: text, style: const TextStyle(color: Colors.black87))
              ]),
            ),
            if (dateTime != null)
              Text(
                dateTime!.toIso8601String(),
                style: TextStyle(color: Colors.grey[600]),
              )
          ],
        ),
      ],
    );
  }
}
