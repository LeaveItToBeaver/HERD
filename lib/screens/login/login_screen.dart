import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:herd/screens/resetpassword/reset_pass_screen.dart';
import 'package:herd/screens/signup/signup_screen.dart';
import 'package:herd/widgets/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (context, _, __) => BlocProvider<LoginCubit>(
        create: (_) =>
            LoginCubit(authRepository: context.read<AuthRepository>()),
        child: LoginScreen(),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    bool loginErr = false;

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state.status == LoginStatus.error) {
            loginErr = true;
          }
        }, builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                //Animation
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_0(
                    size: size,
                    yOffset: size.height / 2.170,
                    color: Color(0xff88b388),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeInOut,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_1(
                    size: size,
                    yOffset: size.height / 2.130,
                    color: Color(0xffa488b3),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad,
                  top: keyboardOpen ? -size.height / 3.7 : 0.0,
                  child: WaveWidget_0(
                    size: size,
                    yOffset: size.height / 2.120,
                    color: Color(0xffc2ffc2),
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
                      elevation: 10,
                      borderOnForeground: false,
                      color: Color(0xff88b388).withAlpha(20),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2),
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
                                'Login',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12.0),

                              ///Email Text Box
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xffc2ffc2), width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
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
                                    color: Colors.white,
                                  ),
                                ),
                                onChanged: (value) => context
                                    .read<LoginCubit>()
                                    .emailChanged(value),
                                validator: (value) => !value.contains(value)
                                    ? 'Please enter a valid email.'
                                    : null,
                              ),
                              const SizedBox(height: 17.0),

                              ///Password Text Box
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  obscureText: true,
                                  decoration: loginErr
                                      ? InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xffc2ffc2),
                                                width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xffc2ffc2),
                                                width: 2.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2.0),
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
                                            color: Colors.white,
                                          ),
                                        )
                                      : InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xffc2ffc2),
                                                width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2.0),
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
                                            color: Colors.white,
                                          ),
                                        ),
                                  onChanged: (value) => context
                                      .read<LoginCubit>()
                                      .passwordChanged(value),
                                  validator: (value) =>
                                      loginErr || value.length < 6
                                          ? 'Email or Password is incorrect.'
                                          : null,
                                ),
                              ),
                              //SizedBox(height: 5.0),
                              ///Forgot Password Button
                              Container(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(ResetPassScreen.routeName),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                ),
                              ),

                              Container(
                                child: Card(
                                  elevation: 0,
                                  shadowColor: Colors.black,
                                  borderOnForeground: false,
                                  color: Color(0xffc2ffc2),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(55),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
//Sign In Button
                                            Container(
                                              child: SizedBox(
                                                width: 95,
                                                height: 45,
                                                child: TextButton(
                                                  child: Text(
                                                    'Sign In',
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
                                                      state.status ==
                                                          LoginStatus
                                                              .submitting),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 24.0),

                                            ///Register Button
                                            Container(
                                              child: SizedBox(
                                                width: 95,
                                                height: 45,
                                                child: TextButton(
                                                  child: Text(
                                                    'Register',
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
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              SignupScreen
                                                                  .routeName),
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

  void _submitForm(BuildContext context, bool isSubmitting) {
    if (_formKey.currentState.validate() && !isSubmitting) {
      context.read<LoginCubit>().loginInWithCredentials();
    }
  }
}
