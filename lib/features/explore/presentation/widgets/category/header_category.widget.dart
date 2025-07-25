import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/enum/explore.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../helper/language.helper.dart';

class HeaderCategoryWidget extends StatelessWidget {
  const HeaderCategoryWidget(
      {super.key, required this.category, required this.onPressed});
  final ExploreFilter category;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(category.icon, size: 18),
        const SizedBox(width: 10),
        Text(
          LanguageHelper.isArabic ? category.labelAr : category.labelEn,
          style: AppTextStyles.getMediumStyle(fontSize: 16),
        ),
        const Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text("Show All".tr,
                style: AppTextStyles.getMediumStyle(color: Colors.blue))),
      ],
    );
  }
}
