part of 'create_post_cubit.dart';

enum CreatePostStatus{initial, submitting, success, error}

class CreatePostState extends Equatable {
  final File postImage;
  final String title;
  final String caption;
  final CreatePostStatus status;
  final Failure failure;

  factory CreatePostState.initial() {
    return const CreatePostState(
        postImage: null,
        title: '',
        caption: '',
        status: CreatePostStatus.initial,
        failure: Failure(),
    );
  }

  CreatePostState copyWith({
    File postImage,
    String title,
    String caption,
    CreatePostStatus status,
    Failure failure,
  }) {
    return new CreatePostState(
      postImage: postImage ?? this.postImage,
      title: title ?? this.title,
      caption: caption ?? this.caption,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  const CreatePostState({
    @required this.postImage,
    @required this.title,
    @required this.caption,
    @required this.status,
    @required this.failure,
  });

  @override
  List<Object> get props => [
    postImage,
    title,
    caption,
    status,
    failure,
  ];
}
