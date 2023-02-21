import 'package:flutter/material.dart';

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
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.cyanAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
  ];

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
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ));
  }
}
