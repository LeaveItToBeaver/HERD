part of 'liked_posts_cubit.dart';

abstract class LikedPostsState extends Equatable {
  final Set<String> likedPostIds;
  final Set<String> recentlyLikedPostIds;

  const LikedPostsState({
    @required this.likedPostIds,
    @required this.recentlyLikedPostIds,
  });

  @override
  List<Object> get props => [];
}

class LikedPostsInitial extends LikedPostsState {}
