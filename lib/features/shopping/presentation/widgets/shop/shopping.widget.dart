import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../core/Animation/scale_animation_widget.dart';
import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/widget/card/card_shop_category.widget.dart';
import '../../../../../core/widget/card/card_shop_vertical.widget.dart';
import '../../../../../core/widget/state/error.widget.dart';
import '../../../../home/data/model/orderstypes/datum.dart';
import '../../logic/department_bloc/department_bloc.dart';
import '../../logic/department_type_cubit/department_type_cubit.dart';
import '../../pages/products_shopping.view.dart';
import 'loading_service_category.widget.dart';

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
                  onTap: () => getShopping(context)));
        } else if (state is DepartmentLoadingState) {
          return SliverFillRemaining(
              child: LoadingServiceCategoryWidget(
            isGridView: isGridView,
            showHeader: false,
          ));
        } else if (state is DepartmentSuccessfullyState) {
          return SliverList(
            delegate: SliverChildListDelegate(
              [
                isGridView
                    ? GridShoppingItemsWidget(
                  orderType: orderType,
                        shoppings: state.shoppingDepartments)
                    : ListShoppingItemsWidget(
                    orderType: orderType,
                        shoppings: state.shoppingDepartments),
              ],
            ),
          );
        } else {
          return const SliverFillRemaining();
        }
      },
    );
  }

  void getShopping(BuildContext context) {
    final type = context.read<DepartmentTypeCubit>().selectedDepartmentType;
    context
        .read<DepartmentBloc>()
        .add(GetShoppingDepartment(orderType?.refType, type?.id));
  }
}

class ListShoppingItemsWidget extends StatelessWidget {
  const ListShoppingItemsWidget({super.key, required this.shoppings, required this.orderType});
  final OrderType? orderType;
  final List<ShoppingDepartment> shoppings;

  @override
  Widget build(BuildContext context) {
    return AnimationColumnWidget(
      children: shoppings
          .map((shop) => CardShopVerticalWidget(
                shop: shop,
                onPressed: () => Get.to(() => ProductsShoppingView(
                      shop: shop,
                  orderType: orderType,
                    )),
              ))
          .toList(),
    );
  }
}

class GridShoppingItemsWidget extends StatelessWidget {
  const GridShoppingItemsWidget({super.key, required this.shoppings, required this.orderType});
  final OrderType? orderType;
  final List<ShoppingDepartment> shoppings;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      spacing: 0,
      runSpacing: 0,
      children: shoppings
          .map((shop) => SizedBox(
              width: Get.width * 0.5,
              child: CardShopCategoryWidget(
                shop: shop,
                onPressed: () => Get.to(() => ProductsShoppingView(
                  orderType: orderType,
                      shop: shop,
                    )),
              )))
          .toList(),
    );
  }
}
