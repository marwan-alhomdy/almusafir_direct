import 'package:flutter/material.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/images.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryOneColor,
      surfaceTintColor: AppColors.mainOneColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Image.asset(AppImages.logo, height: 40),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
