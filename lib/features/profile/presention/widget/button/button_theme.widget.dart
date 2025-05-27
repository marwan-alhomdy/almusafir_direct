import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/theme_app.dart';

class ButtonThemeWidget extends StatelessWidget {
  const ButtonThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () {
          bool isDarkMode = Get.isDarkMode;
          Get.changeTheme(isDarkMode ? Themes.themeLight : Themes.themeDark);
        },
        minTileHeight: 50,
        leading: const Icon(Iconsax.sun_1, size: 18),
        title: Text("تغيير الثيم".tr),
      ),
    );
  }
}
