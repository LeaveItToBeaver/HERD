import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//https://www.youtube.com/watch?v=oJ5Vrya3wCQ <= this

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthenticationService(FirebaseAuth instance);

  Future loginWithEmail({
    @required String email,
    @required String password
  }) async {
    try{
      var user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password
      );
    } catch(e){
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password
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
}


/*Future<void> userSetup(String username) async{
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
  'username': username,
  'uid': uid
  });
  return;
}*/