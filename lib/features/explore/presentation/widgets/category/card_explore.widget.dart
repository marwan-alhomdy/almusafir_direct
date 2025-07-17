import 'package:almusafir_direct/core/widget/rating/rating.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/image/image_widget.dart';
import '../../../../shopping/presentation/pages/shopping_details.view.dart';

class CardExploresWidget extends StatelessWidget {
  const CardExploresWidget({super.key, required this.explores});
  final List<ShoppingDepartment> explores;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: explores
          .map(
            (explore) => SizedBox(
              width: Get.width * 0.5,
              child: CardExploreWidget(
                onPressed: () => Get.to(() => ShopDetailsView(shop: explore)),
                explore: explore,
              ),
            ),
          )
          .toList(),
    );
  }
}

class CardExploreWidget extends StatelessWidget {
  const CardExploreWidget({super.key, required this.explore, this.onPressed});

  final ShoppingDepartment explore;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.3,
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorderAttribute.all(12),
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusAttribute.top(12),
                  child: ImageWidget(explore.image?.original ?? "",
                      width: 200, height: 150, fit: BoxFit.cover)),
              Text(
                explore.name ?? "----",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(),
              ),
              RatingWidget(sizeIcon: 15, rating: explore.averageRating ?? 0),
              Row(
                spacing: 4,
                children: [
                  const Icon(Iconsax.location,
                      color: AppColors.mainOneColor, size: 12),
                  Expanded(
                    child: Text(
                      explore.address ?? "----",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.getMediumStyle(
                          color: AppColors.mainOneColor, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
