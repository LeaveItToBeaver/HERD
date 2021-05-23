part of 'profile_bloc.dart';

enum ProfileStatus {initial, loading, loaded, error}

@immutable
class ProfileState {
  final User user;
  //final List<Post> Posts;
  final bool isCurrentUser;
  final bool isFollowing;
  final ProfileStatus status;
  final Failure failure;

  const ProfileState({
    @required this.user,
    @required this.isCurrentUser,
    @required this.isFollowing,
    @required this.status,
    @required this.failure,
  });

  factory ProfileState.initial(){
    return const ProfileState(
        user: User.empty,
        isCurrentUser: false,
        isFollowing: false,
        status: ProfileStatus.initial,
        failure: Failure()
    );
  }

  @override
  List<Object> get props => [
    user,
    isCurrentUser,
    isFollowing,
    status,
    failure,
  ];

  ProfileState copyWith({
    User user,
    //final List<Post> Posts;
    bool isCurrentUser,
    bool isFollowing,
    ProfileStatus status,
    Failure failure,
  }) {
    return ProfileState(
    user: user ?? this.user,
    isCurrentUser: isCurrentUser ?? this.isCurrentUser,
    isFollowing: isFollowing ?? this.isFollowing,
    status: status ?? this.status,
    failure: failure ?? this.failure,
    );
  }
}


