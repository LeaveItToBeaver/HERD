import 'package:flutter/material.dart';
import 'caption_widget.dart';
import 'package:herd/models/models.dart';

class PostOperation extends StatelessWidget {
  final Post post;
  const PostOperation({@required this.post, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
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
                      child: Row(
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
                Container(
                  height: 50,
                  width: 50,
                  child: Card(
                    elevation: 1,
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
                          iconSize: 20,
                          onPressed: () => {},
                          icon: Icon(Icons.share_rounded),
                        )),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: Card(
                    elevation: 1,
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
                          iconSize: 20,
                          onPressed: () => {},
                          highlightColor: Colors.transparent,
                          icon: Icon(Icons.comment_rounded),
                        )),
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xffc2ffc2),
                        const Color.fromARGB(255, 218, 237, 218)
                      ]),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffc2ffc2),
                    ),
                    child: Row(children: [
                      Container(
                        child: Ink(
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              iconSize: 20,
                              onPressed: () => {},
                              icon: Icon(Icons.thumb_up_alt_rounded),
                            )),
                      ),
                      Container(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () => {},
                            icon: Icon(Icons.thumb_down_alt_rounded),
                          ),
                        ),
                      ),
                    ]),
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
