import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/rating/rating.widget.dart';
import '../../../../helper/public_infromation.dart';
import '../widgets/details_shop/workinghours_serices.widget.dart';
import '../widgets/products_shop/sliver_shopping_header.dart';
import '../widgets/shop/ratting_shop.widget.dart';

class ShopDetailsView extends StatelessWidget {
  const ShopDetailsView({super.key, required this.shop});
  final ShoppingDepartment shop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverShopHeader.appBar(context, shop: shop),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shop.name ?? "-----",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),

                  // Rating
                  Row(
                    children: [
                      RatingWidget(rating: shop.averageRating ?? 0),
                      const Spacer(),
                      if (Helper.isAuth)
                        TextButton(
                          onPressed: showRatiingShow,
                          child: Text(
                            "تقييم",
                            style: AppTextStyles.getMediumStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                    ],
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      const Icon(Iconsax.location,
                          color: AppColors.mainOneColor, size: 15),
                      Expanded(
                        child: Text(
                          shop.address ?? "---",
                          style: AppTextStyles.getMediumStyle(
                              color: AppColors.mainOneColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),

                  Row(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Iconsax.note_2_copy, color: Colors.deepOrange),
                      Text(
                        "الوصف",
                        style: AppTextStyles.getMediumStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(shop.description ?? "----"),
                  const SizedBox(height: 30),

                  WorkingHoursSericesWidget(workingHours: shop.workingHours),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 2,
                    runSpacing: 0,
                    children: shop.phone
                            ?.map((phone) =>
                                Chip(label: Text(phone.phoneNumber ?? "--")))
                            .toList() ??
                        [],
                  ),
                  Wrap(
                    spacing: 2,
                    runSpacing: 0,
                    children: shop.email
                            ?.map((email) =>
                                Chip(label: Text(email.emailLabel ?? "--")))
                            .toList() ??
                        [],
                  ),

                  // Buttons

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showRatiingShow() =>
      BottomSheetWidget.showIsScroll(RattingShopWidget(shop: shop));
}
