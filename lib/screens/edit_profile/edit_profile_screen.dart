import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/helpers/helpers.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/screens/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:herd/screens/profile/bloc/profile_bloc.dart';
import 'package:herd/widgets/user_cover_image.dart';
import 'package:herd/widgets/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
  bool isSelected = false;
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
                  if (state.status == EditProfileStatus.submitting)
                    const LinearProgressIndicator(),
                  GestureDetector(
                    onTap: () => _selectedCoverImage(context),
                    child: isSelected ? UserCoverImage(
                      isSelected: true,
                      coverImageUrl: user.coverImageURL,
                      coverFile: state.coverImage,
                    ) : Stack(
                      children: [
                        UserCoverImage(
                          isSelected: true,
                          coverImageUrl: user.coverImageURL,
                          coverFile: state.coverImage,
                        ),
                          Card(
                            color: Colors.white.withAlpha(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_rounded,
                                      size: 100,
                                    ),
                                    Text(
                                      "Tap here to add a cover photo.",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  if (state.status == EditProfileStatus.submitting)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 32.0,),
                  GestureDetector(
                    onTap: () => _selectedProfileImage(context),
                    child: UserProfileImage(
                      radius: 80.0,
                      profileImageUrl: user.profileImageURL,
                      profileImage: state.profileImage,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            initialValue: user.username,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                  color: Colors.black38, width: 2.0,
                                ),
                              ),
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.article_outlined,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) => context
                            .read<EditProfileCubit>()
                            .usernameChanged(value),
                            validator: (value) => value.trim().isEmpty
                                ? 'Username can not be empty.'
                                : null ,
                          ),
                          const SizedBox(height: 16.0,),
                          TextFormField(
                            maxLines: 10,
                            minLines: 1,
                            maxLength: 250,
                            initialValue: user.bio,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(
                                    color: Colors.black38, width: 2.0,
                                  ),
                                ),
                                labelText: 'Bio',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.article_outlined,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) => context
                                .read<EditProfileCubit>()
                                .bioChanged(value),
                            validator: (value) => value.trim().isEmpty
                                ? 'Sorry, gotta add something to your bio.'
                                : null,
                          ),
                          const SizedBox(height: 28.0,),
                          TextButton(
                              onPressed: () => _submitForm(
                                context,
                                state.status == EditProfileStatus.submitting,
                              ),
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )
                              )
                            ),
                          ),
                        ],
                      ) ,
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

  void _selectedCoverImage (BuildContext context) async {
    final pickedFile = await ImageHelper.pickImageFromGallary(
        context: context,
        cropStyle: CropStyle.rectangle,
        title: 'Cover Photo'
    );
    if(pickedFile != null || pickedFile == null){
      isSelected = true;
      context
      .read<EditProfileCubit>()
          .coverImageChanged(File(pickedFile.path));
    }
  }

  void _selectedProfileImage (BuildContext context) async {
    final pickedFile = await ImageHelper.pickImageFromGallary(
        context: context,
        cropStyle: CropStyle.circle,
        title: 'Profile Image');
    if (pickedFile != null) {
      context
          .read<EditProfileCubit>()
          .profileImageChanged(File(pickedFile.path));
    }
  }

  void _submitForm (BuildContext context, bool isSubmitting){
    if (_formKey.currentState.validate() && !isSubmitting) {
      context.read<EditProfileCubit>().submit();
    }
  }
}