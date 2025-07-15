import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/shop_products/datum.dart';
import '../../../../../core/data/shop_products/shop_products.dart';
import '../../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import 'add_product_to_card.widget.dart';

class CounterProductInCardWidget extends StatelessWidget {
  const CounterProductInCardWidget(
      {super.key,
      required this.count,
      required this.onChanged,
      required this.onAddToCard,
      required this.product});
  final ShopProduct product;
  final int count;
  final void Function(int) onChanged;
  final void Function(int, UnitsDatum?) onAddToCard;

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return SizedBox(
        height: 25,
        child: FloatingActionButton.extended(
          heroTag: null,
          elevation: 1,
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorderAttribute.all(5),
          icon: const Icon(Iconsax.add_square, size: 16),
          extendedTextStyle: AppTextStyles.getMediumStyle(fontSize: 12),
          label: const Text("اضافة"),
          onPressed: () =>
              BottomSheetWidget.showIsScroll(AddProductToCardWidget(
            product: product,
            onChanged: onAddToCard,
          )),
        ),
      );
    }

    return Row(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (count == 1)
          SizedBox(
            height: 25,
            width: 25,
            child: FloatingActionButton.small(
              heroTag: null,
              elevation: 1,
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorderAttribute.all(5),
              child: const Icon(Iconsax.trush_square, size: 16),
              onPressed: () => onChanged(0),
            ),
          ),
        if (count > 1)
          SizedBox(
            height: 25,
            width: 25,
            child: FloatingActionButton.small(
              heroTag: null,
              elevation: 1,
              backgroundColor: Colors.deepOrangeAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorderAttribute.all(5),
              child: const Icon(Iconsax.minus_square, size: 16),
              onPressed: () => onChanged(count - 1),
            ),
          ),
        if (count >= 1)
          Text(
            count.toString(),
            style: AppTextStyles.getMediumStyle(fontSize: 16),
          ),
        if (count >= 1)
          SizedBox(
            height: 25,
            width: 25,
            child: FloatingActionButton.small(
              heroTag: null,
              elevation: 1,
              backgroundColor: Colors.deepOrangeAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorderAttribute.all(5),
              child: const Icon(Iconsax.add_square, size: 16),
              onPressed: () => onChanged(count + 1),
            ),
          ),
      ],
    );
  }
}
