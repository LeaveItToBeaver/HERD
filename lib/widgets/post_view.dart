import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/screens/profile/profile_screen.dart';
import 'package:herd/widgets/photo_post_view.dart';
import 'package:herd/widgets/text_post_view.dart';
import 'package:herd/widgets/user_profile_image.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
      child: !post.isImage ? PhotoPost(
          post: post,
          photoImageURL: post.imageUrl,
        isLiked: false,
      )
        : TextPost(post: post),
    );
  }
}
