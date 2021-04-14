import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserRepository(FirebaseAuth instance);

  Future loginWithEmail({
  @required String email,
    @required String password
  }) async {
    try{
      var user = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } catch(e){
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required email,
    @required password
  }) async {
    try{
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    return authResult.user != null;
    } catch(e){
      return e.message;
    }
  }

  Future signOut() async {
    return Future.wait([firebaseAuth.signOut()]);
  }

  Future getUser() async {
    return await firebaseAuth.currentUser;
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }
}