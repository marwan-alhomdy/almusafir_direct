import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/images.dart';

class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.secondaryOneColor,
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Image.asset(AppImages.LOGO_COLORS, height: 50),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
