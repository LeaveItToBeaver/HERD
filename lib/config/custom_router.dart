import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/screens/edit_profile/edit_profile_screen.dart';
import 'package:herd/screens/login/login_screen.dart';
import 'package:herd/screens/nav/nav_screen.dart';
import 'package:herd/screens/profile/profile_screen.dart';
import 'package:herd/screens/resetpassword/reset_pass_screen.dart';
import 'package:herd/screens/screens.dart';
import 'package:herd/screens/splash/splash_screen.dart';

class CustomRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold()
    );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case ResetPassScreen.routeName:
        return ResetPassScreen.route();
      case NavScreen.routeName:
        return NavScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings){
    print('Nested Route: ${settings.name}');
    switch (settings.name) {
      case ProfileScreen.routeName:
        return ProfileScreen.route(args: settings.arguments);
      case EditProfileScreen.routeName:
        return EditProfileScreen.route(args: settings.arguments);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something Went Wrong!'),
        ),
      ),
    );
  }
}