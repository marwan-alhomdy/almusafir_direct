import 'package:flutter/material.dart';

import '../../../../../../core/utils/drwn/get_h_dashed_line_painter.dart';
import '../../../../../../core/utils/resource/text_style.dart';

class SummeryCheckoutWidget extends StatelessWidget {
  const SummeryCheckoutWidget({
    super.key,
    this.order,
  });
  final dynamic order;
  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 5,
          children: [
            amountWidget("مبلغ الطلب :", order.cartTotal),
            amountWidget("مبلغ التوصيل :", order.shippingTotal),
            const SizedBox(height: 10),
            const HorizontalDashedWidget(),
            amountWidget("مبلغ الضريبة :", order.orderTaxes),
            amountWidget("مبلغ الخصم :", order.orderDiscount),
            amountWidget("إجمالي الطلب:", order.orderTotal),
          ],
        ),
      ),
    );
  }

  Widget amountWidget(String title, num? price) {
    return Visibility(
      visible: (price ?? 0) > 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.getRegularStyle(),
            ),
          ),
          Text(
            price.toString(),
            style: AppTextStyles.getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
