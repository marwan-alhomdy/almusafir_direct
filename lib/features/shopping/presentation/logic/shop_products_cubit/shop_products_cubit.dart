import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/shop_products/shop_products.dart';
import '../../../domain/usecases/get_shop_products_uescases.dart';

part 'shop_products_state.dart';

class ShopProductsCubit extends Cubit<ShopProductsState> {
  final GetShopProductsUescases getShopProductsUescases;
  ShopProductsCubit({required this.getShopProductsUescases})
      : super(ShopProductsInitial());

  void getShopProducts({String? orderType, int? departmentsId}) async {
    emit(ShopProductsLoadingState());

    final failureOrSuccess = await getShopProductsUescases(
        orderType: orderType, departmentsId: departmentsId?.toString());

    failureOrSuccess.fold(
      (failuer) => emit(ShopProductsErrorState(message: failuer.message)),
      (products) {
        emit(ShopProductsSuccessfullyState(products));
      },
    );
  }
}
