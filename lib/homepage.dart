import 'package:flutter/material.dart';
import 'package:insta/const/screen_size.dart';
import 'package:insta/screens/profile_screen.dart';

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

  void _onBtnItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenSize ??= MediaQuery.of(context).size;

    return Scaffold(
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
}
