import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta/widgets/comment.dart';
import 'package:insta/widgets/rounded_avatar.dart';

import '../const/common_size.dart';
import 'my_progress_Indicator.dart';

class Post extends StatelessWidget {
  final int index;

  const Post(
    this.index, {
    super.key,
  });

// flutter pub add cached_network_image
// https://picsum.photos

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(size),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Widget _postCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxx_gap),
      child: Comment(
        showImage: false,
        username: "young",
        text: "adgfadfaertwer",
      ),
    );
  }

  Padding _postLikes() {
    return const Padding(
      padding: EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: const [
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/comment.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
          color: Colors.black87,
        ),
        Spacer(),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/heart_selected.png')),
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(common_xxx_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text("username")),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            )),
      ],
    );
  }

  CachedNetworkImage _postImage(Size size) {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/200/200",
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(
          containerSize: size.width,
        );
      },
      imageBuilder: (BuildContext, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
