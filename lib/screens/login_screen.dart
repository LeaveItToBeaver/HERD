import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext build){
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

          Container(
            height: double.infinity,
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
                      fontFamily: 'Arial',
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
                          //controller: emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.purple, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.black38, width: 2.0),
                            ),
                            labelText: 'Email',
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
                          //controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.black38, width: 2),
                            ),
                            labelText: 'Password',
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
                        minWidth: 200,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {

                          },
                          shape: const StadiumBorder(),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Sign In'),
                        ),
                      ),

                      SizedBox(height: 20),
                      ButtonTheme(
                        minWidth: 200,
                        height: 50,
                        child: RaisedButton(
                          onPressed: (){

                          },
                          shape: const StadiumBorder(),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}