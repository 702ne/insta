import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';
import 'package:insta/const/screen_size.dart';

enum SelectedTab { left, right }

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;

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
              _selectedIndicator()
            ]),
          ),
          _imagesPager()
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: imagesGrid(),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(
                _leftImagesPageMargin + screenSize!.width, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: imagesGrid(),
          ),
        ],
      ),
    );
  }

  GridView imagesGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(
          30,
          (index) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://picsum.photos/id/$index/100/100",
              )),
    );
  }

  AnimatedContainer _selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: screenSize!.width / 2,
        color: Colors.black,
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
                _selectedTab = SelectedTab.left;
                _leftImagesPageMargin = 0;
                print('grid btn');
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/grid.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
                _leftImagesPageMargin = -screenSize!.width;
                print('saved btn');
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/saved.png'),
              color: _selectedTab == SelectedTab.right
                  ? Colors.black
                  : Colors.black26,
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
