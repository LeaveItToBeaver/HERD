import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:wave/config.dart';
import 'package:herd/widgets/widgets.dart';

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
  var _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    Pattern passCheck =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
    Pattern emailCheck =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExEmail = new RegExp(emailCheck);
    RegExp regexPass = new RegExp(passCheck);

    return WillPopScope(
      onWillPop: () async => false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
            if (state.status == SignupStatus.error) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                  content: state.failure.message,
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
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(22, 22, 22, bottom),
                        child: Card(
                          elevation: 2,
                          borderOnForeground: false,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white60.withAlpha(50), width: 2
                            ),
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
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          height: 45,
                                          child: TextFormField(
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
                                              labelText: 'First Name',
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'OpenSans',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onChanged: (value) => context
                                                .read<SignupCubit>()
                                                .firstNameChanged(value),
                                            validator: (value) => value.trim().isEmpty
                                                ? null
                                                : null,
                                          ),
                                        ),
                                        SizedBox(width: 12,),
                                        SizedBox(
                                          width: 120,
                                          height: 45,
                                          child: TextFormField(
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
                                              labelText: 'Last Name',
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'OpenSans',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onChanged: (value) => context
                                                .read<SignupCubit>()
                                                .lastNameChanged(value),
                                            validator: (value) => value.trim().isEmpty
                                                ? null
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
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
                                    validator: (value) => !regExEmail.hasMatch(value)
                                        ? 'Please enter a valid email.'
                                        : null,
                                  ),
                                  const SizedBox(height: 12.0),
                                  Container(
                                    child: TextFormField(
                                      key: _passKey,
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
                                      //One lower,
                                      //One Upper,
                                      //One Digit,
                                      //One Special Char
                                      //at least 6 chars in length
                                      validator: (value) => !regexPass.hasMatch(value)
                                          ? 'Password not secure.'
                                          : null,
                                    ),
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
                                        labelText: 'Confirm Password',
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
                                      //One lower,
                                      //One Upper,
                                      //One Digit,
                                      //One Special Char
                                      //at least 6 chars in length
                                      validator: (value) => value != _passKey.currentState.value
                                          ? 'Passwords fo not match.'
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