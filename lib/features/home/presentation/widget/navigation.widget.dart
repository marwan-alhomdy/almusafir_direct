import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          icon: const Icon(Iconsax.home_copy),
          selectedIcon:
              const Icon(Iconsax.home_1, color: AppColors.mainOneColor),
          label: "Home".tr,
        ),
        NavigationDestination(
            icon: const Icon(Iconsax.calendar_1_copy),
            selectedIcon:
                const Icon(Iconsax.calendar, color: AppColors.mainOneColor),
            label: "My Bookings".tr),
        NavigationDestination(
          icon: const Icon(Iconsax.message_copy),
          selectedIcon:
              const Icon(Iconsax.message, color: AppColors.mainOneColor),
          label: "Chat".tr,
        ),
        NavigationDestination(
          icon: const Icon(Icons.explore_outlined),
          selectedIcon:
              const Icon(Icons.explore, color: AppColors.mainOneColor),
          label: "Explore".tr,
        ),
        NavigationDestination(
          icon: const Icon(Iconsax.frame_1_copy),
          selectedIcon:
              const Icon(Iconsax.frame, color: AppColors.mainOneColor),
          label: "My Account".tr,
        ),
      ],
    );
  }
}
