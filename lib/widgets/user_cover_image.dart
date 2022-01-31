import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCoverImage extends StatelessWidget{
  final String coverImageUrl;
  final File coverFile;
  final bool isSelected;

  const UserCoverImage({
    Key key,
    this.isSelected,
    this.coverImageUrl,
    this.coverFile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (!isSelected) {
      if(coverFile == null && coverImageUrl.isEmpty) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Tap Edit Profile to add a cover photo.",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    } else {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Tap here to change your cover photo.",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    }
  }