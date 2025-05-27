import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/utils/resource/color_app.dart';

// ignore: must_be_immutable
class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key,
    required this.currentIndex,
    required this.chingeScreen,
  });
  final int currentIndex;
  final void Function(int) chingeScreen;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: chingeScreen,
      destinations: [
        NavigationDestination(
          icon: Icon(Iconsax.home_copy),
          selectedIcon: Icon(Iconsax.home_1, color: AppColors.mainOneColor),
          label: 'الرئيسية',
        ),
        NavigationDestination(
            icon: Icon(Iconsax.calendar_1_copy),
            selectedIcon: Icon(Iconsax.calendar, color: AppColors.mainOneColor),
            label: 'حجوزاتي'),
        NavigationDestination(
          icon: Icon(Iconsax.message_copy),
          selectedIcon: Icon(Iconsax.message, color: AppColors.mainOneColor),
          label: 'الرسائل',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings, color: AppColors.mainOneColor),
          label: 'استكشاف',
        ),
        NavigationDestination(
          icon: Icon(Iconsax.frame_1_copy),
          selectedIcon: Icon(Iconsax.frame, color: AppColors.mainOneColor),
          label: 'حسابي',
        ),
      ],
    );
  }
}
