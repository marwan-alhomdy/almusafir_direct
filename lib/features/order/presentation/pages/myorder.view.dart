import 'package:almusafir_direct/features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../logic/filter_order_cubit/filter_order_cubit.dart';
import '../widgets/filter/order_filterbar.dart';
import '../widgets/order/order.widget.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<OrderCubit>()..getOrders()),
        BlocProvider(create: (context) => FilterOrderCubit()),
      ],
      child: Scaffold(
        appBar: MyAppBarWithLogo(),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is LoadingOrdersState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorGetOrderState) {
              return ErrorCustomWidget(state.message,
                  onTap: () => context.read<OrderCubit>().getOrders());
            } else if (state is GetOrderSuccessfullyState) {
              context.read<FilterOrderCubit>().initFilterOrder(state.orders);
              return FilterOrderWidget();
            } else {
              return SizedBox();
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
        Divider(height: 0),
        BlocBuilder<FilterOrderCubit, FilterOrderState>(
          builder: (context, state) {
            if (state is FilterOrderSuccessfullyState) {
              return Expanded(child: OrdersWidget(orders: state.orders));
            } else if (state is LoadingFilterOrderState) {
              return CircularProgressIndicator();
            } else if (state is EmptyFilterOrderState) {
              return Center(child: Text("لا توجد طلبات"));
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
