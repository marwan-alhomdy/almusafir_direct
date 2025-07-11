import 'package:almusafir_direct/core/constants/enum/working_hours.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/liner.widget.dart';
import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/utils/handler/handler.dart';

class WorkingHoursView extends StatelessWidget {
  final ShoppingDepartment? shop;
  const WorkingHoursView({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          LineButtonSheetWidget(),
          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(
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
              physics: ClampingScrollPhysics(),
              itemCount: shop?.workingHours?.workinghours?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final working = shop?.workingHours?.workinghours?[index];
                final statues = working?.type?.toWorkingHoursStatues();
                return Row(
                  spacing: 20,
                  children: [
                    SizedBox(),
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
                    SizedBox(),
                    Text(
                        DateTimeHandler.convertTimeToArabic(
                            working?.closingTime ?? ""),
                        style: AppTextStyles.getRegularStyle()),
                    SizedBox(),
                    Text(statues?.label ?? "---,",
                        style: AppTextStyles.getRegularStyle(
                            color: statues?.color)),
                    SizedBox(),
                  ],
                );
              }),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
