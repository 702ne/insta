import 'package:flutter/material.dart';
import 'package:insta/const/screen_size.dart';
import 'package:insta/widgets/profile_body.dart';

enum MenuStatus { opened, closed }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final aniDuration = const Duration(milliseconds: 300);

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPos = 0;
  double menuXPos = screenSize!.width;
  double menuWidth = screenSize!.width / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: aniDuration,
            transform: Matrix4.translationValues(bodyXPos, 0, 0),
            child: ProfileBody(onMenuChanged: () {
              setState(() {
                _menuStatus = (_menuStatus == MenuStatus.closed)
                    ? MenuStatus.opened
                    : MenuStatus.closed;
                switch (_menuStatus) {
                  case MenuStatus.opened:
                    bodyXPos = -menuWidth;
                    menuXPos = screenSize!.width - menuWidth;
                    break;
                  case MenuStatus.closed:
                    bodyXPos = 0;
                    menuXPos = screenSize!.width;
                    break;
                }
              });
            }),
          ),
          AnimatedContainer(
            duration: aniDuration,
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            child: Positioned(
              top: 0,
              bottom: 0,
              width: menuWidth,
              child: Container(
                color: Colors.amberAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
