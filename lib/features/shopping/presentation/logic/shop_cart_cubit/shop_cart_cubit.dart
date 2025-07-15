import 'package:almusafir_direct/core/api/cart.api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/data/shop_products/datum.dart';
import '../../../../../core/data/shop_products/shop_products.dart';
import '../../../../cart/data/models/row_cart.module.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  ShopCartCubit(this.shopId) : super(ShopCartInitial());
  final int? shopId;
  List<RowCartModel> rowCart = [];

  void fetchCart() async {
    emit(const LoadingFetchShopCartState());
    final failureOrSuccess = await CartApi.fetchRowsCart({"shop_id": shopId});
    failureOrSuccess.fold(
        (failuer) => emit(ErrorFetchShopCartState(message: failuer.message)),
        (rowCart) {
      this.rowCart = rowCart;
      emit(FetchShopCartSuccessfullyState(rowCart: rowCart));
    });
  }

  void addToCart(ShopProduct product, int count, UnitsDatum? unit) async {
    product.isLoading = true;
    emit(const LoadingFetchShopCartState());

    final data = _getDataCart(product, count, unit);

    final failureOrSuccess = await CartApi.addToCart(data);
    product.isLoading = false;
    failureOrSuccess.fold(
        (failuer) => emit(ErrorFetchShopCartState(message: failuer.message)),
        (rowCart) {
      this.rowCart = rowCart;
      emit(FetchShopCartSuccessfullyState(rowCart: rowCart));
    });
  }

  void updateCart(ShopProduct product, int count, UnitsDatum? unit) async {
    emit(const LoadingFetchShopCartState());
    final data = _getDataCart(product, count, unit);
    final failureOrSuccess = await CartApi.addToCart(data);
    failureOrSuccess.fold(
        (failuer) => emit(ErrorFetchShopCartState(message: failuer.message)),
        (rowCart) {
      this.rowCart = rowCart;
      emit(FetchShopCartSuccessfullyState(rowCart: rowCart));
    });
  }

  Map<String, dynamic> _getDataCart(
      ShopProduct product, int count, UnitsDatum? unit) {
    return {
      "shop_id": shopId,
      "menuId": product.id,
      "quantity": count,
      "comment": "",
      "options": [],
      "price": unit?.price,
      "units_name": unit?.unitsName,
      "units_id": unit?.id,
    };
  }
}
