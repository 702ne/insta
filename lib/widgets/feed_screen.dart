import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.camera,
              color: Colors.black87,
            )),
        middle: const Text(
          "Instagram",
          style: TextStyle(fontFamily: "VeganStyle", color: Colors.black87),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            IconButton(
                onPressed: null,
                icon: ImageIcon(
                  AssetImage('assets/images/actionbar_camera.png'),
                  color: Colors.black87,
                )),
            IconButton(
                onPressed: null,
                icon: ImageIcon(
                  AssetImage('assets/images/actionbar_camera.png'),
                  color: Colors.black87,
                )),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: 30,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      height: 100,
    );
  }
}
