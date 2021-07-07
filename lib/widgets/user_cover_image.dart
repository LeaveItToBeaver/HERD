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
      child: Column(
        children: [
          Image.asset(
            coverImageUrl != null
                ? FileImage(coverFile)
                : coverImageUrl.isNotEmpty
                ? CachedNetworkImageProvider(coverImageUrl)
                : null,
            fit: BoxFit.fill,
          ),
        ]
      ),
    );
  }
}