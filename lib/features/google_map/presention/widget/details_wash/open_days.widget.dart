import 'package:almusafir_direct/core/utils/handler/handler.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/enum/days_of_week.dart';
import '../../../data/model/open_day.dart';

class OpenDaysWidget extends StatelessWidget {
  const OpenDaysWidget({super.key, required this.openDays});
  final List<OpenDay> openDays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: List.generate(
          openDays.length,
          (index) => OpenDayItemWidget(
            openDay: openDays[index],
            day: DaysOfWeek.values[(index + 1) % 7],
          ),
        ),
      ),
    );
  }
}

class OpenDayItemWidget extends StatelessWidget {
  const OpenDayItemWidget(
      {super.key, required this.openDay, required this.day});
  final OpenDay openDay;
  final DaysOfWeek day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            day.day,
            style: AppTextStyles.getMediumStyle(fontSize: 12),
          ),
          const Spacer(),
          (openDay.open == true)
              ? Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BuildTimeSlotWidget(
                        color: Colors.blue,
                        title: getDateTime(
                            openDay.shift1OpenTime, openDay.shift1CloseTime)),
                    _BuildTimeSlotWidget(
                        color: Colors.blue,
                        title: getDateTime(
                            openDay.shift2OpenTime, openDay.shift2CloseTime)),
                  ],
                )
              : _BuildTimeSlotWidget(color: Colors.red, title: "closed".tr),
        ],
      ),
    );
  }

  String getDateTime(DateTime? openTime, DateTime? closeTime) {
    return '${DateTimeHandler.formatTimeWithAmPm(openTime)} - ${DateTimeHandler.formatTimeWithAmPm(closeTime)}';
  }
}

class _BuildTimeSlotWidget extends StatelessWidget {
  const _BuildTimeSlotWidget({
    required this.title,
    required this.color,
  });
  final String? title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title ?? "----",
        textDirection: TextDirection.ltr,
        style: AppTextStyles.getRegularStyle(color: color, fontSize: 10),
      ),
    );
  }
}
