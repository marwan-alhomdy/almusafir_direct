import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/resource/color_app.dart';
import '../../utils/resource/text_style.dart';
import '../button/button.widget.dart';

class ErrorCustomWidget extends StatelessWidget {
  const ErrorCustomWidget(
    this.message, {
    super.key,
    required this.onTap,
  });

  final String message;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        const Icon(Icons.nearby_error_outlined,
            color: AppColors.grayTwoColor, size: 120),
        const SizedBox(height: 20),
        Text(message, style: AppTextStyles.getRegularStyle(fontSize: 16)),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          height: 50,
          child: ButtonWidget(text: "updateData".tr, onTap: onTap),
        )
      ],
    );
  }
}
