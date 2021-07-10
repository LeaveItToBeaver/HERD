import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/screens/profile/widgets/profile_button.dart';

class ProfileStats extends StatelessWidget {
  final bool isCurrentUser;
  final bool isFollowing;
  final int posts;
  final int followers;
  final int following;

  const ProfileStats({
    Key key,
    @required this.isCurrentUser,
    @required this.isFollowing,
    @required this.posts,
    @required this.followers,
    @required this.following
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Stats(count: posts, label: 'Posts',),
                _Stats(count: followers, label: 'Followers',),
                _Stats(count: following, label: 'Following',),
              ],
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ProfileButton(
                isCurrentUser: isCurrentUser,
                isFollowing: isFollowing,
              ),
            ),
          ],
        ),
    );
  }
}

class _Stats extends StatelessWidget {
  final int count;
  final String label;

  const _Stats({
    Key key,
    this.count,
    this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 10,),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'OpenSans',
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'OpenSans',
              color: Colors.white,
            ),
          ),
        ]
    );
  }
}