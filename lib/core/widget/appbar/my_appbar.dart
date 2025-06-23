import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../helper/language.helper.dart';
import '../../utils/resource/font_manager.dart';
import '../../utils/resource/images.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
          color: Colors.white,
        ),
      ),
      leadingWidth: 20,
      leading: const SizedBox(),
      actions: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: Get.back,
            icon: Icon(
                LanguageHelper.chooseLanguage(
                    arabic: Iconsax.arrow_square_left_copy,
                    english: Iconsax.arrow_right_copy),
                color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class MyAppBarWithLogo extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarWithLogo({super.key, this.actions, this.backgroundColor});
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Hero(
          tag: AppImages.logo, child: Image.asset(AppImages.logo, height: 30)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 65);
}
