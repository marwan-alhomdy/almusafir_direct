import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/state/error.widget.dart';
import '../../../../home/data/model/orderstypes/datum.dart';
import '../../logic/department_bloc/department_bloc.dart';
import '../../logic/department_type_cubit/department_type_cubit.dart';
import 'card/shopping_items.widget.dart';
import 'state/loading_shopping.widget.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget(
      {super.key, required this.isGridView, required this.orderType});
  final OrderType? orderType;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) {
        if (state is DepartmentErrorState) {
          return SliverFillRemaining(
            child: ErrorCustomWidget(state.message,
                onTap: () => getShopping(context)),
          );
        } else if (state is DepartmentLoadingState) {
          return SliverFillRemaining(
            child: LoadingShoppingCategoryWidget(
              isGridView: isGridView,
              showHeader: false,
            ),
          );
        } else if (state is DepartmentSuccessfullyState) {
          return (state.shoppingDepartments.isEmpty)
              ? const SliverFillRemaining(
                  child: Center(child: Text("لا توجد بيانات")))
              : SliverToBoxAdapter(
                  child: ShoppingItmesWidget(
                      isGridView: isGridView,
                      orderType: orderType,
                      shoppings: state.shoppingDepartments),
                );
        } else {
          return const SliverFillRemaining();
        }
      },
    );
  }

  void getShopping(BuildContext context) {
    final type = context.read<DepartmentTypeCubit>().selectedDepartmentType;
    BlocProvider.of<DepartmentBloc>(context)
        .add(GetShoppingDepartment(orderType?.refType, type?.id));
  }
}
