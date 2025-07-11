import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../features/shopping/data/models/shop_products/shop_products.dart';
import '../../../helper/public_infromation.dart';
import '../../api/favorite.api.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardProductVerticalWidget extends StatefulWidget {
  const CardProductVerticalWidget(
      {super.key, required this.product, this.onPressed});
  final ShopProduct product;
  final VoidCallback? onPressed;

  @override
  State<CardProductVerticalWidget> createState() =>
      _CardProductVerticalWidgetState();
}

class _CardProductVerticalWidgetState extends State<CardProductVerticalWidget> {
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
                  borderRadius: BorderRadiusAttribute.all(5),
                  child: ImageWidget(widget.product.image?.small ?? "---",
                      width: 70, height: 70, fit: BoxFit.cover)),
              Expanded(
                child: Column(
                  spacing: 10,
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
                            onTap: () {
                              bool isFavorite =
                                  widget.product.userIsFavorite == 1;
                              widget.product.userIsFavorite =
                                  isFavorite ? 0 : 1;

                              FavoriteApi.toggleFavorite(
                                  objectId: widget.product.id,
                                  objectType: widget.product.objectType);
                              setState(() {});
                            },
                            child: Icon(
                              widget.product.userIsFavorite == 1
                                  ? Iconsax.heart
                                  : Iconsax.heart_copy,
                              color: Colors.redAccent,
                            ),
                          ),
                      ],
                    ),
                    Row(spacing: 10, children: [
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
                    ]),
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
