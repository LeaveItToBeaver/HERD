import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herd/AuthUtil.dart';
import 'package:herd/FirebaseRegister.dart';
import 'package:herd/SignUpEmail.dart';
import 'package:herd/UserMainScreen.dart';

class SignUpScreenPersonal extends StatefulWidget{
  SignUpScreenPersonal({Key key, this.email, this.password}) : super (key : key);
  final String email;
  final String password;
  @override
  _SignUpScreenPersonal createState() => _SignUpScreenPersonal();
}

class _SignUpScreenPersonal extends State<SignUpScreenPersonal>{
    SignUpScreenPersonal controllers = SignUpScreenPersonal();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
      DateTime _selectedDate;
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
                    )
                ),
              ),

              ListView(
                children: <Widget>[
                  Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
                          child: Text('Now we need some more info',
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
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
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
                                Icons.account_box_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
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
                                Icons.account_box,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: TextField(
                            controller: userNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.black38, width: 2.0),
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
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(
                                Icons.alternate_email_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                          child: Text('What\'s your birthday?',
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
                          //Birthday
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            width: 300,
                            child: DatePickerWidget(
                              looping: false, // default is not looping
                              firstDate: DateTime.now().subtract(Duration(days: 36524)),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              dateFormat: "dd-MMM-yyyy",
                              locale: DatePicker.localeFromString('en'),
                              onChange: (DateTime newDate, _) => _selectedDate = newDate,
                              pickerTheme: DateTimePickerTheme(
                                backgroundColor: Colors.transparent,
                                itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                                dividerColor: Colors.yellow,
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
                                  if(userNameController.text != null &&
                                      firstNameController.text != null&&
                                      lastNameController != null&&
                                      _selectedDate != DateTime.now()){
                                    userSetup(
                                        widget.email, 
                                        widget.password,
                                        _selectedDate.toString(),
                                        firstNameController.text,
                                        lastNameController.text);
                                  }
                                } on FirebaseException catch (e){

                                }
                                },
                              shape: const StadiumBorder(),
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Next'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      );
    }
}