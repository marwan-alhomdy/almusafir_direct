import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/resource/color_app.dart';

class EmptyNotificationWidget extends StatelessWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset("assets/icons/bell (1).png", height: 103, width: 103),
          const SizedBox(height: 20),
          //  Icon(icon, size: 150, color: AppColors.secondaryOneColor),
          Text(
            "no_notifications".tr,
            style: AppTextStyles.getRegularStyle(
              fontSize: 18,
              color: AppColors.grayOneColor,
            ),
          ),
        ],
      ),
    );
  }
}
