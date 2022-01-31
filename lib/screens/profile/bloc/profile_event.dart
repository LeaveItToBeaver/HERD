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

class ProfileToggleCommentView extends ProfileEvent {
  final bool isCommentView;

  const ProfileToggleCommentView({@required this.isCommentView});

  @override
  // TODO: implement props
  List<Object> get props => [isCommentView];
}

class ProfileToggleHistoryView extends ProfileEvent {
  final bool isHistoryView;

  const ProfileToggleHistoryView({@required this.isHistoryView});

  @override
  // TODO: implement props
  List<Object> get props => [isHistoryView];
}