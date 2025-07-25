import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/data/models/department/data.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/shop_products_cubit/shop_products_cubit.dart';
import '../widgets/service/shop_products.widget.dart';
import '../widgets/shop/state/loading_shopping.widget.dart';

class ServiceItemsView extends StatefulWidget {
  const ServiceItemsView({
    super.key,
    this.orderType,
    this.shop,
  });
  final OrderType? orderType;
  final ShoppingDepartment? shop;

  @override
  State<ServiceItemsView> createState() => _ServiceItemsViewState();
}

class _ServiceItemsViewState extends State<ServiceItemsView> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ShopProductsCubit>()
        ..getShopProducts(
          orderType: widget.orderType?.refType,
          departmentsId: widget.shop?.id,
        ),
      child: Scaffold(
        appBar: widget.shop != null
            ? null
            : MyAppBarWithFilter(
                isGridView: isGridView,
                onChange: (value) => setState(() => isGridView = value),
              ),
        body: BlocBuilder<ShopProductsCubit, ShopProductsState>(
          builder: _builderShopProducts,
        ),
      ),
    );
  }

  Widget _builderShopProducts(BuildContext context, ShopProductsState state) {
    if (state is ShopProductsErrorState) {
      return ErrorCustomWidget(state.message,
          onTap: () => context.read<ShopProductsCubit>()
            ..getShopProducts(
              orderType: widget.orderType?.refType,
              departmentsId: widget.shop?.id,
            ));
    } else if (state is ShopProductsLoadingState) {
      return LoadingShoppingCategoryWidget(
        isGridView: isGridView,
        showHeader: false,
      );
    } else if (state is ShopProductsSuccessfullyState) {
      return ShopProductsWidget(
          isGridView: isGridView, products: state.products);
    } else {
      return const SizedBox();
    }
  }
}
