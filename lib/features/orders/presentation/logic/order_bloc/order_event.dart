part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchOrdersEvent extends OrderEvent {
  const FetchOrdersEvent();
}

class UpdateOrderEvent extends OrderEvent {
  final Map data;
  const UpdateOrderEvent({required this.data});
}

class CreateOrderEvent extends OrderEvent {
  final Map data;
  const CreateOrderEvent({required this.data});
}

class CancelOrderEvent extends OrderEvent {
  final Map data;
  const CancelOrderEvent({required this.data});
}
