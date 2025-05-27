import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/drwn/triangle_clipper.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../../core/widget/state/loading_widget.dart';
import '../logic/filter_order_cubit/filter_order_cubit.dart';
import '../logic/order_bloc/order_bloc.dart';
import '../widget/appbar/order.appbar.dart';
import '../widget/filter_order/filter_order.widget.dart';
import '../widget/order.widget.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.sl<OrderBloc>()..add(const FetchOrdersEvent()),
        ),
        BlocProvider(create: (context) => FilterOrderCubit()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.secondaryOneColor,
        appBar: const OrderAppBar(),
        body: BlocListener<FilterOrderCubit, FilterOrderState>(
          listener: (context, state) {},
          child: BlocListener<OrderBloc, OrderState>(
            listener: _listenerOrderBloc,
            child: Column(
              children: [
                const FilterOrderWidget(),
                const Divider(
                  thickness: 0.3,
                  height: 0.3,
                  color: AppColors.grayOneColor,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(color: const Color(0xFFF9F9F9)),
                      ),
                      BlocBuilder<OrderBloc, OrderState>(
                        builder: _builderOrderBloc,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listenerOrderBloc(BuildContext context, OrderState state) {
    if (state is FetchOrderSuccessfulState) {
      context.read<FilterOrderCubit>().setOrders(state.orders);
    }
  }

  Widget _builderOrderBloc(BuildContext context, OrderState state) {
    if (state is LoadingOrdersState) {
      return const LoadingWiget();
    } else if (state is ErrorOrderState) {
      return ErrorCustomWidget(
        message: state.message,
        onTap: () => context.read<OrderBloc>().add(const FetchOrdersEvent()),
      );
    } else if (state is FetchOrderSuccessfulState) {
      return const OrderWidget();
    } else {
      return const SizedBox();
    }
  }
}
