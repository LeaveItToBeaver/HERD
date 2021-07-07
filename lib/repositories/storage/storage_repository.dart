import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/user_model.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/repositories/storage/base_storage_repository.dart';
import 'package:uuid/uuid.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository({FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage
          ?? FirebaseStorage.instance;

  Future<String> _uploadImage({
    @required File image,
    @required String ref,
  }) async{
    final downloadUrl = await _firebaseStorage
        .ref(ref)
        .putFile(image)
        .then((taskSnapshot) => taskSnapshot.ref.getDownloadURL());
    return downloadUrl;
  }

  @override
  Future<String> uploadProfileImage({@required String url, @required File image})
  async {
    var imageId = Uuid().v4();

    //Update user profile image.

    if (url.isNotEmpty){
      final exp = RegExp(r'userProfile_(.*).jpg');
      imageId = exp.firstMatch(url)[1];
    }

    final downloadUrl = await _uploadImage(
        image: image,
        ref: 'images/users/userProfile_$imageId.jpg'
    );
    return downloadUrl;
  }

  @override
  Future<String> uploadPostImage({@required File image}) async {
    final imageId = Uuid().v4();
    final downloadUrl = await _uploadImage(
        image: image,
        ref: 'images/posts/post_$imageId.jpg'
    );
    return downloadUrl;
  }

  @override
  Future<String> uploadCoverImage({@required String url, @required File image}) async {
    var imageId = Uuid().v4();

    //Upload a cover photo

    if (url.isNotEmpty){
      final exp = RegExp(r'userCover_(.*).jpg');
      imageId = exp.firstMatch(url)[1];
    }

    final downloadUrl = await _uploadImage(
        image: image,
        ref: 'images/users/userCover_$imageId.jpg'
    );
    throw UnimplementedError();
  }
}