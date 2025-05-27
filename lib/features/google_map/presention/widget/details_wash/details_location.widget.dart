import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/google_map/service/move_launch_url.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../helper/language.helper.dart';
import '../../../data/model/wash_location.dart';
import 'expansion_title.widget.dart';
import 'open_days.widget.dart';
import 'services.wash.widget.dart';

class DetailsLocationWidget extends StatelessWidget {
  const DetailsLocationWidget({super.key, required this.washLocation});
  final WashLocation washLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _DetailsWidget(
          title: LanguageHelper.chooseLabelLanguage(
            arabic: washLocation.nameAr ?? "---",
            english: washLocation.nameEn ?? "---",
          ),
          subtitle: LanguageHelper.chooseLabelLanguage(
            english: washLocation.nameAr ?? "---",
            arabic: washLocation.nameEn ?? "---",
          ),
          icon: Iconsax.shop_copy,
        ),
        _DetailsWidget(
          onTap: () => moveGoogleMapCustmer(latLng: washLocation.location),
          title: "location".tr,
          subtitle:
              "${washLocation.address?.city ?? "--"}  -  ${washLocation.address?.details ?? "-----"}",
          icon: Iconsax.direct_up_copy,
        ),
        ServicesWashWidget(
          title: "Services".tr,
          icon: Iconsax.archive_copy,
          services: _getWashTypes(),
        ),
        // ServicesWashWidget(
        //   title: "working_hours".tr,
        //   icon: Iconsax.clock_copy,
        //   services: washLocation.openTime ?? [],
        // ),
        ExpansionTitleWidget(
          title: "working_days".tr,
          icon: Iconsax.calendar_2_copy,
          children: [OpenDaysWidget(openDays: washLocation.openDays ?? [])],
        ),
        // ServicesWashWidget(
        //   title: "closing_hours".tr,
        //   icon: Iconsax.clock_copy,
        //   services: washLocation.closeTime ?? [],
        // ),
        const SizedBox(height: 10),
      ],
    );
  }

  List _getWashTypes() {
    return (washLocation.washBranchWashTypes ?? [])
        .map((e) => LanguageHelper.chooseLabelLanguage(
              arabic: e.washType?.nameAr ?? "---",
              english: e.washType?.name ?? "---",
            ))
        .toList();
  }

  void moveToDetailsOrder() {}
}

class _DetailsWidget extends StatelessWidget {
  const _DetailsWidget(
      {required this.icon, required this.title, this.subtitle, this.onTap});
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
          style: AppTextStyles.getMediumStyle(
            color: AppColors.mainOneColor,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getRegularStyle(),
              ),
        trailing: onTap == null
            ? null
            : Icon(LanguageHelper.chooseLanguage(
                arabic: Iconsax.arrow_left_3, english: Iconsax.arrow_right_2)));
  }
}
