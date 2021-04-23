import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:herd/widgets/wave_widget_0.dart';
import 'package:herd/widgets/wave_widget_1.dart';
import 'package:wave/config.dart';
//import 'package:wave/wave.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubit/signup_cubit.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) =>
          BlocProvider<SignupCubit>(
            create: (_) =>
                SignupCubit(authRepository: context.read<AuthRepository>()),
            child: SignupScreen(),
          ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
          if (state.status == SignupStatus.error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(state.failure.message),
              ),
            );
          }
        }, builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_0(
                    size: size,
                    yOffset: size.height / 2.170,
                    color: Colors.red,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeInOut,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_1(
                    size: size,
                    yOffset: size.height / 2.130,
                    color: Colors.yellow,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_0(
                    size: size,
                    yOffset: size.height / 2.120,
                    color: Colors.indigoAccent,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeInOut,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_1(
                    size: size,
                    yOffset: size.height / 2.070,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(22.0),
                    child: Card(
                      elevation: 2,
                      borderOnForeground: false,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white60.withAlpha(50), width: 2),
                        borderRadius: BorderRadius.circular(55),
                      ),
                      shadowColor: Colors.indigoAccent.withAlpha(40),
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
                                'Sign Up',
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
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 2.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  ),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) => context
                                    .read<SignupCubit>()
                                    .usernameChanged(value),
                                validator: (value) => value.trim().isEmpty
                                    ? 'Please enter a valid username.'
                                    : null,
                              ),
                              const SizedBox(height: 12.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 2.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) => context
                                    .read<SignupCubit>()
                                    .emailChanged(value),
                                validator: (value) => !value.contains(value)
                                    ? 'Please enter a valid email.'
                                    : null,
                              ),
                              const SizedBox(height: 12.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 2.0),
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
                                  onChanged: (value) => context
                                      .read<SignupCubit>()
                                      .passwordChanged(value),
                                  validator: (value) => value.length < 6
                                      ? 'Password or Email is incorrect.'
                                      : null,
                                ),
                              ),
                              //SizedBox(height: 5.0),
                              Container(
                                child: Card(
                                  elevation: 5,
                                  borderOnForeground: false,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.indigo.withAlpha(20),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(55),
                                  ),
                                  shadowColor: Colors.indigo.withAlpha(15),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: SizedBox(
                                                width: 95,
                                                height: 45,
                                                child: TextButton(
                                                  child: Text(
                                                    'Sign Up',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(
                                                        Colors.white),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(25.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () => _submitForm(
                                                      context,
                                                      state.status == SignupStatus.submitting),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 24.0),
                                            Container(
                                              child: SizedBox(
                                                width: 95,
                                                height: 45,
                                                child: TextButton(
                                                  child: Text(
                                                    'Back',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(
                                                        Colors.white
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(25.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () => Navigator.of(context).pop(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          );
        }),
      ),
    );
  }

  void _submitForm(BuildContext context, bool isSubmitting){
    if (_formKey.currentState.validate() && !isSubmitting){
      context.read<SignupCubit>().signUpInWithCredentials();
    }
  }
}