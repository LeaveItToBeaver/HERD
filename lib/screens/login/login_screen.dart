import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
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

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state.status == LoginStatus.error) {
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                content: state.failure.message,
              )
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
                                'Login',
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
                                    .read<LoginCubit>()
                                    .emailChanged(value),
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
                                      .read<LoginCubit>()
                                      .passwordChanged(value),
                                  validator: (value) => value.length < 6
                                      ? 'Password or Email is incorrect.'
                                      : null,
                                ),
                              ),
                              //SizedBox(height: 5.0),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
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
                                                    'Sign In',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Colors.white
                                                    ),
                                                    shape:
                                                    MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(25.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () => _submitForm(
                                                      context,
                                                      state.status == LoginStatus.submitting),
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
                                                    'Register',
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
                                                  onPressed: () =>
                                                      Navigator
                                                          .of(context)
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

  void _submitForm(BuildContext context, bool isSubmitting){
    if (_formKey.currentState.validate() && !isSubmitting){
      context.read<LoginCubit>().loginInWithCredentials();
    }
  }
}