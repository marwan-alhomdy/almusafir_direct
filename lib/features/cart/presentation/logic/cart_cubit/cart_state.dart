part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

//! Successfully
class FetchCartSuccessfullyState extends CartState {
  final List<RowCartModel> rowCart;
  const FetchCartSuccessfullyState({required this.rowCart});
}

//! Error
class ErrorFetchCartState extends CartState {
  final String message;
  const ErrorFetchCartState({required this.message});
}

//! Loading
class LoadingFetchCartState extends CartState {
  const LoadingFetchCartState();
}
