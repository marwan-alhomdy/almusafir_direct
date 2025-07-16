import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/resource/images.dart';

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
  Size get preferredSize => Size(Get.width, 70);
}

class MyAppBarWithoutBack extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarWithoutBack({super.key, this.actions, this.backgroundColor});
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: const SizedBox(),
      title: Hero(
          tag: AppImages.logo, child: Image.asset(AppImages.logo, height: 30)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 70);
}

class MyAppBarBlueWithLogo extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarBlueWithLogo({super.key, this.actions, this.backgroundColor});
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainOneColor,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Hero(
          tag: AppImages.logo,
          child: Image.asset(AppImages.logoWhite, height: 30)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 70);
}
