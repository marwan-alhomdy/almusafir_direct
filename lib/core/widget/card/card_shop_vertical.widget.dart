import 'package:almusafir_direct/core/widget/rating/rating.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../helper/public_infromation.dart';
import '../../api/favorite.api.dart';
import '../../data/models/department/data.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardShopVerticalWidget extends StatefulWidget {
  const CardShopVerticalWidget({super.key, required this.shop, this.onPressed});
  final ShoppingDepartment shop;
  final VoidCallback? onPressed;

  @override
  State<CardShopVerticalWidget> createState() => _CardShopVerticalWidgetState();
}

class _CardShopVerticalWidgetState extends State<CardShopVerticalWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: widget.onPressed,
        customBorder: RoundedRectangleBorderAttribute.all(12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusAttribute.all(10),
                  child: ImageWidget(widget.shop.image?.small ?? "",
                      width: 70, height: 70, fit: BoxFit.cover)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            widget.shop.name ?? "----",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.getMediumStyle(),
                          ),
                        ),
                        if (Helper.isAuth)
                          InkWell(
                            onTap: () {
                              bool isFavorite = widget.shop.userIsFavorite == 1;
                              widget.shop.userIsFavorite = isFavorite ? 0 : 1;

                              FavoriteApi.toggleFavorite(
                                  objectId: widget.shop.id,
                                  objectType: widget.shop.objectType);
                              setState(() {});
                            },
                            child: Icon(
                              widget.shop.userIsFavorite == 1
                                  ? Iconsax.heart
                                  : Iconsax.heart_copy,
                              color: Colors.redAccent,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Iconsax.location,
                            size: 12, color: Colors.blueAccent),
                        Text(
                          widget.shop.address ?? "---",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getMediumStyle(
                              fontSize: 12, color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        RatingWidget(
                          rating: widget.shop.averageRating ?? 0,
                          sizeIcon: 15,
                        ),
                        Spacer(),
                        Text(
                          widget.shop.isOpen == 1 ? "مفتوح" : "مغلق",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getRegularStyle(
                              color: widget.shop.isOpen == 1
                                  ? Colors.green
                                  : Colors.redAccent,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
