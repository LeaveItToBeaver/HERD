import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herd/AuthUtil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:herd/Login.dart';

import 'UserMainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(herd());
}

class herd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MultiProvider(
     providers: [
       Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
       ),
       StreamProvider(
           create: (context) => context.read<AuthenticationService>().authStateChanges,
       ),
     ],
     child: MaterialApp(
       title: 'HERD',
       debugShowCheckedModeBanner: false,
       home: AuthenticationWrapper(),
     ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null){
      return UserMainScreen();
    }
    return LoginScreen();
  }
}