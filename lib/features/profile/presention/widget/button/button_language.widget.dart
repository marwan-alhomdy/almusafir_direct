import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/locale/locale_controller.dart';

class ButtonLanguageWidget extends StatelessWidget {
  const ButtonLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () {
          LocaleController localeController = Get.find();
          final codeLng = localeController.languageCode == "en" ? "ar" : "en";
          localeController.chingeLanguage(languageCode: codeLng);
          // Get.offAll(() => const SplashView());
        },
        minTileHeight: 50,
        leading: const Icon(Iconsax.translate, size: 18),
        title: Text("language".tr),
      ),
    );
  }
}
