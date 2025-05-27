import 'package:flutter/material.dart';
import '../../../../core/constants/enum/months.dart';
import '../../../../core/utils/drwn/get_h_dashed_line_painter.dart';
import '../../domain/entities/notification.dart' as notifications;
import 'package:get/get.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/font_manager.dart';
import '../../../../core/utils/resource/images.dart';

class ContinerNotificationWidget extends StatelessWidget {
  const ContinerNotificationWidget({super.key, required this.notification});

  final notifications.Notification notification;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: (notification.isRead ?? true)
                ? Colors.white
                : const Color(0xffEBEEF0),
            border: Border.all(width: 1, color: const Color(0xffEBEEF0)),
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const HorizontalDashedWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(61, 61, 61, 0.08),
                        offset: Offset(0, 4),
                        blurRadius: 40,
                      ),
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppImages.LOGO_COLORS),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_getDateOrder(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                          color: AppColors.grayTwoColor,
                        )),
                    Text(notification.title!.trim().tr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                          color: AppColors.grayOneColor,
                        )),
                    const SizedBox(height: 5),
                    Text(notification.message!.trim().tr,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                          color: AppColors.grayTwoColor,
                        )),
                  ],
                )),
              ],
            ),
            const SizedBox(height: 10),
            const HorizontalDashedWidget(),
            const SizedBox(height: 10),
          ],
        ));
  }

  String _getDateOrder() {
    String dateOrder = "";
    DateTime dateTime = DateTime.parse(notification.createdAt ?? "");
    dateOrder =
        "${dateTime.day} ${dateTime.month.monthName("code_language".tr)} ${dateTime.year} ";
    dateOrder +=
        " | ${dateTime.hour % 12}:${dateTime.minute} ${dateTime.hour > 12 ? "PM".tr : "AM".tr}";

    return dateOrder;
  }
}
