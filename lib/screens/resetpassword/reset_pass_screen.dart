import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:herd/screens/resetpassword/cubit/reset_pass_cubit.dart';
import 'package:herd/widgets/error_dialog.dart';
import 'package:herd/widgets/widgets.dart';

class ResetPassScreen extends StatelessWidget {
  static const String routeName = '/resetPass';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => BlocProvider<ResetPassCubit>(
              create: (_) => ResetPassCubit(
                  authRepository: context.read<AuthRepository>()),
              child: ResetPassScreen(),
            ));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    Pattern emailCheck =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExEmail = new RegExp(emailCheck);

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<ResetPassCubit, ResetPassState>(
          listener: (context, state) {
            if (state.status == ResetStatus.error) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                  content: state.failure.message,
                ),
              );
            }
          },
          builder: (context, state) {
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
                              color: Colors.white60.withAlpha(50),
                              width: 2,
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
                                    'Forgot your password?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 12.0),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.black38,
                                                    width: 2.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0),
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
                                                .read<ResetPassCubit>()
                                                .emailChanged(value),
                                            validator: (value) => !regExEmail
                                                    .hasMatch(value)
                                                ? 'Please enter a valid email.'
                                                : null,
                                          ),
                                        ),
                                      ],
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
                                                        'Reset',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .white),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () => _submitForm(
                                                          context,
                                                          state.status ==
                                                              ResetStatus
                                                                  .submitting),
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
                                                                    Colors
                                                                        .white),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
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
          },
        ),
      ),
    );
  }

  void _submitForm(BuildContext context, bool isSubmitting) {
    if (_formKey.currentState.validate() && !isSubmitting) {
      // set up the button
      Widget okButton = TextButton(
        child: Text(
          "Thanks",
        ),
        onPressed: () => Navigator.of(context).pop(),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.indigo.withAlpha(20), width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blueGrey[50], //.withAlpha(55),
        title: Text("Reset Password"),
        content: Text("So we sent you an email to let you reset your "
            "password. Try not to forget it this time."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      context.read<ResetPassCubit>().resetPassword();
    }
  }
}
