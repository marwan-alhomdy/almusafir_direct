import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget(
      {super.key,
      this.icon,
      required this.label,
      required this.value,
      this.trailing});
  final IconData? icon;
  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.trim().isNotEmpty,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (icon != null) Icon(icon, size: 18, color: AppColors.mainOneColor),
          const SizedBox(width: 10),
          Text(label,
              style: AppTextStyles.getRegularStyle(
                  color: Get.isDarkMode ? Colors.white70 : null)),
          const Spacer(),
          trailing ??
              Text(value,
                  style: AppTextStyles.getRegularStyle(
                      color: Get.isDarkMode ? Colors.white70 : null)),
        ],
      ),
    );
  }
}
