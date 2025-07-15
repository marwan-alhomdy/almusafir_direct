import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/liner.widget.dart';
import '../../data/models/service.models.dart';

class BottomSheetServicesWidget extends StatelessWidget {
  const BottomSheetServicesWidget({super.key, required this.service});
  final OtherServiceMoele service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LineButtonSheetWidget(),
          Row(
            children: [
              Icon(service.icon, color: service.color),
              const SizedBox(width: 10),
              Text(
                service.title,
                style: AppTextStyles.getMediumStyle(fontSize: 18),
              ),
            ],
          ),
          Text(service.description, style: AppTextStyles.getRegularStyle()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
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
        ],
      ),
    );
  }
}
