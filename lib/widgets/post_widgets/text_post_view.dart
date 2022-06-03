import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/widgets/post_widgets/post_information.dart';
import 'package:herd/widgets/post_widgets/post_operation_text_widget.dart';

import 'caption_widget.dart';

class TextPost extends StatelessWidget {
  final Post post;
  final bool isLiked;
  final bool isDisliked;

  const TextPost({
    Key key,
    @required this.post,
    @required this.isLiked,
    @required this.isDisliked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        color: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NewPostInformation(post: post),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: CaptionWidget(post: post),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: PostOperationText(post: post),
            ),
          ],
        ),
      ),
    );
  }
}
