import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/drwn/get_h_dashed_line_painter.dart';
import '../../../../../../core/utils/resource/text_style.dart';
import '../../../../data/models/order_module/order_module.dart';

class DetailsOrderPriceWidget extends StatelessWidget {
  const DetailsOrderPriceWidget(this.order, {super.key});
  final OrderModule order;
  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 2,
          children: [
            amountWidget("Order Amount:".tr, order.subtotal),
            amountWidget("Delivery Fee:".tr, order.shippingTotal),
            amountWidget("Discount Amount:".tr, order.shippingDiscount),
            amountWidget("Tip or Gratuity:".tr, order.tipAmount),
            amountWidget("Service Fee:".tr, order.plusAmount),
            amountWidget("Tax Amount:".tr, order.shippingTaxes),
            amountWidget("Additional Discounts:".tr, order.minusAmount),
            const SizedBox(height: 5),
            const HorizontalDashedWidget(),
            const SizedBox(height: 5),
            amountWidget("Total Order Amount:".tr, order.orderTotal),
            const SizedBox(height: 10),
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
