import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';
import '../image/image_widget.dart';

class CardVerticalWidget extends StatelessWidget {
  const CardVerticalWidget(
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
                  child: ImageWidget(image,
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
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.getMediumStyle(),
                          ),
                        ),
                        if (price != null)
                          Text(
                            "$price\$",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.getBoldStyle(
                              color: Colors.orange,
                              fontSize: 14,
                            ),
                          ),
                      ],
                    ),
                    if (address != null)
                      Row(
                        spacing: 4,
                        children: [
                          Icon(Iconsax.location_copy, size: 12),
                          Text(
                            address ?? "---",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.getMediumStyle(),
                          ),
                        ],
                      ),
                    if (description != null)
                      Text(
                        description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getMediumStyle(fontSize: 12),
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
