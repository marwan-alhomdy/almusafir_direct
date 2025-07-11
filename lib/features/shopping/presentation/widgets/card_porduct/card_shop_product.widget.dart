import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/widget/rating/rating.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/api/favorite.api.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/image/image_widget.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../data/models/shop_products/shop_products.dart';
import 'counter_product_in_card.widget.dart';

class CardShopProductWidget extends StatefulWidget {
  const CardShopProductWidget({super.key, required this.product});
  final ShopProduct product;

  @override
  State<CardShopProductWidget> createState() => _CardShopProductWidgetState();
}

class _CardShopProductWidgetState extends State<CardShopProductWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.all(5),
                child: ImageWidget(widget.product.image?.small ?? "---",
                    width: 70, height: 70, fit: BoxFit.cover)),
            Expanded(
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name ?? "---",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getMediumStyle(),
                        ),
                      ),
                      if (Helper.isAuth)
                        InkWell(
                          onTap: changeFavorite,
                          child: Icon(
                            widget.product.userIsFavorite == 1
                                ? Iconsax.heart
                                : Iconsax.heart_copy,
                            color: Colors.redAccent,
                          ),
                        ),
                    ],
                  ),
                  RatingWidget(
                    rating: widget.product.averageRating ?? 0,
                    sizeIcon: 12,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "${widget.product.price}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                        ),
                      ),
                      if ((widget.product.oldPrice ?? 0) > 0)
                        Text(
                          "${widget.product.oldPrice}\$",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getBoldStyle(
                            color: AppColors.grayOneColor,
                          ).copyWith(
                              decorationColor: Colors.red,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      CounterProductInCardWidget(
                        count: count,
                        onChanged: (count) {
                          this.count = count;
                          setState(() {});
                        },
                        product: widget.product,
                      )
                      //ButtonAddToRemoveWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeFavorite() {
    bool isFavorite = widget.product.userIsFavorite == 1;
    widget.product.userIsFavorite = isFavorite ? 0 : 1;
    FavoriteApi.toggleFavorite(
        objectId: widget.product.id, objectType: widget.product.objectType);
    setState(() {});
  }
}
