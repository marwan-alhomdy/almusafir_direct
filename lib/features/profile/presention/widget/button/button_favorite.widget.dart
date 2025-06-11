import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../view/favorites.view.dart';
import 'cardlist_profile.widget.dart';

class ButtonFavoriteWidget extends StatelessWidget {
  const ButtonFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardListProfileWidget(
      onTap: () => Get.to(() => MyFavoritesView()),
      icon: Iconsax.heart,
      title: "المفضلة".tr,
    );
  }
}
