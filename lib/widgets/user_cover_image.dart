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
      } else {
      return Container(
        child: Image(
          image: coverFile != null
              ? FileImage(coverFile)
                : coverImageUrl.isNotEmpty
                  ? CachedNetworkImageProvider(coverImageUrl)
                    : null,
          fit: BoxFit.cover,
        ),
      );
    }
    }
  }