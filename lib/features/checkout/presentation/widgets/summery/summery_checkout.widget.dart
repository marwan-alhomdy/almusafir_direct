import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/drwn/get_h_dashed_line_painter.dart';
import '../../../../../../core/utils/resource/text_style.dart';
import '../../logic/form_checkout_cubit/form_checkout_cubit.dart';

class SummeryCheckoutWidget extends StatelessWidget {
  const SummeryCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formCheckoutCubit = context.read<FormCheckoutCubit>();
    return BlocBuilder<FormCheckoutCubit, FormCheckoutState>(builder: (_, __) {
      final cartTotals = formCheckoutCubit.checkoutModule?.cartTotals;
      return Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 2,
            children: [
              amountWidget("Order Amount:".tr, cartTotals?.subtotal?.value),
              amountWidget(
                  "Delivery Fee:".tr, cartTotals?.shippingTotal?.value),
              amountWidget(
                  "Discount Amount:".tr, cartTotals?.shippingDiscount?.value),
              amountWidget("Tip or Gratuity:".tr, cartTotals?.tip?.value),
              amountWidget("Service Fee:".tr, cartTotals?.plusAmount?.value),
              amountWidget("Tax Amount:".tr, cartTotals?.shippingTaxes?.value),
              amountWidget(
                  "Additional Discounts:".tr, cartTotals?.minusAmount?.value),
              const SizedBox(height: 5),
              const HorizontalDashedWidget(),
              const SizedBox(height: 5),
              amountWidget("Total Order Amount:".tr, cartTotals?.total?.value),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
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
              style: AppTextStyles.getMediumStyle(),
            ),
          ),
          Text(
            price.toString(),
            style: AppTextStyles.getMediumStyle(),
          ),
        ],
      ),
    );
  }
}
