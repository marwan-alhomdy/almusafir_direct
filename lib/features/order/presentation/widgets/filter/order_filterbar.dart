import 'package:almusafir_direct/core/constants/enum/order_statues.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';

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
          final isSelected = orderStatues == selectedOrderStatuese;

          return GestureDetector(
            onTap: () => onChanged(orderStatues),
            child: Card.filled(
              color: isSelected ? Colors.blue : null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(
                  orderStatues.label,
                  style: AppTextStyles.getMediumStyle(
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
