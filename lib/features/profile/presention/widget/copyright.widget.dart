import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/text_style.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Image.asset(AppImages.LOGO_COLORS, height: 45),
          const SizedBox(height: 5),
          Text(
            "© ${DateTime.now().year}${"All rights reserved".tr}.",
            textAlign: TextAlign.center,
            style: AppTextStyles.getRegularStyle(
              color: AppColors.grayTwoColor,
            ),
          ),
        ],
      ),
    );
  }
}
