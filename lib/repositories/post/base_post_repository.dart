import 'package:herd/models/models.dart';

abstract class BasePostRepository {
  Future<void> createPost({Post post});
  Future<void> deletePost({Post post});

  Future<void> createComment({Comment comment});
  void createLike({Post post, String userId});
  void createDislike({Post post, String userId});

  Stream<List<Future<Post>>> getUserPosts({String userId});

  Stream<List<Future<Comment>>> getPostComments({String postId});

  Future<List<Post>> getUserFeed({String userId, String lastPostId});
  Future<Set<String>> getLikedPostIds({String userId, List<Post> posts});
  void deleteLike({String postId, String userId});
}
