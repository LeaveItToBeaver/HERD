import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          LoginScreen(),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color(0x000222),
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 2,
                borderOnForeground: false,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Colors.white60.withAlpha(50), width: 2),
                  borderRadius: BorderRadius.circular(55),
                ),
                shadowColor: Colors.deepPurple.withAlpha(60),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Herd',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
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
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) => print(value),
                          validator: (value) => !value.contains(value)
                              ? 'Please enter a valid email.'
                              : null,
                        ),
                        const SizedBox(height: 17.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
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
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 2.0),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) => print(value),
                            validator: (value) => value.length < 6
                                ? 'Please enter a valid email.'
                                : null,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          child: Card(
                            elevation: 10,
                            borderOnForeground: false,
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.purple.withAlpha(50), width: 2),
                              borderRadius: BorderRadius.circular(55),
                            ),
                            shadowColor: Colors.black87,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: SizedBox(
                                      width: 95,
                                      height: 45,
                                      child: TextButton(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.deepPurple),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => print('Login'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
                                  Container(
                                    child: SizedBox(
                                      width: 95,
                                      height: 45,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.deepPurple),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => print('Register'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
