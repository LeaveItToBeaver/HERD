import 'package:flutter/material.dart';
import 'caption_widget.dart';
import 'package:herd/models/models.dart';


class PostOperation extends StatelessWidget {
  final Post post;
  const PostOperation({
    @required this.post,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color(0xffffe7c2),
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Card(
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                post.likes.toString() + " likes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post.commentNum.toString() + " comments",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.share_rounded),
                      )
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.comment_rounded),
                      )
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.arrow_upward_rounded),
                      )
                  ),
                ),

                Card(
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.arrow_downward_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),

          CaptionWidget(post: post),
        ],
      ),
    );
  }
}
