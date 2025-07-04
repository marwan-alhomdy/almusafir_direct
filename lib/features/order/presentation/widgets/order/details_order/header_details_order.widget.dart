import 'package:almusafir_direct/features/order/data/models/order_module/order_module.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../../core/utils/handler/handler.dart';
import '../../../../../../core/utils/resource/text_style.dart';
import '../card_order.widget.dart';
import '../order_info.widget.dart';

class HeaderDetailsOrderWidget extends StatelessWidget {
  const HeaderDetailsOrderWidget({super.key, required this.order});
  final OrderModule order;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOrderWidget(order: order),
            Divider(height: 5),
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
            Divider(height: 5),
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
          ],
        ),
      ),
    );
  }
}
