import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/models/failure_model.dart';
import 'package:herd/models/models.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'dart:io';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepository _postRepository;
  final StorageRepository _storageRepository;
  final AuthBloc _authBloc;

  CreatePostCubit(
      {@required PostRepository postRepository,
      @required StorageRepository storageRepository,
      @required AuthBloc authBloc})
      : _postRepository = postRepository,
        _storageRepository = storageRepository,
        _authBloc = authBloc,
        super(CreatePostState.initial());

  void postImageChanged(File file) {
    emit(state.copyWith(
      postImage: file,
      status: CreatePostStatus.initial,
    ));
  }

  void captionChanged(String caption) {
    emit(state.copyWith(
      caption: caption,
      status: CreatePostStatus.initial,
    ));
  }

  void titleChanged(String title) {
    emit(state.copyWith(
      title: title,
      status: CreatePostStatus.initial,
    ));
  }

  void submit() async {
    emit(state.copyWith(status: CreatePostStatus.submitting));
    try {
      final author = User.empty.copyWith(id: _authBloc.state.user.uid);

      if (state.postImage != null) {
        final postImageUrl =
            await _storageRepository.uploadPostImage(image: state.postImage);
        final post = Post(
            author: author,
            imageUrl: postImageUrl,
            isImage: true,
            caption: state.caption,
            title: state.title,
            likes: 0,
            dislikes: 0,
            date: DateTime.now(),
            commentNum: null);

        await _postRepository.createPost(post: post);

        emit(state.copyWith(status: CreatePostStatus.success));
      } else if (state.postImage == null) {
        final post = Post(
            author: author,
            imageUrl: null,
            isImage: false,
            caption: state.caption,
            title: state.title,
            likes: 0,
            dislikes: 0,
            date: DateTime.now(),
            commentNum: null);

        await _postRepository.createPost(post: post);

        emit(state.copyWith(status: CreatePostStatus.success));
      }

      /*final post = Post(
          author: author,
          imageUrl: postImageUrl,
          caption: state.caption,
          title: state.title,
          likes: 0,
          dislikes: 0,
          date: DateTime.now()
      );*/
    } catch (err) {
      emit(state.copyWith(
          status: CreatePostStatus.error,
          failure:
              const Failure(message: "We were unable to create your post")));
    }
  }

  void reset() {
    emit(CreatePostState.initial());
  }
}
