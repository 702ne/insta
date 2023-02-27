import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
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
