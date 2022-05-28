import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:herd/models/post_model.dart';
import 'package:herd/widgets/post_widgets/post_information.dart';
import 'package:herd/widgets/post_widgets/post_operation_widget.dart';
import 'dart:io';

class PhotoPost extends StatelessWidget {
  final Post post;
  final String photoImageURL;
  final File photoFile;
  final bool isLiked;
  final bool isDisliked;

  const PhotoPost({
    Key key,
    @required this.post,
    @required this.photoImageURL,
    this.photoFile,
    @required this.isLiked,
    @required this.isDisliked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        color: Colors.white70,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent, width: 4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NewPostInformation(post: post),
            GestureDetector(
              onDoubleTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      height: MediaQuery.of(context).size.height / 2.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: photoFile != null
                          ? FileImage(photoFile)
                          : photoImageURL.isNotEmpty
                              ? CachedNetworkImageProvider(photoImageURL)
                              : null,
                    ),
                  ),
                ),
              ),
            ),
            PostOperation(post: post),
          ],
        ),
      ),
    );
  }
}
