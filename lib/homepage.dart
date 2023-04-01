import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:insta/const/screen_size.dart';
import 'package:insta/screens/camera_screen.dart';
import 'package:insta/screens/profile_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/feed_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldMessengerState> _key =
      GlobalKey<ScaffoldMessengerState>();

  final List<BottomNavigationBarItem> btmNavItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
    const BottomNavigationBarItem(icon: Icon(Icons.healing), label: "Healing"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_box), label: "Account"),
  ];

  final List<Widget> _screens = <Widget>[
    const FeedScreen(),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.cyanAccent,
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    screenSize ??= MediaQuery.of(context).size;

    return Scaffold(
        key: _key,
        bottomNavigationBar: BottomNavigationBar(
          items: btmNavItems,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey.shade500,
          currentIndex: _selectedIndex,
          onTap: _onBtnItemClick,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ));
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context)) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const CameraScreen()));
    } else {
      SnackBar snackbar = SnackBar(
        content: const Text('사진, 파일, 마이크 접근을 허용해 주셔야 카메라 사용이 가능합니다'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            AppSettings.openLocationSettings();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //_key.currentState?.showSnackBar(snackbar);
    }
  }

  void _onBtnItemClick(int index) {
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        }
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> status =
        await [Permission.camera, Permission.microphone].request();
    bool permitted = true;

    status.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });

    return permitted;
  }
}
