import 'package:almusafir_direct/features/order/domain/usecases/get_orders.usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_module/order_module.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrdersUescases getOrdersUescases;
  OrderCubit({required this.getOrdersUescases}) : super(OrderInitial());
  List<OrderModule>? orders;

  void chcekGetOrders() async {
    if (orders == null) {
      getOrders();
    } else {
      emit(GetOrderSuccessfullyState(orders: orders ?? []));
    }
  }

  void getOrders() async {
    emit(const LoadingOrdersState());
    final failureOrSuccess = await getOrdersUescases();
    failureOrSuccess
        .fold((failuer) => emit(ErrorGetOrderState(message: failuer.message)),
            (orders) {
      this.orders = orders;
      emit(GetOrderSuccessfullyState(orders: orders));
    });
  }
}
