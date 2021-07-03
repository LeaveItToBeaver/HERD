import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String username;
  final String bio;

  const ProfileInfo({
    Key key,
    this.username,
    this.bio
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.0,),
        Text(
          bio,
          style: const TextStyle(
            fontSize: 15.0,

          ),
        ),
        const Divider(),
      ],
    );
  }
}