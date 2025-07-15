import 'package:almusafir_direct/features/shopping/presentation/logic/shop_cart_cubit/shop_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/data/models/department/data.dart';
import '../../../../core/widget/sliver/sliver_persistent_header.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/shop_products_cubit/shop_products_cubit.dart';
import '../widgets/card_porduct/card_shop_product.widget.dart';
import '../widgets/products_shop/button_move_to_cart.widget.dart';
import '../widgets/products_shop/header_shopping_widget.dart';
import '../widgets/products_shop/loading_cardpoducts.widget.dart';
import '../widgets/products_shop/sliver_shopping_header.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShopCartCubit(shop.id)..fetchCart()),
        BlocProvider(
          create: (context) => di.sl<ShopProductsCubit>()
            ..getShopProducts(
              orderType: orderType?.refType,
              departmentsId: shop.id,
            ),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar:
            ButtonMoveToCartWidget(shopId: shop.id, orderType: orderType),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
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
      ),
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
      return const SliverFillRemaining(child: LoadingCardProductWidget());
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
