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
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0,),
        Text(
          bio,
          maxLines: 10,
          style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'OpenSans',
            color: Colors.black
          ),
        ),
        const Divider(
          color: Colors.transparent,
          thickness: 0,
        ),
      ],
    );
  }
}