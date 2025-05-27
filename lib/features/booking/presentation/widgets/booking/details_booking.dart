import 'package:almusafir_direct/core/utils/handler/handler.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/enum/booking_type.dart';
import 'booking_info.widget.dart';

class DetailsBookingWidget extends StatelessWidget {
  const DetailsBookingWidget({super.key, required this.booking});
  final BookingType booking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineButtonSheetWidget(),
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
          Divider(height: 20),
          BookingInfoWidget(
            icon: Iconsax.location_copy,
            label: "الموقع :",
            value: "الرياض, المملكة العربية السعودية",
          ),
          BookingInfoWidget(
            icon: Iconsax.building_copy,
            label: "الفندق :",
            value: "فندق الرياض",
          ),
          BookingInfoWidget(
            icon: Iconsax.star_1_copy,
            label: "نوع الاقامة :",
            value: "دائمة",
          ),
          Divider(height: 20),
          BookingInfoWidget(
            icon: Iconsax.status_copy,
            label: "الحالة :",
            value: "تم التاكيد",
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "تم التاكيد",
                style: AppTextStyles.getMediumStyle(color: Colors.white),
              ),
            ),
          ),
          BookingInfoWidget(
            icon: Iconsax.money_copy,
            label: "المبلغ :",
            value: "1000 ر.س",
          ),
          BookingInfoWidget(
              icon: Iconsax.card_copy,
              label: "طريقة الدفع :",
              value: "الكريمي"),
          Divider(height: 20),
          Text("الملاحظات", style: AppTextStyles.getBoldStyle(fontSize: 16)),
          Text("لا يوجد ملاحظات", style: AppTextStyles.getRegularStyle()),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
