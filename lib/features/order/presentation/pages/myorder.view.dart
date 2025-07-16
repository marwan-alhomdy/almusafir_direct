import 'package:almusafir_direct/features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../logic/filter_order_cubit/filter_order_cubit.dart';
import '../widgets/filter/order_filterbar.dart';
import '../widgets/order/order.widget.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  void initState() {
    context.read<OrderCubit>().chcekGetOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterOrderCubit(),
      child: Scaffold(
        appBar: const MyAppBarWithLogo(),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is LoadingOrdersState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorGetOrderState) {
              return ErrorCustomWidget(state.message,
                  onTap: () => context.read<OrderCubit>().getOrders());
            } else if (state is GetOrderSuccessfullyState) {
              context.read<FilterOrderCubit>().initFilterOrder(state.orders);
              return const FilterOrderWidget();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class FilterOrderWidget extends StatefulWidget {
  const FilterOrderWidget({super.key});

  @override
  State<FilterOrderWidget> createState() => _FilterOrderWidgetState();
}

class _FilterOrderWidgetState extends State<FilterOrderWidget> {
  @override
  Widget build(BuildContext context) {
    final filterOrderCubit = context.read<FilterOrderCubit>();
    return Column(
      spacing: 10,
      children: [
        OrderFilterbar(
          selectedOrderStatuese: filterOrderCubit.selectedOrderStatuese,
          onChanged: (value) => setState(
              () => filterOrderCubit.changeSelectedOrderStatues(value)),
        ),
        const Divider(height: 0),
        BlocBuilder<FilterOrderCubit, FilterOrderState>(
          builder: (context, state) {
            if (state is FilterOrderSuccessfullyState) {
              return Expanded(child: OrdersWidget(orders: state.orders));
            } else if (state is LoadingFilterOrderState) {
              return const CircularProgressIndicator();
            } else if (state is EmptyFilterOrderState) {
              return const Center(child: Text("لا توجد طلبات"));
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
