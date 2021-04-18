import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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