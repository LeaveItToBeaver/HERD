import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:herd/models/models.dart';
import 'package:meta/meta.dart';
import 'dart:io';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState.initial());
  //Where I left Off. Going to Create the Edit Profile Screen next.
}
