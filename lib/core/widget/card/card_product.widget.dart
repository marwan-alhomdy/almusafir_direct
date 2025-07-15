import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../features/shopping/data/models/shop_products/shop_products.dart';
import '../../../helper/public_infromation.dart';
import '../../api/favorite.api.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardProductCategoryWidget extends StatefulWidget {
  const CardProductCategoryWidget(
      {super.key, required this.product, this.onPressed});
  final ShopProduct product;
  final VoidCallback? onPressed;

  @override
  State<CardProductCategoryWidget> createState() =>
      _CardProductCategoryWidgetState();
}

class _CardProductCategoryWidgetState extends State<CardProductCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.3,
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: widget.onPressed,
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadiusAttribute.top(12),
                      child: ImageWidget(widget.product.image?.small ?? "",
                          width: 200, height: 120, fit: BoxFit.cover)),
                  if (Helper.isAuth)
                    IconButton.filled(
                      onPressed: () {
                        bool isFavorite = widget.product.userIsFavorite == 1;
                        widget.product.userIsFavorite = isFavorite ? 0 : 1;
                        FavoriteApi.toggleFavorite(
                            objectId: widget.product.id,
                            objectType: widget.product.objectType);
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.white.withAlpha(120)), // غير اللون هنا
                      ),
                      icon: Icon(
                        color: Colors.redAccent,
                        widget.product.userIsFavorite == 1
                            ? Iconsax.heart
                            : Iconsax.heart_copy,
                        size: 20,
                      ),
                    ),
                ],
              ),
              Row(spacing: 10, children: [
                const Icon(Iconsax.star_1, color: Colors.orange, size: 15),
                Text(
                  widget.product.averageRating?.toString() ?? "---",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getRegularStyle(fontSize: 12),
                ),
              ]),
              Text(
                widget.product.name ?? "----",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(),
              ),
              Row(spacing: 10, children: [
                Text(
                  "${widget.product.price}\$",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getBoldStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
                if ((widget.product.oldPrice ?? 0) > 0)
                  Text(
                    "${widget.product.oldPrice}\$",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.getBoldStyle(
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                  ),
              ]),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
