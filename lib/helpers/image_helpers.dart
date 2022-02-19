import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<File> pickImageFromGallary({
    @required BuildContext context,
    @required CropStyle cropStyle,
    @required String title,
}) async  {
    final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        cropStyle: cropStyle,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: title,
          toolbarColor: Colors.greenAccent,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.ratio16x9 ,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(

        ),
        compressQuality: 70,
      );
      return croppedFile;
    }
    return null;
  }
}