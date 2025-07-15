import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/widget/rating/rating.widget.dart';
import '../shop/ratting_shop.widget.dart';
import '../shop/working_hours.view.dart';

class HeaderShoppingWidget extends StatelessWidget {
  const HeaderShoppingWidget({super.key, this.shop});
  final ShoppingDepartment? shop;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shop?.name ?? "---",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getMediumStyle()),
              const SizedBox(height: 5),
              Row(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Iconsax.location,
                      size: 12, color: Colors.blueAccent),
                  Expanded(
                    child: Text(
                      shop?.address ?? "---",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.getMediumStyle(
                          fontSize: 12, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              Text(
                shop?.isOpen == 1 ? "مفتوح" : "مغلق",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(
                  color: shop?.isOpen == 1 ? Colors.green : Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: showRatiingShow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "تقييم",
                  style: AppTextStyles.getRegularStyle(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            RatingWidget(rating: shop?.averageRating ?? 0, sizeIcon: 15),
            InkWell(
              onTap: showWorkingHours,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("اوقات العمل",
                    style: AppTextStyles.getMediumStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showWorkingHours() =>
      BottomSheetWidget.showIsScroll(WorkingHoursView(shop: shop));

  void showRatiingShow() =>
      BottomSheetWidget.showIsScroll(RattingShopWidget(shop: shop));
}
