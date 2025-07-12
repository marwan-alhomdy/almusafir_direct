part of 'product_card_cubit.dart';

sealed class ProductCardState extends Equatable {
  const ProductCardState();

  @override
  List<Object> get props => [];
}

final class ProductCardInitial extends ProductCardState {}

//! Successfully
class ChangeProductCartSuccessfullyState extends ProductCardState {
  final List<RowCartModel> rowCart;
  const ChangeProductCartSuccessfullyState({required this.rowCart});
}

//! Error
class ErrorUpdateProductInCartState extends ProductCardState {
  final String message;
  const ErrorUpdateProductInCartState({required this.message});
}

//! Loading
class LoadingUpdateProductInCartState extends ProductCardState {
  const LoadingUpdateProductInCartState();
}
