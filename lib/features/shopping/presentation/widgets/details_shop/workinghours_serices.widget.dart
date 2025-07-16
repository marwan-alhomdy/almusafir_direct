import 'package:almusafir_direct/core/constants/enum/working_hours.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../../core/utils/handler/handler.dart';
import '../../../../../core/data/models/working_hours/working_hours.module.dart';

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
            ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: workingHours?.workinghours?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final working = workingHours?.workinghours?[index];
                  final statues = working?.type?.toWorkingHoursStatues();
                  return Row(
                    spacing: 20,
                    children: [
                      const SizedBox(),
                      Expanded(
                          child: Text(
                              LanguageHelper.chooseLabelLanguage(
                                arabic: working?.weekdayName,
                                english: working?.weekdayIso,
                              ),
                              style: AppTextStyles.getRegularStyle(
                                fontSize: 16,
                              ))),
                      Text(
                          DateTimeHandler.convertTimeToArabic(
                              working?.openingTime ?? ""),
                          style: AppTextStyles.getRegularStyle()),
                      const SizedBox(),
                      Text(
                          DateTimeHandler.convertTimeToArabic(
                              working?.closingTime ?? ""),
                          style: AppTextStyles.getRegularStyle()),
                      const SizedBox(),
                      Text(statues?.label ?? "---,",
                          style: AppTextStyles.getRegularStyle(
                              color: statues?.color)),
                      const SizedBox(),
                    ],
                  );
                }),
            const SizedBox(),
          ],
        ));
  }
}
