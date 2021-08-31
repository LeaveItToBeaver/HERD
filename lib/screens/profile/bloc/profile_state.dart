part of 'profile_bloc.dart';

enum ProfileStatus {initial, loading, loaded, error}

@immutable
class ProfileState {
  final User user;
  final List<Post> posts;
  final bool isListView;
  final bool isCurrentUser;
  final bool isFollowing;
  final ProfileStatus status;
  final Failure failure;

  const ProfileState({
    @required this.user,
    @required this.posts,
    @required this.isListView,
    @required this.isCurrentUser,
    @required this.isFollowing,
    @required this.status,
    @required this.failure,
  });

  factory ProfileState.initial(){
    return const ProfileState(
        user: User.empty,
        posts: [],
        isListView: true,
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
    isListView,
    isCurrentUser,
    isFollowing,
    status,
    failure,
  ];

  ProfileState copyWith({
    User user,
    List<Post> posts,
    bool isListView,
    bool isCurrentUser,
    bool isFollowing,
    ProfileStatus status,
    Failure failure,
  }) {
    return ProfileState(
    user: user ?? this.user,
    posts: posts ?? this.posts,
    isListView: isListView ?? this.isListView,
    isCurrentUser: isCurrentUser ?? this.isCurrentUser,
    isFollowing: isFollowing ?? this.isFollowing,
    status: status ?? this.status,
    failure: failure ?? this.failure,
    );
  }
}


