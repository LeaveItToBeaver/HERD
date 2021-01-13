import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AuthUtil.dart';

class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();

  validateAndSave(value){
    final FormState form = _formKey.currentState;
      if (value.isNotEmpty && value.contains("@")) {
        var splitEmail = value.split("@");
        print("split length is ${splitEmail.length}");
        if (splitEmail.length == 2) {
          var firstHalf = splitEmail[0];
          var secondHalf = splitEmail[1];

          print(
              "first half is $firstHalf with length of ${firstHalf.length}");
          print(
              "second half is $secondHalf with length of ${secondHalf.length}");

          var secondHalfSplit = secondHalf.split(".");
          print(
              "second half split length is ${secondHalfSplit.length}");
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
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
                  )
              ),
            ),

            Container(              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 120,
                  horizontal: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 30.0),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Email or phone number
                        Container(
                          //Email or phone number information
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
                              ),
                              labelText: 'Email ',
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

                          ),
                        ),
                        SizedBox(height: 25.0),
                        //Password
                        Container(
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
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
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

                        Container(
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
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
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
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50),
                        ButtonTheme(
                          minWidth: 150,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              validateAndSave(emailController);
                            },
                            shape: const StadiumBorder(),
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Next'),
                          ),
                        ),
                        SizedBox(height: 17),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}