part of 'shop_cart_cubit.dart';

sealed class ShopCartState extends Equatable {
  const ShopCartState();

  @override
  List<Object> get props => [];
}

final class ShopCartInitial extends ShopCartState {}

//! Successfully
class FetchShopCartSuccessfullyState extends ShopCartState {
  final List<RowCartModel> rowCart;
  const FetchShopCartSuccessfullyState({required this.rowCart});
}

//! Error
class ErrorFetchShopCartState extends ShopCartState {
  final String message;
  const ErrorFetchShopCartState({required this.message});
}

//! Loading
class LoadingFetchShopCartState extends ShopCartState {
  const LoadingFetchShopCartState();
}
