import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/screens/profile/bloc/profile_bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;
  final ProfileBloc _profileBloc;

  EditProfileCubit({
    @required UserRepository userRepository,
    @required StorageRepository storageRepository,
    @required ProfileBloc profileBloc,
  })  : _userRepository = userRepository,
        _storageRepository = storageRepository,
        _profileBloc = profileBloc,
        super(EditProfileState.initial()) {
    final user = _profileBloc.state.user;
    emit(state.copyWith(username: user.username, bio: user.bio));
  }

  void coverImageChanged(File image2) {
    emit(
      state.copyWith(coverImage: image2, status: EditProfileStatus.initial),
    );
  }

  void profileImageChanged(File image) {
    emit(
      state.copyWith(profileImage: image, status: EditProfileStatus.initial),
    );
  }

  void usernameChanged(String username) {
    emit(
      state.copyWith(username: username, status: EditProfileStatus.initial),
    );
  }

  void bioChanged(String bio) {
    emit(
      state.copyWith(bio: bio, status: EditProfileStatus.initial),
    );
  }

  void submit() async {
    emit(state.copyWith(status: EditProfileStatus.submitting));
    try {
      final user = _profileBloc.state.user;

      var coverImageUrl = user.coverImageURL;
      var profileImageUrl = user.profileImageURL;
      if (state.coverImage != null && state.profileImage != null){
        coverImageUrl = await _storageRepository.uploadCoverImage(
            url: coverImageUrl,
            image: state.coverImage,
        );
        profileImageUrl = await _storageRepository.uploadProfileImage(
          url: profileImageUrl,
          image: state.profileImage,
        );
      } else if (state.profileImage == null && state.coverImage != null){
        coverImageUrl = await _storageRepository.uploadCoverImage(
          url: coverImageUrl,
          image: state.coverImage,
        );
      } else if (state.coverImage == null && state.profileImage != null) {
        profileImageUrl = await _storageRepository.uploadProfileImage(
          url: profileImageUrl,
          image: state.profileImage,
        );
      }

      final updatedUser = user.copyWith(
        username: state.username,
        bio: state.bio,
        profileImageURL: profileImageUrl,
        coverImageURL: coverImageUrl,
      );

      await _userRepository.updateUser(user: updatedUser);

      _profileBloc.add(ProfileLoadUser(userId: user.id));

      emit(state.copyWith(status: EditProfileStatus.success));
    } catch (err) {
      emit(
        state.copyWith(
          status: EditProfileStatus.error,
          failure: const Failure(
            message: 'We were unable to update your profile.',
          ),
        ),
      );
    }
  }
}