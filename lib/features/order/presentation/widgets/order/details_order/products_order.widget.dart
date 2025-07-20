import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../core/utils/resource/text_style.dart';
import '../../../../../../core/widget/image/image_widget.dart';
import '../../../../data/models/order_module/order_module.dart';
import '../../../../data/models/product_item_order/product_item_order.dart';

class ProductsOrderWidget extends StatelessWidget {
  const ProductsOrderWidget(this.order, {super.key});
  final OrderModule order;

  @override
  Widget build(BuildContext context) {
    final length = (order.items?.data ?? []).length;
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          for (int index = 0; index < length; index++) ...[
            CardOrderProductWidget(
              product: order.items?.data?[index],
            ),
            if (index != length - 1) const Divider(thickness: 0.3),
          ],
        ]),
      ),
    );
  }
}

class CardOrderProductWidget extends StatelessWidget {
  const CardOrderProductWidget({
    super.key,
    required this.product,
  });

  final ProdcutItemOrder? product;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFEBEEF0))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageWidget(
                product?.image?.small ?? product?.image?.medium ?? ""),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 5,
          children: [
            Text(
              product?.customName ?? "---",
              style: AppTextStyles.getRegularStyle(),
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  "${product?.quantity} ${product?.unitsName}",
                  style: AppTextStyles.getRegularStyle(),
                ),
                Text(
                  "x",
                  style: AppTextStyles.getRegularStyle(
                    color: AppColors.grayTwoColor,
                  ),
                ),
                Text(
                  product?.realPrice?.toString() ?? "--",
                  style: AppTextStyles.getRegularStyle(color: Colors.blue),
                ),
              ],
            ),
            Text(
              "${"Total:".tr} ${product?.subtotal.toString() ?? "--"}",
              style: AppTextStyles.getRegularStyle(),
            ),
          ],
        )),
      ],
    );
  }
}
