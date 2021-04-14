import 'package:flutter/material.dart';
import 'package:herd/Login.dart';
import 'package:herd/screens/login_screen.dart';

void main(){
  runApp(herd());
}

class herd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HERD',
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}