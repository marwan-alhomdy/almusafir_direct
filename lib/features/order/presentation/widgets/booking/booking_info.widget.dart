import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';

class BookingInfoWidget extends StatelessWidget {
  const BookingInfoWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.value,
      this.trailing});
  final IconData icon;
  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(icon, size: 18, color: AppColors.mainOneColor),
        SizedBox(width: 10),
        Text(label,
            style: AppTextStyles.getRegularStyle(
                color: Get.isDarkMode ? Colors.white70 : null)),
        Spacer(),
        trailing ??
            Text(value,
                style: AppTextStyles.getRegularStyle(
                    color: Get.isDarkMode ? Colors.white70 : null)),
      ],
    );
  }
}
