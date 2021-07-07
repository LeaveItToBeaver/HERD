import 'dart:io';

abstract class BaseStorageRepository {
  Future<String> uploadProfileImage({String url, File image});
  Future<String> uploadCoverImage({String url, File image});
  Future<String> uploadPostImage({File image});
}