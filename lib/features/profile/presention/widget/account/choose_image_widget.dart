import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/widget/liner.widget.dart';

class ChooseImageWidget extends StatelessWidget {
  const ChooseImageWidget({
    super.key,
    required this.onChooseImage,
    required this.onDeleteImage,
  });
  final void Function(ImageSource) onChooseImage;
  final VoidCallback onDeleteImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LineButtonSheetWidget(),
          _ButtonWidget(
              text: "camera".tr,
              icon: Iconsax.camera,
              onTap: () => onChooseImage(ImageSource.camera)),
          _ButtonWidget(
              icon: Iconsax.image,
              text: "gallery".tr,
              onTap: () => onChooseImage(ImageSource.gallery)),
          _ButtonWidget(
              icon: Iconsax.trash_copy,
              text: "حدف الصوره".tr,
              color: Colors.redAccent,
              onTap: onDeleteImage),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    required this.onTap,
    required this.icon,
    required this.text,
    this.color,
  });
  final Color? color;
  final IconData icon;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.mainOneColor,
          shape: RoundedRectangleBorderAttribute.all(10)),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            text,
            style: AppTextStyles.getMediumStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
