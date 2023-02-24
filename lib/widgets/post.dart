import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/2000/3000",
      placeholder: (BuildContext context, String url) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black87,
              ),
            ),
          ),
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
