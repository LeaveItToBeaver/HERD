import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herd/config/custom_router.dart';
import 'package:herd/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Herd());
}

class Herd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: CustomRouter.onGeneratedRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}