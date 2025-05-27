import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/text_style.dart';

class EmptyOrderWidget extends StatelessWidget {
  const EmptyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.bookmark_2_copy,
            color: Colors.grey,
            size: 100,
          ),
          const SizedBox(height: 20),
          Text(
            "there_are_no_orders".tr,
            style: AppTextStyles.getRegularStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
