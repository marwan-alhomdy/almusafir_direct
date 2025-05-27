import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/images.dart';

class DetailsOrderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailsOrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.secondaryOneColor,
      surfaceTintColor: Colors.white,
      elevation: 0.3,
      centerTitle: true,
      shadowColor: Colors.grey,
      scrolledUnderElevation: 0.5,
      title: Image.asset(AppImages.LOGO_COLORS, height: 50),
      actions: [
        IconButton(
          onPressed: () => _moveToHome(context),
          icon: const Icon(Iconsax.home_1_copy),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  void _moveToHome(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Size get preferredSize => Size(Get.width, 65);
}
