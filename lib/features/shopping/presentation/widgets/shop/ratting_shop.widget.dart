import 'package:almusafir_direct/core/widget/field/text_field.widget.dart';
import 'package:almusafir_direct/core/widget/rating/ratingbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/api/rating.api.dart';
import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/data/models/user_object_rating.module.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/widget/button/button.widget.dart';
import '../../../../../core/widget/liner.widget.dart';

class RattingShopWidget extends StatefulWidget {
  final ShoppingDepartment? shop;
  const RattingShopWidget({super.key, required this.shop});

  @override
  State<RattingShopWidget> createState() => _RattingShopWidgetState();
}

class _RattingShopWidgetState extends State<RattingShopWidget> {
  final noteController = TextEditingController();
  num? rating;
  @override
  void initState() {
    noteController.text = widget.shop?.userObjectRating?.content ?? "";
    rating = widget.shop?.userObjectRating?.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          const LineButtonSheetWidget(),
          Row(
            spacing: 5,
            children: [
              const SizedBox(),
              const Icon(
                Iconsax.shop_copy,
                color: Colors.grey,
              ),
              Text(
                'تقييم المتجر',
                style: AppTextStyles.getMediumStyle(fontSize: 16),
              ),
            ],
          ),
          RatingBarWidget(
            initialRating: rating,
            itemSize: 40,
            onRatingUpdate: (rating) => this.rating = rating,
          ),
          Row(
            spacing: 5,
            children: [
              const SizedBox(),
              const Icon(
                Iconsax.note_2_copy,
                color: Colors.grey,
              ),
              Text(
                'note'.tr,
                style: AppTextStyles.getMediumStyle(fontSize: 16),
              ),
            ],
          ),
          TextFieldWidget(
            controller: noteController,
            maxLines: 4,
          ),
          ButtonWidget(
            text: 'OK'.tr,
            onTap: () {
              widget.shop?.userObjectRating ??= UserObjectRating();
              widget.shop?.userObjectRating?.rating = rating;
              widget.shop?.userObjectRating?.content = noteController.text;
              RatingApi.toggleRating(
                  objectType: widget.shop?.objectType,
                  objectId: widget.shop?.id,
                  comment: noteController.text,
                  rating: rating ?? 0);
              Get.back();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
