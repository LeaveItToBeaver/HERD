part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadUser extends ProfileEvent {
  final String userId;

  const ProfileLoadUser({@required this.userId});

  @override
  List<Object> get props => [userId];
}

class ProfileToggleListView extends ProfileEvent {
  final bool isListView;

  const ProfileToggleListView({@required this.isListView});

  @override
  // TODO: implement props
  List<Object> get props => [isListView];
}

class ProfileUpdatePosts extends ProfileEvent {
  final List<Post> posts;

  const ProfileUpdatePosts({@required this.posts,});

  @override
  List<Object> get props => [posts];
}