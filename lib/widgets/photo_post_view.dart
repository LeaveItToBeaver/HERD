import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:herd/extensions/date_time_extension.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/screens/screens.dart';
import 'package:herd/widgets/user_profile_image.dart';
import 'dart:io';

class PhotoPost extends StatelessWidget {
  final Post post;
  final String photoImageURL;
  final File photoFile;
  final bool isLiked;
  final bool isDisliked;

  const PhotoPost({
    Key key,

    @required this.post,
    @required this.photoImageURL,
    this.photoFile,
    @required this.isLiked,
    @required this.isDisliked,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: Colors.greenAccent,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          ProfileScreen.routeName,
                          arguments: ProfileScreenArgs(userId: post.author.id),
                        ),
                        child: UserProfileImage(
                          radius: 25,
                          profileImageUrl: post.author.profileImageURL,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              post.author.username,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              post.date.timeAgo(),
                            ),
                          ],  // children
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              constraints: new BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width - 100,
                              ),
                                child: Text(
                                  post.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        height: MediaQuery.of(context).size.height / 2.25,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: photoFile != null
                            ? FileImage(photoFile)
                            : photoImageURL.isNotEmpty
                            ? CachedNetworkImageProvider(photoImageURL)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.greenAccent,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 4,
                      color: Colors.greenAccent,
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
                      elevation: 4,
                      color: Colors.greenAccent,
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
                      elevation: 4,
                      color: Colors.greenAccent,
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
                      elevation: 4,
                      color: Colors.greenAccent,
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
                      elevation: 4,
                      color: Colors.greenAccent,
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
            ],
          ),
          ),
        ),
      ],
    );
  }
}