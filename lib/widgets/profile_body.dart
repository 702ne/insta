import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';
import 'package:insta/const/screen_size.dart';
import 'package:insta/widgets/rounded_avatar.dart';

import '../screens/profile_screen.dart';

enum SelectedTab { left, right }

class ProfileBody extends StatefulWidget {
  final Function onMenuChanged;
  const ProfileBody({
    super.key,
    required this.onMenuChanged,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController =
        AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _activityDetail(),
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
          ),
        ],
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
          'The Young\'s best app',
          textAlign: TextAlign.center,
        )),
        IconButton(
          onPressed: () {
            widget.onMenuChanged();
            _iconAnimationController.status == AnimationStatus.completed
                ? _iconAnimationController.reverse()
                : _iconAnimationController.forward();
          },
          icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _iconAnimationController),
        ),
      ],
    );
  }

  Row _activityDetail() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(common_gap),
          child: RoundedAvatar(
            size: 800,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: common_gap),
            child: Table(
              children: [
                TableRow(children: [
                  _tableValueText('12134'),
                  _tableValueText('324532'),
                  _tableValueText('2185'),
                ]),
                TableRow(children: [
                  _tableLabelText('Post'),
                  _tableLabelText('Followers'),
                  _tableLabelText('Following'),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }

  Text _tableLabelText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
    );
  }

  Text _tableValueText(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: imagesGrid(),
          ),
          AnimatedContainer(
            duration: duration,
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
      duration: duration,
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
              _tabClicked(SelectedTab.left);
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
              _tabClicked(SelectedTab.right);
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

  _tabClicked(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagesPageMargin = 0;
          print('>>> left button clicked');
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagesPageMargin = -screenSize!.width;
          print('>>> right button clicked');
          break;
      }
    });
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
