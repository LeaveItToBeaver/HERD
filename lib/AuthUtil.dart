import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//https://www.youtube.com/watch?v=oJ5Vrya3wCQ <= this

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<String> signIn({ String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

  Future<void> userSetup(String email, String password, String birthday, String firstName, String lastName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    users.add({
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'email': email,
      'password': password,
      'uid': uid,
    });
    return;
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