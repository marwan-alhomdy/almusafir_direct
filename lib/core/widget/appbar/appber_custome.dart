import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../helper/language.helper.dart';
import '../../utils/resource/color_app.dart';
import '../../utils/resource/images.dart';
import '../../utils/style/border_radius.dart';

class AppBerCustome extends StatelessWidget implements PreferredSizeWidget {
  const AppBerCustome({super.key, this.isShowBack = true});
  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Hero(
        tag: AppImages.logoWhite,
        child: Image.asset(AppImages.logoWhite, height: 36),
      ),
      leadingWidth: 20,
      leading: const SizedBox(),
      actions: !isShowBack ? [] : const [_CloseWidget(), SizedBox(width: 20)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CloseWidget extends StatelessWidget {
  const _CloseWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      customBorder: RoundedRectangleBorderAttribute.all(10),
      child: Container(
        height: 54,
        width: 54,
        padding: const EdgeInsets.all(12),
        decoration: AppBoxDecoration.greenBoxDecoration.copyWith(
          color: Colors.white.withValues(alpha: 0.5),
        ),
        child: Icon(
          color: Colors.white,
          LanguageHelper.isArabic
              ? Iconsax.arrow_left_copy
              : Iconsax.arrow_right_1_copy,
        ),
      ),
    );
  }
}
