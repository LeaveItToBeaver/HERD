import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/screens/edit_profile/cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName ='/editProfile';

  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<EditProfileCubit>(
        create: (_) => EditProfileCubit(
          userRepository: context.read<UserRepository>(),
        ),
        child: Container(),
      )
    );
  }

  @override
  Widget build(BuildContext contxt){
    return Container(

    );
  }
}