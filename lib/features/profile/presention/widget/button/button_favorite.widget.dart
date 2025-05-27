import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../view/favorites.view.dart';

class ButtonFavoriteWidget extends StatelessWidget {
  const ButtonFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () => Get.to(() => MyFavoritesView()),
        minTileHeight: 50,
        leading: const Icon(Iconsax.heart, size: 18),
        title: Text("المفضلة".tr),
      ),
    );
  }
}
