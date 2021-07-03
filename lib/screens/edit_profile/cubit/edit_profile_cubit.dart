import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/repositories/storage/storage_repository.dart';
import 'package:herd/screens/profile/bloc/profile_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:io';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;
  final ProfileBloc _profileBloc;

  EditProfileCubit(
      UserRepository userRepository,
      StorageRepository storageRepository,
      ProfileBloc profileBloc,
      ) :
        _userRepository = userRepository,
        _storageRepository = storageRepository,
        _profileBloc = profileBloc,
        super(EditProfileState.initial()){
    final user =_profileBloc.state.user;
    emit(state.copyWith(username: user.username, bio: user.bio));
  }
}
