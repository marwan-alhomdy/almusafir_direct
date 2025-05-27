import 'package:almusafir_direct/core/utils/function/bottom_sheet.widget.dart';
import 'package:almusafir_direct/core/utils/handler/handler.dart';
import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/enum/booking_type.dart';
import 'booking_info.widget.dart';
import 'details_booking.dart';

class CardBookingWidget extends StatelessWidget {
  const CardBookingWidget({super.key, required this.booking});
  final BookingType booking;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBookingWidget(booking: booking),
            Divider(),
            Text(
              "فندق الرياض",
              style: AppTextStyles.getBoldStyle(fontSize: 18),
            ),
            Text(
              "إقامة فاخرة في وسط المدينة",
              style: AppTextStyles.getRegularStyle(),
            ),
            SizedBox(height: 10),
            BookingInfoWidget(
              icon: Iconsax.ticket_copy,
              label: "رقم الحجز :",
              value: "12346",
            ),
            BookingInfoWidget(
              icon: Iconsax.calendar_2_copy,
              label: "التاريخ :",
              value: DateTimeHandler.formatDate(DateTime.now()),
            ),
            BookingInfoWidget(
              icon: Iconsax.timer_1_copy,
              label: "الوقت :",
              value: DateTimeHandler.formatTime(DateTime.now()),
            ),
            BookingInfoWidget(
              icon: Iconsax.money_copy,
              label: "المبلغ :",
              value: "1000 ر.س",
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: _onShowInvoice,
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
                  Icon(Iconsax.document, color: Colors.white),
                  Text(
                    "عرض فاتورة الحجز",
                    style: AppTextStyles.getMediumStyle(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onShowInvoice() {
    BottomSheetWidget.show(DetailsBookingWidget(booking: booking));
  }
}

class HeaderBookingWidget extends StatelessWidget {
  const HeaderBookingWidget({super.key, required this.booking});
  final BookingType booking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(booking.icon, size: 18, color: AppColors.mainOneColor),
        SizedBox(width: 10),
        Text(
          LanguageHelper.isArabic ? booking.labelAr : booking.labelEn,
          style: AppTextStyles.getMediumStyle(fontSize: 16),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "تم التاكيد",
            style: AppTextStyles.getMediumStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
