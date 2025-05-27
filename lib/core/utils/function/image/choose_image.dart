import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'crop_image.dart';

Future<void> chooseImage({
  required void Function(String) onChooseImage,
  required File? imageProfile,
  required XFile? pickImage,
}) async {
  try {
    final image = pickImage;
    if (image == null) {
      return;
    }
    File? img;
    Get.back();
    img = await cropImage(imageFile: File(image.path));
    if (img == null) {
      return;
    }
    imageProfile = img;
    onChooseImage(img.path);
  } on PlatformException catch (e) {
    Get.back();
    if (kDebugMode) {
      print(e.details);
    }
  }
}
