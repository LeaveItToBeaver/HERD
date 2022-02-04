import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/widgets/post_information_new.dart';
import 'package:herd/widgets/post_operation_text_widget.dart';

class TextPost extends StatelessWidget {
  final Post post;
  const TextPost({
    Key key,
    @required this.post,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 1,
          color: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 4),
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
                child: PostOperationText(post: post),
              ),

            ],
          ),
        ),
      );
  }
}
