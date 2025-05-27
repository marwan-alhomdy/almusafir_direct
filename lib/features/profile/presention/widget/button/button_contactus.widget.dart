import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../view/contactus.view.dart';

class ButtonContactUsWidget extends StatelessWidget {
  const ButtonContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () => Get.to(() => ContactUsView()),
        minTileHeight: 50,
        leading: const Icon(Iconsax.message, size: 18),
        title: Text("تواصل معنا".tr),
      ),
    );
  }
}
