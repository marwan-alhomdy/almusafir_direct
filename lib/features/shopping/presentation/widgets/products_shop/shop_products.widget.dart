import 'package:almusafir_direct/features/shopping/data/models/shop_products/shop_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../core/Animation/scale_animation_widget.dart';
import '../../../../../core/widget/card/card_product.widget.dart';
import '../../../../../core/widget/card/card_product_vertical.widget.dart';
import '../../../../service/presentation/pages/service_details.view.dart';

class ShopProductsWidget extends StatelessWidget {
  const ShopProductsWidget({
    super.key,
    required this.isGridView,
    required this.products,
  });

  final List<ShopProduct> products;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: isGridView
          ? GridServiceItemsWidget(products: products)
          : ListServiceItemsWidget(products: products),
    );
  }
}

class ListServiceItemsWidget extends StatelessWidget {
  const ListServiceItemsWidget({super.key, required this.products});
  final List<ShopProduct> products;
  @override
  Widget build(BuildContext context) {
    return AnimationColumnWidget(
      children: products
          .map((product) => CardProductVerticalWidget(
                product: product,
                onPressed: () =>
                    Get.to(() => ServiceDetailsView(product: product)),
              ))
          .toList(),
    );
  }
}

class GridServiceItemsWidget extends StatelessWidget {
  const GridServiceItemsWidget({super.key, required this.products});
  final List<ShopProduct> products;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      spacing: 0,
      runSpacing: 0,
      children: products
          .map((product) => SizedBox(
              width: Get.width * 0.5,
              child: CardProductCategoryWidget(
                product: product,
                onPressed: () =>
                    Get.to(() => ServiceDetailsView(product: product)),
              )))
          .toList(),
    );
  }
}
