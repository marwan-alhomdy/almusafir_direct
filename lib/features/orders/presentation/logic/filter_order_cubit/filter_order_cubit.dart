import 'package:almusafir_direct/core/data/models/order.module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/enum/order_status_custmer.dart';

part 'filter_order_state.dart';

class FilterOrderCubit extends Cubit<FilterOrderState> {
  FilterOrderCubit() : super(FilterOrderInitial());
  CarWashOrderStatus carWashOrderStatus = CarWashOrderStatus.values.first;
  List<OrderModel> orders = [];

  void setOrders(List<OrderModel> orders) {
    emit(LoadingFilterOrderState());
    this.orders = orders;
    emit(FilterOrderSuccessfulState(orders: _getFilterOrder()));
  }

  void filterOrder(CarWashOrderStatus carWashOrderStatus) {
    this.carWashOrderStatus = carWashOrderStatus;
    emit(LoadingFilterOrderState());
    final orders = _getFilterOrder();
    emit(FilterOrderSuccessfulState(orders: orders));
  }

  List<OrderModel> _getFilterOrder() {
    if (carWashOrderStatus == CarWashOrderStatus.All) {
      return orders;
    } else {
      return orders
          .where((order) => order.status == carWashOrderStatus.name)
          .toList();
    }
  }
}
