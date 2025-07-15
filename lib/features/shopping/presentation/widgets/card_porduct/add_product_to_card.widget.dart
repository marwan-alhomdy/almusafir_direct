import 'package:almusafir_direct/core/data/models/user_object_rating.module.dart';
import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/api/rating.api.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/button/button.widget.dart';
import '../../../../../core/widget/image/image_widget.dart';
import '../../../../../core/widget/liner.widget.dart';
import '../../../../../core/widget/rating/ratingbar.widget.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../data/models/shop_products/shop_products.dart';

class AddProductToCardWidget extends StatelessWidget {
  const AddProductToCardWidget(
      {super.key, required this.product, required this.onChanged});
  final ShopProduct product;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LineButtonSheetWidget(),
          Row(
            spacing: 10,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusAttribute.all(5),
                  child: ImageWidget(product.image?.small ?? "---",
                      width: 50, height: 50, fit: BoxFit.cover)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      product.name ?? "---",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.getMediumStyle(),
                    ),
                    RatingBarWidget(
                      initialRating: product.userObjectRating?.rating,
                      onRatingUpdate: (rating) {
                        product.userObjectRating ??= UserObjectRating();
                        product.userObjectRating?.rating = rating;
                        RatingApi.toggleRating(
                            objectType: product.objectType,
                            objectId: product.id,
                            rating: rating);
                      },
                    ),
                  ],
                ),
              ),
              if (Helper.isAuth)
                Icon(
                  product.userIsFavorite == 1
                      ? Iconsax.heart
                      : Iconsax.heart_copy,
                  color: Colors.redAccent,
                ),
            ],
          ),
          const Divider(thickness: 0.4),
          ButtonAddToRemoveWidget(
            count: 0,
            price: product.price ?? 0,
            onChanged: (count0) {
              if (count0 == 0) Get.back();
              count = count0;
            },
          ),
          const Divider(thickness: 0.4),
          ButtonWidget(
            text: 'OK'.tr,
            onTap: () {
              Get.back();
              onChanged(count);
            },
          ),
        ],
      ),
    );
  }
}

class ButtonAddToRemoveWidget extends StatefulWidget {
  const ButtonAddToRemoveWidget({
    super.key,
    required this.count,
    required this.onChanged,
    required this.price,
  });
  final int count;
  final void Function(int) onChanged;
  final num price;

  @override
  State<ButtonAddToRemoveWidget> createState() =>
      _ButtonAddToRemoveWidgetState();
}

class _ButtonAddToRemoveWidgetState extends State<ButtonAddToRemoveWidget> {
  int count = 0;

  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 25,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: (count == 1),
          child: IconButton(
              iconSize: 38,
              padding: const EdgeInsets.all(2.0),
              color: AppColors.redForeColor,
              icon: const Icon(Iconsax.trush_square),
              onPressed: () {
                if (count == 0) return;
                widget.onChanged(--count);
                setState(() {});
              }),
        ),
        Visibility(
            visible: (count != 1),
            child: IconButton(
                iconSize: 38,
                padding: const EdgeInsets.all(2.0),
                color: AppColors.mainOneColor,
                icon: const Icon(Iconsax.minus_square),
                onPressed: () {
                  if (count == 0) return;
                  widget.onChanged(--count);
                  setState(() {});
                })),
        Text(
          count.toString(),
          style: AppTextStyles.getMediumStyle(fontSize: 18),
        ),
        IconButton(
          iconSize: 38,
          padding: const EdgeInsets.all(2.0),
          color: AppColors.mainOneColor,
          icon: const Icon(Iconsax.add_square),
          onPressed: () {
            widget.onChanged(++count);
            setState(() {});
          },
        ),
        Visibility(
          visible: (count > 0),
          child: Column(
            spacing: 5,
            children: [
              Text(
                "total".tr,
                style: AppTextStyles.getMediumStyle(),
              ),
              Text(
                (widget.price * count).truncateToDouble().toString(),
                style: AppTextStyles.getMediumStyle(
                    color: Colors.deepOrange, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
