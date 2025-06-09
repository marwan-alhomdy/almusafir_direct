import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../resource/color_app.dart';

class ImageEncodeHandler {
  static Future<String> getEncoded64ImageStringFromFile(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return base64Encode(bytes);
  }

  static Future<String> getEncoded64CompressedImageString(
      File imageFile) async {
    // قراءة الصورة الأصلية من الملف
    final imageBytes = await imageFile.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageBytes);

    // تصغير وضغط الصورة
    if (originalImage != null) {
      final resizedImage =
          img.copyResize(originalImage, width: 750, height: 1024);
      final compressedImage = img.encodeJpg(resizedImage, quality: 70);

      // تحويل الصورة إلى نص Base64
      String base64String = base64Encode(compressedImage);
      return base64String;
    }

    throw Exception('Failed to process the image');
  }
}

class ImageHandler {
  static Future<void> chooseImage({
    required void Function(File) onChooseImage,
    required XFile? pickImage,
  }) async {
    try {
      final image = pickImage;
      if (image == null) return;
      File? img;
      img = await cropImage(imageFile: File(image.path));
      if (img == null) {
        return;
      }
      onChooseImage(img);
    } on PlatformException {
      Get.back();
    }
  }

  static Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Almusafir',
            toolbarColor: AppColors.mainOneColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(title: 'Almusafir'),
      ],
    );
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }
}
