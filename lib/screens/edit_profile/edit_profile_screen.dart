import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/screens/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:herd/screens/profile/bloc/profile_bloc.dart';
import 'package:herd/widgets/widgets.dart';

class EditProfileScreenArgs {
  final BuildContext context;

  const EditProfileScreenArgs({@required this.context});
}

class EditProfileScreen extends StatelessWidget {
  static const String routeName ='/editProfile';

  static Route route({@required EditProfileScreenArgs args}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<EditProfileCubit>(
        create: (_) => EditProfileCubit(
            userRepository: context.read<UserRepository>(),
            storageRepository: context.read<StorageRepository>(),
            profileBloc: args.context.read<ProfileBloc>(),
        ),
        child: EditProfileScreen(user: args.context.read<ProfileBloc>().state.user),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final User user;
  EditProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state){
            if (state.status == EditProfileStatus.success){
              Navigator.of(context).pop();
            } else if (state.status == EditProfileStatus.error){
              showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(content: state.failure.message),
              );
            }
          },
          builder: (context, state){
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32.0,),
                  //Wrap UserProfileImage in a gesture detector.
                  UserProfileImage(
                    radius: 80.0,
                    profileImageUrl: user.profileImageURL,
                    profileImage: state.profileImage,)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}