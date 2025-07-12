import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:almusafir_direct/features/cart/domain/usecases/delete_cartusecases.dart';
import 'package:almusafir_direct/features/cart/domain/usecases/get_cartusecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.getCartUescases,
    required this.deleteCartUescases,
  }) : super(CartInitial());
  final GetCartUescases getCartUescases;

  final DeleteCartUescases deleteCartUescases;

  List<RowCartModel> rowCart = [];

  void fetchCart() async {
    emit(LoadingFetchCartState());
    final failureOrSuccess = await getCartUescases(data: {});
    failureOrSuccess
        .fold((failuer) => emit(ErrorFetchCartState(message: failuer.message)),
            (rowCart) {
      this.rowCart = rowCart;
      emit(FetchCartSuccessfullyState(rowCart: rowCart));
    });
  }

  void deleteCart() async {
    emit(LoadingFetchCartState());
    final failureOrSuccess = await deleteCartUescases(data: {});
    failureOrSuccess
        .fold((failuer) => emit(ErrorFetchCartState(message: failuer.message)),
            (rowCart) {
      this.rowCart = rowCart;
      emit(FetchCartSuccessfullyState(rowCart: rowCart));
    });
  }

  void refreshRowsInCart(List<RowCartModel> rows) {
    emit(LoadingFetchCartState());
    rowCart = rows;
    emit(FetchCartSuccessfullyState(rowCart: rows));
  }
}
