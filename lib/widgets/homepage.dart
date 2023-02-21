import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> btmNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      label: "Account",
    )
  ];

  int _selectedIndex = 0;

  void _onBtnItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("영민")),
      bottomNavigationBar: BottomNavigationBar(
        items: btmNavItems,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: _selectedIndex,
        onTap: _onBtnItemClick,
      ),
      body: Container(
        color: Colors.amber.shade50,
        child: Column(
          children: const [
            Text("Young's note"),
            Image(
                image: NetworkImage(
                    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png")),
          ],
        ),
      ),
    );
  }
}
