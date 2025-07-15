import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../api/favorite.api.dart';
import '../../data/models/department/data.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';
import '../rating/rating.widget.dart';

class CardShopCategoryWidget extends StatefulWidget {
  const CardShopCategoryWidget({super.key, required this.shop, this.onPressed});
  final ShoppingDepartment shop;
  final VoidCallback? onPressed;

  @override
  State<CardShopCategoryWidget> createState() => _CardShopCategoryWidgetState();
}

class _CardShopCategoryWidgetState extends State<CardShopCategoryWidget> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadiusAttribute.top(12),
                      child: ImageWidget(widget.shop.image?.small ?? "",
                          width: 200, height: 150, fit: BoxFit.cover)),
                  if (Helper.isAuth)
                    IconButton.filled(
                      onPressed: () {
                        bool isFavorite = widget.shop.userIsFavorite == 1;
                        widget.shop.userIsFavorite = isFavorite ? 0 : 1;
                        FavoriteApi.toggleFavorite(
                            objectId: widget.shop.id,
                            objectType: widget.shop.objectType);
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.white.withAlpha(120)), // غير اللون هنا
                      ),
                      icon: Icon(
                        color: Colors.redAccent,
                        widget.shop.userIsFavorite == 1
                            ? Iconsax.heart
                            : Iconsax.heart_copy,
                        size: 20,
                      ),
                    ),
                ],
              ),
              const SizedBox(),
              Row(
                spacing: 4,
                children: [
                  RatingWidget(
                    rating: widget.shop.averageRating ?? 0,
                    sizeIcon: 15,
                  ),
                  const Spacer(),
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
                  const SizedBox(width: 10),
                ],
              ),
              Text(
                widget.shop.name ?? "---",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(),
              ),
              Row(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Iconsax.location,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
