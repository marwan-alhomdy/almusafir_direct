import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/row_cart.module.dart';
import '../../../domain/usecases/add_cartusecases.dart';

part 'product_card_state.dart';

class ProductCardCubit extends Cubit<ProductCardState> {
  final AddToCartUescases addToCartUescases;
  ProductCardCubit({
    required this.addToCartUescases,
  }) : super(ProductCardInitial());

  int? shopId;
  void setShopId(int? shopId) => this.shopId = shopId;

  void updateProductFromCart(RowCartModel product, int count) async {
    product.isLoading = true;
    emit(const LoadingUpdateProductInCartState());
    final data = _getDataCart(product, count);
    final failureOrSuccess = await addToCartUescases(data: data);
    product.isLoading = false;
    failureOrSuccess.fold(
        (failuer) =>
            emit(ErrorUpdateProductInCartState(message: failuer.message)),
        (rows) => emit(ChangeProductCartSuccessfullyState(rowCart: rows)));
  }

  Map<String, dynamic> _getDataCart(RowCartModel product, int count) {
    return {
      "shop_id": shopId,
      "menuId": product.id,
      "quantity": count,
      "comment": "",
      "options": [],
      "price": product.price,
      "units_name": product.unitsName,
      "units_id": product.unitsId,
    };
  }
}
