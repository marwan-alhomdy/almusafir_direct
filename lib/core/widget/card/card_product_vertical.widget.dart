import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../features/shopping/data/models/shop_products/shop_products.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardProductVerticalWidget extends StatelessWidget {
  const CardProductVerticalWidget(
      {super.key, required this.product, this.onPressed});
  final ShopProduct product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: onPressed,
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
                  child: ImageWidget(product.image?.small ?? "---",
                      width: 70, height: 70, fit: BoxFit.cover)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Text(
                            product.name ?? "---",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.getMediumStyle(),
                          ),
                        ),
                        Icon(
                          Iconsax.heart_copy,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(spacing: 10, children: [
                      Text(
                        "${product.price}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${product.oldPrice}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: Colors.orange,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(Iconsax.star_1, color: Colors.orange, size: 15),
                        Text(
                          product.averageRating?.toString() ?? "---",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getRegularStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          'kkk',
                          //shop.isOpen == 1 ? "dd" : "mm",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getRegularStyle(fontSize: 12),
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
