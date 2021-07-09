import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCoverImage extends StatelessWidget{
  final String coverImageUrl;
  final File coverFile;

  const UserCoverImage({
    Key key,
    this.coverImageUrl,
    this.coverFile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: coverFile != null ?
        DecorationImage(
          image: FileImage(coverFile),
          fit: BoxFit.cover,
            ) : coverImageUrl.isNotEmpty
                ? CachedNetworkImageProvider(coverImageUrl)
                  : null,
      ),
      child: _noCoverPhoto(),
    );
  }

  Widget _noCoverPhoto(){
    if(coverFile == null && coverImageUrl.isEmpty) {
      return Container(
        child: Column(
          children: [
            Icon(
              Icons.add,
              color: Colors.grey[200],
              size: 200,
            ),
            Text("Tap Here To Add Cover Photo"),
          ],
        ),
      );
    }
    return null;
  }
}