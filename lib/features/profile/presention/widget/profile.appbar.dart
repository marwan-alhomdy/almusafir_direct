import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../helper/language.helper.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key, required this.name, required this.mobile});
  final String name;
  final String mobile;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${"Hello".tr} ${name.split(" ").firstOrNull ?? ""} 👋",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Text(
            mobile,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
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
  Size get preferredSize => const Size.fromHeight(80);
}
