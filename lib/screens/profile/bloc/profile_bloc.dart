import 'dart:async';
import 'package:flutter/services.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/models/models.dart';

import 'package:bloc/bloc.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final PostRepository _postRepository;
  final AuthBloc _authBloc;

  StreamSubscription<List<Future<Post>>> _postSubscription;

  ProfileBloc({
    @required UserRepository userRepository,
    @required PostRepository postRepository,
    @required AuthBloc authBloc,
  })  : _userRepository = userRepository,
        _postRepository = postRepository,
        _authBloc = authBloc,
        super(ProfileState.initial());

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileLoadUser) {
      yield* _mapProfileLoadUserToState(event);
    } else if (event is ProfileToggleListView) {
      yield* _mapProfileToggleListViewState(event);
    } else if (event is ProfileToggleCommentView) {
      yield* _mapProfileToggleCommentViewState(event);
    } else if (event is ProfileToggleHistoryView) {
      yield* _mapProfileToggleHistoryViewState(event);
    } else if (event is ProfileUpdatePosts) {
      yield* _mapProfileUpdatePostsToState(event);
    } else if (event is ProfileFollowUser) {
      yield* _mapProfileFollowUserToState();
    } else if (event is ProfileUnfollowUser) {
      yield* _mapProfileUnfollowUserToState();
    }
  }

  Stream<ProfileState> _mapProfileLoadUserToState(
      ProfileLoadUser event) async* {
    yield state.copyWith(
      status: ProfileStatus.loading,
    );
    try {
      final user = await _userRepository.getUserWithId(userId: event.userId);
      final isCurrentUser = _authBloc.state.user.uid == event.userId;

      final isFollowing = await _userRepository.isFollowing(
          userId: _authBloc.state.user.uid, otherUserId: event.userId);

      _postSubscription?.cancel();
      _postSubscription = _postRepository
          .getUserPosts(userId: event.userId)
          .listen((posts) async {
        final allPosts = await Future.wait(posts);
        add(ProfileUpdatePosts(posts: allPosts));
      });

      yield state.copyWith(
        user: user,
        isCurrentUser: isCurrentUser,
        isFollowing: isFollowing,
        status: ProfileStatus.loaded,
      );
    } catch (err) {
      yield state.copyWith(
        status: ProfileStatus.error,
        failure: const Failure(
          message: "We are unable to load this profile.",
        ),
      );
    }
  }

  Stream<ProfileState> _mapProfileToggleListViewState(
      ProfileToggleListView event) async* {
    yield state.copyWith(isListView: event.isListView);
  }

  Stream<ProfileState> _mapProfileToggleCommentViewState(
      ProfileToggleCommentView event) async* {
    yield state.copyWith(isCommentView: event.isCommentView);
  }

  Stream<ProfileState> _mapProfileToggleHistoryViewState(
      ProfileToggleHistoryView event) async* {
    yield state.copyWith(isHistoryView: event.isHistoryView);
  }

  Stream<ProfileState> _mapProfileUpdatePostsToState(
      ProfileUpdatePosts event) async* {
    yield state.copyWith(posts: event.posts);
  }

  Stream<ProfileState> _mapProfileFollowUserToState() async* {
    try {
      _userRepository.followUser(
        userId: _authBloc.state.user.uid,
        followUserId: state.user.id,
      );
      final updatedUser =
          state.user.copyWith(followers: state.user.followers + 1);
      yield state.copyWith(user: updatedUser, isFollowing: true);
    } catch (err) {
      yield state.copyWith(
        status: ProfileStatus.error,
        failure:
            const Failure(message: 'Something went wrong! Please try again.'),
      );
    }
  }

  Stream<ProfileState> _mapProfileUnfollowUserToState() async* {
    try {
      _userRepository.unFollowUser(
        userId: _authBloc.state.user.uid,
        unFollowUserId: state.user.id,
      );
      final updatedUser =
          state.user.copyWith(followers: state.user.followers - 1);
      yield state.copyWith(user: updatedUser, isFollowing: false);
    } catch (err) {
      yield state.copyWith(
        status: ProfileStatus.error,
        failure:
            const Failure(message: 'Something went wrong! Please try again.'),
      );
    }
  }
}
