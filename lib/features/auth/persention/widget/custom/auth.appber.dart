import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/locale/locale_controller.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/theme_app.dart';

class AuthAppBer extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.mainOneColor,
      actions: [
        IconButton(
          onPressed: _changeLanguage,
          icon: const Icon(Iconsax.translate),
        ),
        IconButton(
          onPressed: _changeTheme,
          icon: const Icon(Icons.sunny),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  void _changeLanguage() {
    LocaleController localeController = Get.find();
    final code = localeController.languageCode == "en" ? "ar" : "en";
    localeController.chingeLanguage(languageCode: code);
  }

  void _changeTheme() {
    bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? Themes.themeLight : Themes.themeDark);
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
