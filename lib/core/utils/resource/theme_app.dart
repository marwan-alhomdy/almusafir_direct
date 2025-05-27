import 'package:flutter/material.dart';

import '../style/border_text_filed.dart';
import 'color_app.dart';
import 'font_manager.dart';
import 'text_style.dart';

class Themes {
  static ThemeData themeDark = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
        primary: AppColors.mainOneColor, surface: Color(0x31535151)),
    primaryColor: AppColors.mainOneColor,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
        AppTextStyles.getRegularStyle(
          fontSize: FontSizeManager.s12,
        ),
      ),
      // elevation: 0.5,
      //backgroundColor: AppColors.secondaryOneColor,
      indicatorColor: AppColors.mainOneColor.withAlpha(50),
    ),
    dialogTheme: DialogThemeData(),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.black87,
      elevation: 50,
      shadowColor: Colors.blueGrey,
    ),
    chipTheme: ChipThemeData(
        labelStyle: AppTextStyles.getMediumStyle(fontSize: 12),
        padding: EdgeInsets.all(3),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0),
            borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.mainOneColor.withAlpha(100)),
    dividerTheme: DividerThemeData(color: Colors.white24),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0x31535151),
      filled: true,
      errorStyle: BorderTextFiled.errorStyle,
      labelStyle: AppTextStyles.getRegularStyle(),
      enabledBorder: BorderTextFiled.enabledBorder(true, 12),
      focusedBorder: BorderTextFiled.focusedBorder(true, 12),
      border: BorderTextFiled.border(true, 12),
      errorBorder: BorderTextFiled.errorBorder(true, 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
        )),
  );

  static ThemeData themeLight = ThemeData(
    primarySwatch: AppColors.primaryMaterialColor,
    brightness: Brightness.light,
    primaryColor: AppColors.secondaryOneColor,
    dividerColor: Colors.transparent,
    expansionTileTheme: const ExpansionTileThemeData(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      iconColor: AppColors.secondaryOneColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainOneColor,
      primary: AppColors.mainOneColor,
    ),
    fontFamily: FontFamilyNames.dINNextLTArabicRegular,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
        AppTextStyles.getRegularStyle(
          fontSize: FontSizeManager.s12,
        ),
      ),
      elevation: 0,
      indicatorColor: AppColors.mainOneColor.withAlpha(30),
    ),
    chipTheme: ChipThemeData(
        labelStyle: AppTextStyles.getMediumStyle(
            color: AppColors.grayOneColor, fontSize: 12),
        padding: EdgeInsets.all(3),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0,
              color: AppColors.grayThreeColor.withAlpha(100),
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.grayThreeColor.withAlpha(100)),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: FontFamilyNames.shamelBold,
        fontWeight: FontWeightManager.regular,
        color: AppColors.blackOneColor,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamilyNames.dINNextLTArabicRegular,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSizeManager.s14,
        color: AppColors.blackOneColor,
      ),
      labelSmall: TextStyle(
        fontFamily: FontFamilyNames.shamelBook,
        fontWeight: FontWeightManager.regular,
        color: Colors.black,
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        fontFamily: FontFamilyNames.dINNextLTArabicMedium,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSizeManager.s14,
        color: AppColors.blackOneColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontFamilyNames.dINNextLTArabicBold,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSizeManager.s14,
        color: AppColors.blackOneColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xfff2f2f2),
      filled: true,
      errorStyle: BorderTextFiled.errorStyle,
      labelStyle: AppTextStyles.getRegularStyle(),
      enabledBorder: BorderTextFiled.enabledBorder(true, 12),
      focusedBorder: BorderTextFiled.focusedBorder(true, 12),
      border: BorderTextFiled.border(true, 12),
      errorBorder: BorderTextFiled.errorBorder(true, 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    ),
    appBarTheme: AppBarTheme(),
    listTileTheme: const ListTileThemeData(
        iconColor: AppColors.secondaryOneColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
          color: AppColors.secondaryOneColor,
        )),
  );
}
