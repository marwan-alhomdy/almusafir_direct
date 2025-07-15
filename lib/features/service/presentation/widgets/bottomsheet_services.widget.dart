import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/data/shop_products/shop_products.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/image/image_widget.dart';
import '../../../../core/widget/liner.widget.dart';
import '../../../../helper/public_infromation.dart';

class BottomSheetServicesWidget extends StatelessWidget {
  const BottomSheetServicesWidget({super.key, required this.service});
  final ShopProduct service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LineButtonSheetWidget(),
          Row(
            spacing: 10,
            children: [
              ImageWidget(service.image?.small ?? "---",
                  width: 40, height: 30, fit: BoxFit.cover),
              Text(
                service.name ?? "--",
                style: AppTextStyles.getMediumStyle(fontSize: 18),
              ),
            ],
          ),
          Text(service.description ?? "---",
              style: AppTextStyles.getRegularStyle()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final phone = Helper
                  .primaryData?.data?.department?.data?.phone?.firstOrNull;
              launchUrl(Uri.parse("https://wa.me/${phone?.phoneNumber}"),
                  mode: LaunchMode.externalApplication);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainOneColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Iconsax.whatsapp, color: Colors.white),
                Text(
                  'Inquire Now',
                  style: AppTextStyles.getMediumStyle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
