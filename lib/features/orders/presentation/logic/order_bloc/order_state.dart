part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

//! Loading

class LoadingOrdersState extends OrderState {}

//!Successful

class FetchOrderSuccessfulState extends OrderState {
  final List<OrderModel> orders;
  const FetchOrderSuccessfulState({required this.orders});
}

class CreateOrderSuccessfulState extends OrderState {
  final OrderModel order;
  const CreateOrderSuccessfulState({required this.order});
}

class UpdateOrderSuccessfulState extends OrderState {}

class CancelOrderSuccessfulState extends OrderState {}
//! Error

class ErrorOrderState extends OrderState {
  final String message;
  const ErrorOrderState({required this.message});
}
