import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/screens/screens.dart';
import 'package:herd/widgets/user_profile_image.dart';
import 'package:herd/models/comment_model.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  const CommentView({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pinkAccent,
      shadowColor: Colors.white10,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  ProfileScreen.routeName,
                  arguments: ProfileScreenArgs(userId: comment.author.id),
                ),
                child: UserProfileImage(
                  radius: 20,
                  profileImageUrl: comment.author.profileImageURL,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        comment.author.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],  // children
                  ),
                  Row(
                    children: [
                      Text(
                        comment.author.firstName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        comment.author.lastName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  Container(

                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
