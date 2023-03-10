import 'package:flutter/material.dart';
import 'package:insta/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  final double menuWidth;
  const ProfileSideMenu(this.menuWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          children: [
            const Text(
              'Setting',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.black87),
              title: const Text('Sign out'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AuthScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
