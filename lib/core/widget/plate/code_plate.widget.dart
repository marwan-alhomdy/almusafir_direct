import 'package:flutter/material.dart';

import '../../utils/resource/color_app.dart';
import '../../utils/resource/images.dart';
import '../../utils/resource/text_style.dart';

class CodePlateWidget extends StatelessWidget {
  const CodePlateWidget({
    super.key,
    required this.code,
    this.margin,
  });

  final String code;

  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              code.split('').join('  '),
              textAlign: TextAlign.center,
              style: AppTextStyles.getMediumStyle(
                fontSize: 38,
                color: AppColors.blackOneColor,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(AppImages.KSA, height: 25),
          ],
        ),
      ),
    );
  }
}
