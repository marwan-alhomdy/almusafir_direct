import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
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
          ClipOval(
            child: ImageWidget(
              Helper.user?.avatar?.original ?? "",
               width: 50,
              height: 50,
              errorWiget: Image.asset(AppImages.avatar, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Helper.user?.name ?? "----",
                style: AppTextStyles.getMediumStyle(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Text(
                Helper.user?.mobile ?? Helper.user?.email ?? "----",
                style: AppTextStyles.getRegularStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () =>
                Get.to(() => AccountProfileView())?.then((_) => Get.back()),
            color: AppColors.mainOneColor,
            icon: Icon(Iconsax.edit),
          ),
        ]),
      ),
    );
  }
}
