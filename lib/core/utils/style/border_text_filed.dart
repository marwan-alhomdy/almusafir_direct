import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';

import '../resource/color_app.dart';

abstract class BorderTextFiled {
  static const underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.mainOneColor, width: 0.1));

  static const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      borderSide: BorderSide(color: AppColors.mainOneColor, width: 0.1));

  static InputBorder enabledBorder(bool isOutline, double radius) {
    return isOutline
        ? outlineInputBorder.copyWith(
            borderSide: BorderSide(
                color: AppColors.grayTwoColor.withValues(alpha: 0.5),
                width: 0.1),
            borderRadius: BorderRadius.circular(radius))
        : underlineInputBorder;
  }

  static InputBorder focusedBorder(bool isOutline, double radius) {
    return isOutline
        ? outlineInputBorder.copyWith(
            borderRadius: BorderRadius.circular(radius))
        : underlineInputBorder;
  }

  static InputBorder border(bool isOutline, double radius) {
    return isOutline
        ? outlineInputBorder.copyWith(
            borderRadius: BorderRadius.circular(radius))
        : underlineInputBorder;
  }

  static InputBorder errorBorder(bool isOutline, double radius) {
    return isOutline
        ? outlineInputBorder.copyWith(
            borderSide:
                const BorderSide(color: AppColors.redOneColor, width: 0.1),
            borderRadius: BorderRadius.circular(radius))
        : underlineInputBorder.copyWith(
            borderSide:
                const BorderSide(color: AppColors.redThreeColor, width: 0.1),
            borderRadius: BorderRadius.circular(radius));
  }

  static TextStyle get errorStyle {
    return AppTextStyles.getMediumStyle(
      color: Colors.redAccent,
      fontSize: 10,
    );
  }
}
