import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';
import 'package:insta/const/screen_size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool leftSelected = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _userbio(),
              _editProfileBtn(),
              _tabButtons(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment:
                    leftSelected ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  height: 3,
                  width: screenSize!.width / 2,
                  color: Colors.black,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Row _tabButtons() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                leftSelected = true;
                print('grid btn');
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/grid.png'),
              color: leftSelected ? Colors.black : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                leftSelected = false;
                print('saved btn');
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/saved.png'),
              color: leftSelected ? Colors.black26 : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

Padding _editProfileBtn() {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: common_gap, vertical: common_xxx_gap),
    child: SizedBox(
      height: 24,
      child: OutlinedButton(
        onPressed: () {
          print('edit Profile');
        },
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: Colors.black45),
        )),
        child: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    ),
  );
}

Widget _username() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: common_gap),
    child: Text(
      'myUsername',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

Widget _userbio() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: common_gap),
    child: Text(
      'This is what I believe!',
      style: TextStyle(fontWeight: FontWeight.w400),
    ),
  );
}
