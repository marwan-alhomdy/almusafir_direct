import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/constants/enum/order_status_custmer.dart';
import '../../../../core/widget/state/loading_widget.dart';
import '../logic/filter_order_cubit/filter_order_cubit.dart';
import 'card_order/card_order.widget.dart';
import 'state/empty_order_widget.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterOrderCubit, FilterOrderState>(
      builder: (context, state) {
        if (state is LoadingFilterOrderState) {
          return const LoadingWiget();
        } else if (state is FilterOrderSuccessfulState) {
          final orders = state.orders;
          return orders.isEmpty
              ? const EmptyOrderWidget()
              : AnimationLimiterWidget(
                  physics: null,
                  children: List.generate(
                    orders.length,
                    (index) => CardOrderWidget(
                      order: orders[index],
                      status: orders[index].status.toCarWashOrderStatus(),
                    ),
                  ),
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
