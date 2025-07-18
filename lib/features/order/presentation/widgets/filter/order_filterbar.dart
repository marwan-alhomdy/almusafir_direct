import 'package:almusafir_direct/core/constants/enum/order_statues.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/button/button_filter.widget.dart';

class OrderFilterbar extends StatelessWidget {
  const OrderFilterbar(
      {super.key,
      required this.selectedOrderStatuese,
      required this.onChanged});
  final OrderStatues selectedOrderStatuese;
  final Function(OrderStatues) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: OrderStatues.values.length,
        itemBuilder: (context, index) {
          final orderStatues = OrderStatues.values[index];
          return ButtonFilterWidget(
            isSelected: orderStatues == selectedOrderStatuese,
            onSelected: () => onChanged(orderStatues),
            title: orderStatues.label,
          );
        },
      ),
    );
  }
}
