import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/images.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../view/account_profile_view.dart';

class ButtonAcountWidget extends StatelessWidget {
  const ButtonAcountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: ExactAssetImage(
              AppImages.avatar,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مروان محمد احمد",
                style: AppTextStyles.getMediumStyle(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Text(
                '967 774 609 792',
                style: AppTextStyles.getRegularStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () => Get.to(() => AccountProfileView()),
              color: AppColors.mainOneColor,
              icon: Icon(Iconsax.edit)),
        ]),
      ),
    );
  }
}
