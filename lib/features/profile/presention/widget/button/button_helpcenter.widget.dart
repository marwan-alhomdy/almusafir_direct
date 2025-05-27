import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ButtonHelpCenterWidget extends StatelessWidget {
  const ButtonHelpCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () {},
        minTileHeight: 50,
        leading: const Icon(Iconsax.information, size: 18),
        title: Text("مركز المساعدة".tr),
      ),
    );
  }
}
