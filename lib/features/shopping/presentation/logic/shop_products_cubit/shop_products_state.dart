part of 'shop_products_cubit.dart';

sealed class ShopProductsState extends Equatable {
  const ShopProductsState();

  @override
  List<Object> get props => [];
}

final class ShopProductsInitial extends ShopProductsState {}

final class ShopProductsLoadingState extends ShopProductsState {}

final class ShopProductsErrorState extends ShopProductsState {
  final String message;
  const ShopProductsErrorState({required this.message});
}

final class ShopProductsSuccessfullyState extends ShopProductsState {
  final List<ShopProduct> products;
  const ShopProductsSuccessfullyState(this.products);
}
