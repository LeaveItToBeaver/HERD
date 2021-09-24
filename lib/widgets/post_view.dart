import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/screens/edit_profile/edit_profile_screen.dart';
import 'package:herd/screens/profile/profile_screen.dart';
import 'package:herd/widgets/user_profile_image.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.cyan,
          shadowColor: Colors.white10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        ProfileScreen.routeName,
                      arguments: ProfileScreenArgs(userId: post.author.id),
                    ),
                    child: UserProfileImage(
                      radius: 20,
                      profileImageUrl: post.author.profileImageURL,
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
                            post.caption,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            post.author.username,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            post.author.firstName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            post.author.lastName,
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
        ),
      ],
    );
  }
}
