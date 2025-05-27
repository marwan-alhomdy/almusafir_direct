import 'package:almusafir_direct/core/utils/function/bottom_sheet.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/images.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/view/image.view.dart';
import '../../../../../core/widget/image/image_widget.dart';
import 'choose_type_image_button_widget.dart';

// ignore: must_be_immutable
class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Card(
          elevation: 1,
          shape: RoundedRectangleBorderAttribute.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _imageWidget(image),
          ),
        ),
        const SizedBox(height: 140),
        Positioned(
          bottom: 0,
          child: FloatingActionButton.small(
              elevation: 0.1,
              shape: RoundedRectangleBorderAttribute.all(100),
              backgroundColor: AppColorsWithTheme.background,
              foregroundColor: AppColors.mainOneColor,
              onPressed: () => _showDialugeImagePaicker(context),
              child: Icon(Iconsax.edit)),
        ),
      ],
    );
  }

  Widget _imageWidget(String image) {
    return InkWell(
        onTap: () => _dispalyImage(image),
        borderRadius: BorderRadiusAttribute.all(12),
        child: ImageWidget(image,
            width: 110, height: 110, errorWiget: _errorImage));
  }

  Widget get _errorImage =>
      Center(child: Image.asset(AppImages.avatar, fit: BoxFit.cover));

  void _dispalyImage(String urlImage) {
    Get.to(() => ShowImageView(image: urlImage));
  }

  void _showDialugeImagePaicker(BuildContext context) {
    BottomSheetWidget.show(ChooseImageWidget(
      onChooseImage: (p0) {},
    ));
  }
}
