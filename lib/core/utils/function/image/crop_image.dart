import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../resource/color_app.dart';

Future<File?> cropImage({required File imageFile}) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Almusafir',
          toolbarColor: AppColors.mainOneColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Jawber App',
      ),
    ],
  );
  if (croppedFile == null) return null;
  return File(croppedFile.path);
}
