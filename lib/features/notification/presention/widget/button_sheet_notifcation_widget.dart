import 'package:flutter/material.dart';
import '../../../../core/constants/enum/months.dart';
import '../../domain/entities/notification.dart' as notifications;
import 'package:get/get.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/font_manager.dart';
import '../../../../core/utils/resource/images.dart';

class ButtonSheetNotifcationWidget extends StatelessWidget {
  const ButtonSheetNotifcationWidget({super.key, required this.notification});
  final notifications.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        const SizedBox(
          width: 60,
          child: Divider(
            thickness: 3,
            height: 1,
            color: AppColors.secondaryOneColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(61, 61, 61, 0.08),
                        offset: Offset(0, 4),
                        blurRadius: 40,
                      ),
                    ], color: Colors.white, shape: BoxShape.circle),
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
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                            color: AppColors.grayTwoColor,
                          )),
                    ],
                  )),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
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
