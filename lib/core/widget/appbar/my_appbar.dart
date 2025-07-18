import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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

class MyAppBarWithFilter extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarWithFilter(
      {super.key,
      this.backgroundColor,
      required this.isGridView,
      required this.onChange});

  final Color? backgroundColor;
  final bool isGridView;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return MyAppBarWithLogo(
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          icon: Icon(isGridView
              ? Iconsax.textalign_justifycenter
              : Iconsax.element_3_copy),
          onPressed: () => onChange(!isGridView),
        ),
        const SizedBox(width: 20),
      ],
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
