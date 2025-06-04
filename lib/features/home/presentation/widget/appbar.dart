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
      // SizedBox(
      //   height: 100,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       _ButtonWidget(
      //           onTap: () => Get.to(() => const ProfileVeiw()),
      //           icon: Iconsax.setting_2_copy),
      //       Image.asset(AppImages.LOGO_COLORS, height: 50),
      //       _ButtonWidget(
      //           onTap: () => Get.to(() => const OrderView()),
      //           icon: Iconsax.bookmark_2_copy),
      //     ],
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}
