import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'InfoValidation.dart';
import 'SignUpPersonal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herd/AuthUtil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'UserMainScreen.dart';

class SignUpScreenEmail extends StatefulWidget {
  @override
  _SignUpScreenEmail createState() => _SignUpScreenEmail();
}

class _SignUpScreenEmail extends State<SignUpScreenEmail> {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
                    child: Text(
                      'Welcome! \n'
                      'Let\'s learn about you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                    child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          labelText: 'Email',
                          //errorText: isEmail != null ? null : 'This is not a valid email.',
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value.isNotEmpty && value.contains("@")) {
                            var splitEmail = value.split("@");
                            print("split length is ${splitEmail.length}");
                            if (splitEmail.length == 2) {
                              var firstHalf = splitEmail[0];
                              var secondHalf = splitEmail[1];

                              print("first half is $firstHalf with length of ${firstHalf.length}");
                              print("second half is $secondHalf with length of ${secondHalf.length}");

                              var secondHalfSplit = secondHalf.split(".");
                              print("second half split length is ${secondHalfSplit.length}");
                              print("second half 1 is [${secondHalfSplit[0]}] ");

                              if (!secondHalf.contains(".") ||
                                  secondHalf.length < 3 ||
                                  secondHalfSplit.length != 2 ||
                                  secondHalfSplit[0].isEmpty ||
                                  secondHalfSplit[1].isEmpty) {
                                return "Please enter a valid email";
                              }

                              if (firstHalf.length < 3) {
                                return "Please enter a valid email";
                              }
                            } else {
                              return "Please enter a valid email";
                            }
                          }

                          if (value.isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".") ||
                              value.length < 6) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ButtonTheme(
                      minWidth: 150,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () async {
                          try {
                            UserCredential user = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text).then((result) {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(result.user.uid)
                                          .set({
                                        'email': emailController.text,
                                        "uid": result.user.uid
                                      });
                              }).then((success)
                              { Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                builder: (context) => SignUpScreenPersonal()),
                              );
                              return;
                            });
                            } on FirebaseException catch (e) {
                              print(e);
                              /*emailController.text = "";
                              passwordController.text = "";
                              confirmPasswordController.text = "";*/
                            }
                        },
                        shape: const StadiumBorder(),
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Next'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
