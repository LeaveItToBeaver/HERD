import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/screens/edit_profile/edit_profile_screen.dart';

class ProfileButton extends StatelessWidget {
  final bool isCurrentUser;
  final bool isFollowing;

  const ProfileButton({Key key, this.isCurrentUser, this.isFollowing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCurrentUser
        ? TextButton(
            onPressed: () => Navigator.of(context).pushNamed(
              EditProfileScreen.routeName,
              arguments: EditProfileScreenArgs(context: context),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Colors.blue[200], width: 3.0),
              )),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        : TextButton(
            onPressed: () {},
            style: isFollowing ? ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.blue[200], width: 3.0),
                  )
              ),
            ) : ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.red[200], width: 3.0),
                  )
              ),
            ),
            child: Text(
              isFollowing ? 'Follow' : 'Unfollow',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          );
  }
}
