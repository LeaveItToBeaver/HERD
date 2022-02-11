import 'package:flutter/material.dart';
import 'package:herd/extensions/date_time_extension.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/screens/profile/profile_screen.dart';
import 'package:herd/widgets/user_widgets/user_profile_image.dart';

class NewPostInformation extends StatelessWidget {
  final Post post;
  const NewPostInformation({
    @required this.post,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(2),
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
          Expanded(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          post.author.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          post.date.timeAgo(),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            post.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
