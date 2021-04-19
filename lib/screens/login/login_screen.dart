import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  
  static Route route(){
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (_, __, ___,) => LoginScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Login Screen'),
    );
  }
}