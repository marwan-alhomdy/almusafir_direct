import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardCategoryWidget extends StatelessWidget {
  const CardCategoryWidget(
      {super.key,
      required this.image,
      required this.title,
      this.price,
      this.address,
      this.description,
      this.onPressed});
  final String image;
  final String title;
  final num? price;
  final String? address;
  final String? description;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.3,
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusAttribute.top(12),
                  child: ImageWidget(image,
                      width: 200, height: 150, fit: BoxFit.cover)),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getMediumStyle(),
              ),
              if (address != null)
                Row(
                  spacing: 4,
                  children: [
                    const Icon(Iconsax.location_copy, size: 12),
                    Text(
                      address!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.getMediumStyle(fontSize: 12),
                    ),
                  ],
                ),
              if (price != null)
                Text(
                  "$price\$",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getBoldStyle(
                    color: Colors.orange,
                    fontSize: 18,
                  ),
                ),
              if (description != null)
                Text(
                  description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getMediumStyle(fontSize: 10),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
