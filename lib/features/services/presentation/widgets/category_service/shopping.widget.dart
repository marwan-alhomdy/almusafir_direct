import 'package:almusafir_direct/features/services/presentation/widgets/category_service/loading_service_category.widget.dart'
    show LoadingServiceCategoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../core/Animation/scale_animation_widget.dart';
import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/widget/card/card_category.widget.dart';
import '../../../../../core/widget/card/card_vertical.widget.dart';
import '../../../../../core/widget/state/error.widget.dart';
import '../../../../service_details/presentation/pages/service_details.view.dart';
import '../../logic/department_cubit/department_cubit.dart';

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
  final List<ShoppingDepartments> shoppings;

  @override
  Widget build(BuildContext context) {
    return AnimationColumnWidget(
      children: shoppings
          .map((shop) => CardVerticalWidget(
                image: shop.image?.small ?? "",
                title: shop.name ?? "---",
                address: shop.address,
                description: shop.shortDescription,
                onPressed: () => Get.to(() => const ServiceDetailsView()),
              ))
          .toList(),
    );
  }
}

class GridShoppingItemsWidget extends StatelessWidget {
  const GridShoppingItemsWidget({super.key, required this.shoppings});
  final List<ShoppingDepartments> shoppings;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      spacing: 0,
      runSpacing: 0,
      children: shoppings
          .map((shop) => SizedBox(
              width: Get.width * 0.5,
              child: CardCategoryWidget(
                image: shop.image?.small ?? "",
                title: shop.name ?? "---",
                address: shop.address,
                description: shop.shortDescription,
                onPressed: () => Get.to(() => const ServiceDetailsView()),
              )))
          .toList(),
    );
  }
}
