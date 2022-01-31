import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/screens/screens.dart';
import 'package:herd/widgets/user_profile_image.dart';

class TextPost extends StatelessWidget {
  final Post post;
  const TextPost({
    Key key,
    @required this.post,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          color: Colors.black,
          shadowColor: Colors.white10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: const Color(0xffffe7c2), width: 5),
            borderRadius: BorderRadius.circular(25),
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
                            post.author.username,
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
                      Row(
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
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
