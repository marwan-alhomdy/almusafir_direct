import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  ///! hex color  =>  0xFF2196F3

  static const Color mainOneColor = Color(0xFF2196F3);
  static const primaryMaterialColor = MaterialColor(
    0xFF2d3343,
    <int, Color>{
      50: Color(0xFF2d3343),
      100: Color(0xFF2d3343),
      200: Color(0xFF2d3343),
      300: Color(0xFF2d3343),
      400: Color(0xFF2d3343),
      500: Color(0xFF2d3343),
      600: Color(0xFF2d3343),
      700: Color(0xFF2d3343),
      800: Color(0xFF2d3343),
      900: Color(0xFF2d3343),
    },
  );

  static const primaryMaterialColorDark = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: Color(0xFF2d3343),
      100: Color(0xFF2d3343),
      200: Color(0xFF2d3343),
      300: Color(0xFF2d3343),
      400: Color(0xFF2d3343),
      500: Color(0xFF2d3343),
      600: Color(0xFF2d3343),
      700: Color(0xFF2d3343),
      800: Color(0xFF2d3343),
      900: Color(0xFF2d3343),
    },
  );

  ///! hex color  =>  0xFFBBAEC4
  static const Color mainTwoColor = Color(0xFFBBAEC4);

  ///! hex color  =>  0xFFCACACC
  static const Color mainThreeColor = Color(0xFFCACACC);

//==================================

  static const Color secondaryOneColor = Color(0xFF2d3343);

  ///! hex color  =>  0xFF30C8FF
  static const Color secondaryTwoColor = Color(0xFF30C8FF);

  ///! hex color  =>  0xFFB77ABD
  static const Color secondaryThreeColor = Color(0xFFB77ABD);

//==================================
  ///! hex color  =>  0xFF2d3343
  static const Color blackOneColor = Color(0xFF2d3343);
//==================================
  ///! hex color  =>  0xFF58585A
  static const Color grayOneColor = Color(0xFF58585A);

  ///! hex color  =>  0xFF949496
  static const Color grayTwoColor = Color(0xFF949496);

  //! hex color  =>  0xFFC4C4C4
  static const Color grayThreeColor = Color(0xFFC4C4C4);

  //! hex color => 0xCC4C4C4C
  static const Color grayForeColor = Color(0xCC4C4C4C);
  //==================================
//! hex color => 0xFFBF4E4E
  static const Color redOneColor = Color(0xFFBF4E4E);
//! hex color => 0x18BF4E4E
  static const Color redTwoColor = Color(0x18BF4E4E);
//! hex color => 0xCCFF0000
  static const Color redThreeColor = Color(0xCCFF0000);
  //! hex color => 0xffAE2328
  static const Color redForeColor = Color(0xffAE2328);
//==================================
//! hex color => 0xFF4EBF7F
  static const Color greenOneColor = Color(0xFF4EBF7F);

//! hex color => 0x164EBF5D
  static const Color greenTwoColor = Color(0x164EBF5D);

//! hex color => 0xCC00FF37
  static const Color greenThreeColor = Color(0xCC00FF37);
}

class AppColorsWithTheme {
  static Color get background =>
      Get.isDarkMode ? const Color(0xFF535151) : Colors.white;

  static Color get backgroundScroll =>
      Get.isDarkMode ? const Color(0xFF2d3343) : Colors.white;

  static Color get backgroundbaseShimmer =>
      Get.isDarkMode ? const Color(0xFF2d3343) : Colors.grey.shade200;

  static Color get backgroundhighlightShimmer => Get.isDarkMode
      ? const Color.fromARGB(255, 49, 60, 89)
      : const Color.fromARGB(255, 228, 233, 248);

  static Color get navigationUnSelectIcon =>
      Get.isDarkMode ? AppColors.mainOneColor : const Color(0xFF2d3343);
}

class AppGradientColors {
  static const LinearGradient mainGradien = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF2196F3), Color(0xFF2196F3)],
      transform: GradientRotation(228.93 * (3.1415 / 180)));
  static const LinearGradient secondaryGradien = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1562, 0.3241, 0.6403, 0.8438],
    colors: [
      Color(0xFF548CFF),
      Color(0xFF548CFF),
      Color(0xFF548CFF),
      Color(0xFF548CFF),
    ],
    transform: GradientRotation(245.56 * (3.1415 / 180)),
  );
}

class AppBoxDecoration {
  static BoxDecoration containerDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
            offset: Offset(-1, 1),
            blurRadius: 5,
            spreadRadius: 0.1,
            blurStyle: BlurStyle.solid,
            color: Color.fromRGBO(61, 61, 61, 0.07)),
        BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 0.1,
            blurStyle: BlurStyle.solid,
            color: Color.fromRGBO(61, 61, 61, 0.07))
      ]);

  static const BoxDecoration mainBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(61, 61, 61, 0.08),
          blurRadius: 40.0,
          offset: Offset(0.0, 4.0),
        )
      ]);

  static const BoxDecoration secondaryBoxDecoration = BoxDecoration(
    color: Color.fromRGBO(153, 105, 196, 0.1),
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        offset: Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  );

  static BoxDecoration blueBoxDecoration = BoxDecoration(
    color: AppColors.mainOneColor.withOpacity(0.2),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(223, 226, 231, 0.039),
        offset: Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  );
  static const BoxDecoration greenBoxDecoration = BoxDecoration(
    color: Color.fromRGBO(255, 255, 255, 0.4),
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        offset: Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  );
}
