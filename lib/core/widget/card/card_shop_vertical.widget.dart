import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../data/models/department/data.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardShopVerticalWidget extends StatelessWidget {
  const CardShopVerticalWidget({super.key, required this.shop, this.onPressed});
  final ShoppingDepartment shop;
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
                  child: ImageWidget(shop.image?.small ?? "",
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
                            shop.name ?? "----",
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
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Iconsax.location,
                            size: 12, color: Colors.blueAccent),
                        Text(
                          shop.address ?? "---",
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
                        Icon(Iconsax.star_1, color: Colors.orange, size: 15),
                        Text(
                          shop.averageRating?.toString() ?? "---",
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
