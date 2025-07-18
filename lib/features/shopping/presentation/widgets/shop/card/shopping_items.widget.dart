import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../../core/Animation/scale_animation_widget.dart';
import '../../../../../../core/data/models/department/data.dart';
import '../../../../../home/data/model/orderstypes/datum.dart';
import '../../../pages/products_shopping.view.dart';
import 'card_shop_category.widget.dart';
import 'card_shop_vertical.widget.dart';

class ShoppingItmesWidget extends StatelessWidget {
  const ShoppingItmesWidget(
      {super.key,
      required this.isGridView,
      this.orderType,
      required this.shoppings});
  final bool isGridView;
  final OrderType? orderType;
  final List<ShoppingDepartment> shoppings;

  @override
  Widget build(BuildContext context) {
    return isGridView
        ? GridShoppingItemsWidget(orderType: orderType, shoppings: shoppings)
        : ListShoppingItemsWidget(orderType: orderType, shoppings: shoppings);
  }
}

class ListShoppingItemsWidget extends StatelessWidget {
  const ListShoppingItemsWidget(
      {super.key, required this.shoppings, required this.orderType});
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
  const GridShoppingItemsWidget(
      {super.key, required this.shoppings, required this.orderType});
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
