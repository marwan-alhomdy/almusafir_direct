import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resource/color_app.dart';
import 'dashed_line_painter.dart';

class HorizontalDashedWidget extends StatelessWidget {
  const HorizontalDashedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: HorizontalDashedLinePainter(
            strokeWidth: 1.5,
            dashSpace: 4,
            dashWidth: 1,
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.2)
                : AppColors.secondaryOneColor.withOpacity(0.2)),
        child: const SizedBox(height: 2, width: double.infinity));
  }
}
