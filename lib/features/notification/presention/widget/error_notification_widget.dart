import 'package:flutter/material.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';

class ErrorNotificationWiget extends StatelessWidget {
  const ErrorNotificationWiget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Icon(
            Icons.nearby_error_outlined,
            color: AppColors.grayTwoColor,
            size: 130,
          ),

          const SizedBox(height: 20),
          //  Icon(icon, size: 150, color: AppColors.secondaryOneColor),
          Text(
            message,
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
