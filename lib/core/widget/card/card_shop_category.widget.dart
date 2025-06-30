import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../data/models/department/data.dart';
import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardShopCategoryWidget extends StatelessWidget {
  const CardShopCategoryWidget({super.key, required this.shop, this.onPressed});
  final ShoppingDepartment shop;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.3,
        margin: EdgeInsets.all(5),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusAttribute.top(12),
                  child: ImageWidget(shop.image?.small ?? "",
                      width: 200, height: 150, fit: BoxFit.cover)),
              SizedBox(),
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
                  InkWell(
                    onTap: () {},
                    customBorder: RoundedRectangleBorderAttribute.all(10),
                    child: Icon(
                      color: Colors.redAccent,
                      Iconsax.heart_copy,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              Text(
                shop.name ?? "---",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(),
              ),
              Row(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Iconsax.location, size: 12, color: Colors.blueAccent),
                  Text(
                    shop.address ?? "---",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.getMediumStyle(
                        fontSize: 12, color: Colors.blueAccent),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
