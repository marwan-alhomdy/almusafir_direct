import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/widget/liner.widget.dart';
import '../button/cardlist_profile.widget.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({
    super.key,
    required this.onChangeTheme,
    required this.onDeleteTheme,
  });
  final void Function(bool) onChangeTheme;
  final void Function() onDeleteTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LineButtonSheetWidget(),
          CardListProfileWidget(
              title: "light".tr,
              icon: Iconsax.sun_1,
              onTap: () => onChangeTheme(true)),
          CardListProfileWidget(
              title: "dark".tr,
              icon: Iconsax.moon,
              onTap: () => onChangeTheme(false)),
          CardListProfileWidget(
              icon: Iconsax.setting, title: "system".tr, onTap: onDeleteTheme),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
