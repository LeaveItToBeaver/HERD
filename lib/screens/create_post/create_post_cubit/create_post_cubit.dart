import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/models/failure_model.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepository _postRepository;
  final StorageRepository _storageRepository;
  final AuthBloc _authBloc;

  CreatePostCubit({
    @required PostRepository postRepository,
    @required StorageRepository storageRepository,
    @required AuthBloc authBloc
  }) : _postRepository = postRepository,
        _storageRepository = storageRepository,
        _authBloc = authBloc,
        super(CreatePostState.initial());

  void postImageChanged(File file) {
    emit(state.copyWith(
      postImage: file,
      status: CreatePostStatus.initial,
    ));
  }
}
