import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/data/models/department/data.dart';
import '../../../../core/widget/sliver/sliver_persistent_header.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/shop_products_cubit/shop_products_cubit.dart';
import '../widgets/card_porduct/card_shop_product.widget.dart';
import '../widgets/products_shop/header_shopping_widget.dart';
import '../widgets/products_shop/sliver_shopping_header.dart';
import '../widgets/shop/loading_service_category.widget.dart';

class ProductsShoppingView extends StatelessWidget {
  const ProductsShoppingView({
    super.key,
    this.orderType,
    required this.shop,
  });
  final OrderType? orderType;
  final ShoppingDepartment shop;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ShopProductsCubit>()
        ..getShopProducts(
          orderType: orderType?.refType,
          departmentsId: shop.id,
        ),
      child: Scaffold(
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverShopHeader.appBar(context, shop: shop),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                  child: HeaderShoppingWidget(shop: shop),
                  height: 100,
                ),
              ),
              BlocBuilder<ShopProductsCubit, ShopProductsState>(
                builder: _builderShopProducts,
              ),
            ],
          ),
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text('الانتقال إلى السلة'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainOneColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ))),
    );
  }

  Widget _builderShopProducts(BuildContext context, ShopProductsState state) {
    if (state is ShopProductsErrorState) {
      return SliverFillRemaining(
          child: ErrorCustomWidget(state.message,
              onTap: () => context.read<ShopProductsCubit>()
                ..getShopProducts(
                  orderType: orderType?.refType,
                  departmentsId: shop.id,
                )));
    } else if (state is ShopProductsLoadingState) {
      return SliverFillRemaining(
        child: LoadingServiceCategoryWidget(
          isGridView: false,
          showHeader: false,
        ),
      );
    } else if (state is ShopProductsSuccessfullyState) {
      return SliverList(
        delegate: SliverChildListDelegate(
          state.products
              .map((product) => CardShopProductWidget(product: product))
              .toList(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
