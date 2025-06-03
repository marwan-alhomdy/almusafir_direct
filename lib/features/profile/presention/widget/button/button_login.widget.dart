import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../auth/persention/view/auth_view.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key, required this.onLogin});
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () =>
            Get.to(() => const AuthintcationView())?.then((value) => onLogin()),
        minTileHeight: 50,
        leading: const Icon(Iconsax.login, size: 18),
        title: Text("login".tr),
      ),
    );
  }
}
