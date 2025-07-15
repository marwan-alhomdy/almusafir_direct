import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/locale/locale_controller.dart';
import '../../../../../core/utils/resource/color_app.dart';

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
        const SizedBox(width: 20),
      ],
    );
  }

  void _changeLanguage() {
    LocaleController localeController = Get.find();
    final code = localeController.languageCode == "en" ? "ar" : "en";
    localeController.chingeLanguage(languageCode: code);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
