import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/working_hours/working_hours.module.dart';
import 'working_hourse.widget.dart';

class WorkingHoursSericesWidget extends StatelessWidget {
  const WorkingHoursSericesWidget({super.key, required this.workingHours});
  final WorkingHoursModule? workingHours;

  @override
  Widget build(BuildContext context) {
    if ((workingHours?.workinghours ?? []).isEmpty) return const SizedBox();
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        spacing: 20,
        children: [
          const SizedBox(),
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
          WorkingHoursWidget(workingHours: workingHours),
          const SizedBox(),
        ],
      ),
    );
  }
}
