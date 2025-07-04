part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

//! Successfully
class GetOrderSuccessfullyState extends OrderState {
  final List<OrderModule> orders;
  const GetOrderSuccessfullyState({required this.orders});
}

//! Error
class ErrorGetOrderState extends OrderState {
  final String message;
  const ErrorGetOrderState({required this.message});
}

//! Loading
class LoadingOrdersState extends OrderState {
  const LoadingOrdersState();
}
