import 'package:almusafir_direct/core/utils/handler/handler.dart';
import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/enum/order_statues.dart';
import '../../../data/models/order_module/order_module.dart';
import '../../pages/details_order.dart';
import 'order_info.widget.dart';

class CardOrderWidget extends StatelessWidget {
  const CardOrderWidget({super.key, required this.order});
  final OrderModule order;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOrderWidget(order: order),
            Divider(),
            Text(
              order.department?.name ?? "---",
              style: AppTextStyles.getMediumStyle(fontSize: 17),
            ),
            Text(
              order.department?.address ?? "----",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.getRegularStyle(),
            ),
            SizedBox(height: 10),
            OrderInfoWidget(
              icon: Iconsax.ticket_copy,
              label: "رقم الطلب :",
              value: "${order.id ?? "---"}#",
            ),
            OrderInfoWidget(
              icon: Iconsax.calendar_2_copy,
              label: "التاريخ :",
              value: DateTimeHandler.formatDateFromString(order.createdAt),
            ),
            OrderInfoWidget(
              icon: Iconsax.timer_1_copy,
              label: "الوقت :",
              value: DateTimeHandler.formatTimeFromString(order.createdAt),
            ),
            OrderInfoWidget(
              icon: Iconsax.money_copy,
              label: "المبلغ :",
              value: "${order.orderTotal ?? "0"}",
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => DetailsOrderView(order: order)),
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
}

class HeaderOrderWidget extends StatelessWidget {
  const HeaderOrderWidget({super.key, required this.order});
  final OrderModule order;

  @override
  Widget build(BuildContext context) {
    final orderStates = order.orderStatesRefType?.toOrderStatues();

    return Row(
      children: [
        Icon(Iconsax.bookmark_2_copy, size: 18, color: AppColors.mainOneColor),
        SizedBox(width: 10),
        Text(
          order.orderTypes?.name ?? "---",
          style: AppTextStyles.getMediumStyle(fontSize: 16),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: orderStates?.color ?? Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            orderStates?.label ?? "----",
            style: AppTextStyles.getMediumStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
