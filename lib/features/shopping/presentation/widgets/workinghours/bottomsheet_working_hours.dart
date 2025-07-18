import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/liner.widget.dart';
import 'package:almusafir_direct/features/shopping/presentation/widgets/workinghours/working_hourse.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/department/data.dart';

class BottomSheetWorkingHoursView extends StatelessWidget {
  final ShoppingDepartment? shop;
  const BottomSheetWorkingHoursView({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const LineButtonSheetWidget(),
          Row(
            spacing: 10,
            children: [
              const SizedBox(),
              const Icon(
                Iconsax.calendar_1_copy,
                color: Colors.deepOrange,
              ),
              Text(
                'أوقات العمل',
                style: AppTextStyles.getMediumStyle(fontSize: 16),
              ),
            ],
          ),
          WorkingHoursWidget(workingHours: shop?.workingHours),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
