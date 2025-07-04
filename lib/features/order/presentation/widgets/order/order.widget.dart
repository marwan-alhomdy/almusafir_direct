import 'package:flutter/material.dart';

import '../../../data/models/order_module/order_module.dart';
import 'card_order.widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, required this.orders});
  final List<OrderModule> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (context, index) => CardOrderWidget(order: orders[index]),
      ),
    );
  }
}
