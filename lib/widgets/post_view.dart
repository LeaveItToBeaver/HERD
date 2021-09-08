import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
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
          color: Colors.black12,
          shadowColor: Colors.white10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  UserProfileImage(
                    radius: 20,
                    profileImageUrl: post.author.profileImageURL,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      post.author.firstName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
