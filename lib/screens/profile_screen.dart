import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _username(),
                      _userbio(),
                      _editProfileBtn(),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
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
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
