import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';

class CaptionWidget extends StatelessWidget {
  final Post post;
  const CaptionWidget({@required this.post, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.caption.isNotEmpty) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  post.caption,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (post.caption.isEmpty) {
      return Container();
    }
  }
}
