import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMainScreen extends StatefulWidget {
  @override
  _UserMainScreen createState() => _UserMainScreen();
}

class _UserMainScreen extends State<UserMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF550723),
                    Color(0xFF8E1843),
                    Color(0xFFFF6060),
                  ],
                  stops: [0.1, 0.3, 0.7],
                )),
          ),
        ],
      ),
    );
  }
}