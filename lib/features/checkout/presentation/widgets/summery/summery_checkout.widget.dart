import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              amountWidget("مبلغ الطلب :", cartTotals?.subtotal?.value),
              amountWidget("مبلغ التوصيل :", cartTotals?.shippingTotal?.value),
              amountWidget("مبلغ الخصم :", cartTotals?.shippingDiscount?.value),
              amountWidget("الإكرامية أو البقشيش:", cartTotals?.tip?.value),
              amountWidget("رسوم خدمة :", cartTotals?.plusAmount?.value),
              amountWidget("مبلغ الضريبة :", cartTotals?.shippingTaxes?.value),
              amountWidget("خصومات إضافية :", cartTotals?.minusAmount?.value),
              const SizedBox(height: 5),
              const HorizontalDashedWidget(),
              const SizedBox(height: 5),
              amountWidget("إجمالي الطلب:", cartTotals?.total?.value),
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
