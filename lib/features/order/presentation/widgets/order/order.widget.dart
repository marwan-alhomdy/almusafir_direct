import 'package:almusafir_direct/features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_module/order_module.dart';
import 'card_order.widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, required this.orders});
  final List<OrderModule> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6),
      child: RefreshIndicator(
        onRefresh: () async => context.read<OrderCubit>().getOrders(),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) =>
              CardOrderWidget(order: orders[index]),
        ),
      ),
    );
  }
}
