import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../core/Animation/scale_animation_widget.dart';
import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/widget/card/card_shop_category.widget.dart';
import '../../../../../core/widget/card/card_shop_vertical.widget.dart';
import '../../../../../core/widget/state/error.widget.dart';
import '../../logic/department_cubit/department_cubit.dart';
import '../../pages/service_items.view.dart';
import 'loading_service_category.widget.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget({super.key, required this.isGridView});
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        if (state is DepartmentErrorState) {
          return SliverFillRemaining(
              child: ErrorCustomWidget(state.message, onTap: () {}));
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
                        shoppings: state.shoppingDepartments)
                    : ListShoppingItemsWidget(
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
}

class ListShoppingItemsWidget extends StatelessWidget {
  const ListShoppingItemsWidget({super.key, required this.shoppings});
  final List<ShoppingDepartment> shoppings;

  @override
  Widget build(BuildContext context) {
    return AnimationColumnWidget(
      children: shoppings
          .map((shop) => CardShopVerticalWidget(
                shop: shop,
                onPressed: () => Get.to(() => ServiceItemsView(
                      departmentsId: shop.id,
                    )),
              ))
          .toList(),
    );
  }
}

class GridShoppingItemsWidget extends StatelessWidget {
  const GridShoppingItemsWidget({super.key, required this.shoppings});
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
                onPressed: () => Get.to(() => ServiceItemsView(
                      departmentsId: shop.id,
                    )),
              )))
          .toList(),
    );
  }
}
