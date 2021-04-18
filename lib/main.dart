import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:herd/blocs/authentication_bloc/authentication_event.dart';
import 'package:herd/repositories/user_repository.dart';

main(){
  runApp(Herd());
}

class Herd extends StatefulWidget {
  State<Herd> createState() => _herdState();
}

class _herdState extends State<Herd>{ 
  final UserRepository _userRepository = UserRepository as UserRepository;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState(){
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.add(AuthenticationStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => _authenticationBloc,
        child: MaterialApp (
          home: BlocBuilder(
            bloc: _authenticationBloc,
            builder: (BuildContext context),
          ),
        ),
    );
  }
}

class AppStarted {
}