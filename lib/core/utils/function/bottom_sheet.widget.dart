import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/border_radius.dart';

class BottomSheetWidget {
  static void show(Widget bottomsheet) {
    Get.bottomSheet(bottomsheet,
        isScrollControlled: false,
        backgroundColor: AppColorsWithTheme.background,
        shape: RoundedRectangleBorderAttribute.top(30));
  }

  static void showIsScroll(Widget bottomsheet) {
    Get.bottomSheet(bottomsheet,
        isScrollControlled: true,
        backgroundColor: AppColorsWithTheme.background,
        shape: RoundedRectangleBorderAttribute.top(30));
  }
}
