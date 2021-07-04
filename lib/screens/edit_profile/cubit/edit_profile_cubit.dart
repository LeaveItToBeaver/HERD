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

  void profileImageChanged(File image){
    emit(
      state.copyWith(profileImage: image, status: EditProfileStatus.initial);
    );
  }

  void usernameChanged(String username){
    emit(
        state.copyWith(username: username, status: EditProfileStatus.initial);
    );
  }

  void bioChanged(String bio){
    emit(
        state.copyWith(bio: bio, status: EditProfileStatus.initial);
    );
  }

  void submit() async {
    emit(state.copyWith(status: EditProfileStatus.submitting));
    try {
      final user = _profileBloc.state.user;
      var profileImageUrl = user.profileImageURL;

      if (state.profileImage != null){
        profileImageUrl = await _storageRepository.uploadProfileImage(
            url: profileImageUrl,
            image: state.profileImage,
        );
      }
    } catch (err) {
      emit(
          state.copyWith(
              status: EditProfileStatus.error,
              failure: const Failure(message: 'Sorry, we were unable to update your profile.'),
          )
      );
    }
  }
}
