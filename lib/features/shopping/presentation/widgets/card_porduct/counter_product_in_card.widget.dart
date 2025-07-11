import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../data/models/shop_products/shop_products.dart';
import 'add_product_to_card.widget.dart';

class CounterProductInCardWidget extends StatelessWidget {
  const CounterProductInCardWidget(
      {super.key,
      required this.count,
      required this.onChanged,
      required this.product});
  final ShopProduct product;
  final int count;
  final void Function(int) onChanged;

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
          icon: Icon(Iconsax.add_square, size: 16),
          extendedTextStyle: AppTextStyles.getMediumStyle(fontSize: 12),
          label: Text("اضافة"),
          onPressed: () =>
              BottomSheetWidget.showIsScroll(AddProductToCardWidget(
            product: product,
            onChanged: (count) => onChanged(count),
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
              child: Icon(Iconsax.trush_square, size: 16),
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
              child: Icon(Iconsax.minus_square, size: 16),
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
              child: Icon(Iconsax.add_square, size: 16),
              onPressed: () => onChanged(count + 1),
            ),
          ),
      ],
    );
  }
}
