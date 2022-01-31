part of 'profile_bloc.dart';

enum ProfileStatus {initial, loading, loaded, error}

@immutable
class ProfileState {
  final User user;
  final List<Post> posts;
  final List<Comment> comments;
  final bool isListView;
  final bool isCommentView;
  final bool isHistoryView;
  final bool isCurrentUser;
  final bool isFollowing;
  final ProfileStatus status;
  final Failure failure;

  const ProfileState({
    @required this.user,
    @required this.posts,
    @required this.comments,
    @required this.isListView,
    @required this.isCommentView,
    @required this.isHistoryView,
    @required this.isCurrentUser,
    @required this.isFollowing,
    @required this.status,
    @required this.failure,
  });

  factory ProfileState.initial(){
    return const ProfileState(
        user: User.empty,
        posts: [],
        comments: [],
        isListView: true,
        isCommentView: false,
        isHistoryView: false,
        isCurrentUser: false,
        isFollowing: false,
        status: ProfileStatus.initial,
        failure: Failure()
    );
  }

  @override
  List<Object> get props => [
    user,
    posts,
    comments,
    isListView,
    isCommentView,
    isHistoryView,
    isCurrentUser,
    isFollowing,
    status,
    failure,
  ];

  ProfileState copyWith({
    User user,
    List<Post> posts,
    List<Comment> comments,
    bool isListView,
    bool isCommentView,
    bool isHistoryView,
    bool isCurrentUser,
    bool isFollowing,
    ProfileStatus status,
    Failure failure,
  }) {
    return ProfileState(
    user: user ?? this.user,
    posts: posts ?? this.posts,
    comments: comments ?? this.comments,
    isListView: isListView ?? this.isListView,
      isCommentView: isCommentView ?? this.isCommentView,
      isHistoryView: isHistoryView ?? this.isHistoryView,
    isCurrentUser: isCurrentUser ?? this.isCurrentUser,
    isFollowing: isFollowing ?? this.isFollowing,
    status: status ?? this.status,
    failure: failure ?? this.failure,
    );
  }
}


