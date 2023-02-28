import 'package:flutter/material.dart';
import 'package:insta/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            const ProfileBody(),
          ],
        ),
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        const SizedBox(
          width: 44,
        ),
        const Expanded(
            child: Text(
          'The Youngs best app',
          textAlign: TextAlign.center,
        )),
        IconButton(
          onPressed: () {
            print('profile');
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
