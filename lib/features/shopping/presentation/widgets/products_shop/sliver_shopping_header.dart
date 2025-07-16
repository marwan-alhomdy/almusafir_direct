import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/images.dart';
import '../../../../../core/widget/favorite/favorite_shopping.widget.dart';
import '../../../../../core/widget/image/image_service.widget.dart';
import '../../../../../helper/language.helper.dart';
import '../../../../../helper/public_infromation.dart';

class SliverShopHeader {
  static SliverAppBar appBar(BuildContext context,
      {required ShoppingDepartment shop}) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
      title: Image.asset(AppImages.logo, height: 30),
      leadingWidth: 100,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          IconButton.filled(
            onPressed: () => Get.back(),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColorsWithTheme
                  .background
                  .withAlpha(120)), // غير اللون هنا
            ),
            icon: Icon(
              LanguageHelper.isArabic
                  ? Iconsax.arrow_right_1_copy
                  : Iconsax.arrow_left_copy,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      actions: [
        if (Helper.isAuth) FavoriteShoppingWidget(shop: shop),
        const SizedBox(width: 20),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: ImageServiceWidget(
          images: (shop.images?.isEmpty ?? true)
              ? ([shop.image?.original ?? ""])
              : shop.images?.map((image) => image.original ?? "").toList() ??
                  [],
        ),
      ),
    );
  }
}
