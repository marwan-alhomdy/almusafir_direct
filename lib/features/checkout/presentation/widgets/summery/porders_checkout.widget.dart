import 'package:flutter/material.dart';

import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../core/utils/resource/text_style.dart';
import '../../../../../../core/widget/image/image_widget.dart';
import '../../../../cart/data/models/row_cart.module.dart';

class ProductsCheckoutWidget extends StatelessWidget {
  const ProductsCheckoutWidget({super.key, required this.productsCart});
  final List<RowCartModel> productsCart;

  @override
  Widget build(BuildContext context) {
    final length = productsCart.length;

    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            for (int index = 0; index < length; index++) ...[
              CardCheckoutProductWidget(
                product: productsCart[index],
              ),
              if (index != length - 1) const Divider(thickness: 0.3),
            ],
          ],
        ),
      ),
    );
  }
}

class CardCheckoutProductWidget extends StatelessWidget {
  const CardCheckoutProductWidget({
    super.key,
    required this.product,
  });

  final RowCartModel? product;
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
              product?.name ?? "---",
              style: AppTextStyles.getRegularStyle(),
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  "${product?.qty} ${product?.unitsName}",
                  style: AppTextStyles.getRegularStyle(),
                ),
                Text(
                  "x",
                  style: AppTextStyles.getRegularStyle(
                    color: AppColors.grayTwoColor,
                  ),
                ),
                Text(
                  product?.price?.toString() ?? "--",
                  style: AppTextStyles.getRegularStyle(color: Colors.blue),
                ),
              ],
            ),
            Text(
              "الاجمالي : ${product?.subtotal.toString() ?? "--"}",
              style: AppTextStyles.getRegularStyle(),
            ),
          ],
        )),
      ],
    );
  }
}
