import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../view/payment.methods.view.dart';

class ButtonPaymentMethodWidget extends StatelessWidget {
  const ButtonPaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () => Get.to(() => const PaymentMethodsWidget()),
        minTileHeight: 50,
        leading: const Icon(Iconsax.card, size: 18),
        title: Text("طرق الدفع".tr),
      ),
    );
  }
}
