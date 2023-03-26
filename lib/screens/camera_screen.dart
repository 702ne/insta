import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.cyanAccent,
          ),
          Container(
            color: Colors.amberAccent,
          ),
          Container(
            color: Colors.greenAccent,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'Gallery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'Photo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'Video'),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(int index) {
    return setState(() {
      _currentIndex = index;
    });
  }
}
