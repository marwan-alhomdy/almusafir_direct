import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/data/models/order.module.dart';
import '../../../domain/usecases/cancel_order.usecases.dart';
import '../../../domain/usecases/fetch_orders.usecases.dart';
import '../../../domain/usecases/create_order.usecases.dart';
import '../../../domain/usecases/update_order.usecases.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final FetchOrdersUsecases fetchOrders;

  final CreateOrderUsecases createOrder;
  final UpdateOrderUsecases updateOrder;
  final CancelOrderUsecases cancelOrder;

  OrderBloc({
    required this.fetchOrders,
    required this.createOrder,
    required this.updateOrder,
    required this.cancelOrder,
  }) : super(OrderInitial()) {
    on<FetchOrdersEvent>(_fatchOrdersEvent);

    on<CreateOrderEvent>(_createOrderEvent);
    on<UpdateOrderEvent>(_updateOrderEvent);
    on<CancelOrderEvent>(_cancelOrderEvent);
  }

  Future<void> _fatchOrdersEvent(
      FetchOrdersEvent event, Emitter<OrderState> emit) async {
    emit(LoadingOrdersState());
    final failureOrSuccess = await fetchOrders();
    emit(failureOrSuccess.fold(
        (failuer) => ErrorOrderState(message: failuer.message),
        (orders) => FetchOrderSuccessfulState(orders: orders)));
  }

  Future<void> _createOrderEvent(
      CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(LoadingOrdersState());
    final failureOrSuccess = await createOrder(data: event.data);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorOrderState(message: failuer.message),
        (order) => CreateOrderSuccessfulState(order: order)));
  }

  Future<void> _updateOrderEvent(
      UpdateOrderEvent event, Emitter<OrderState> emit) async {
    emit(LoadingOrdersState());
    final failureOrSuccess = await updateOrder(data: event.data);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorOrderState(message: failuer.message),
        (_) => UpdateOrderSuccessfulState()));
  }

  Future<void> _cancelOrderEvent(
      CancelOrderEvent event, Emitter<OrderState> emit) async {
    emit(LoadingOrdersState());
    final failureOrSuccess = await cancelOrder(data: event.data);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorOrderState(message: failuer.message),
        (_) => CancelOrderSuccessfulState()));
  }
}
