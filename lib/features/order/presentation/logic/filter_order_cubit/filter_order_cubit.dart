import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/enum/order_statues.dart';
import '../../../data/models/order_module/order_module.dart';

part 'filter_order_state.dart';

class FilterOrderCubit extends Cubit<FilterOrderState> {
  FilterOrderCubit() : super(FilterOrderInitial());
  OrderStatues selectedOrderStatuese = OrderStatues.All;
  List<OrderModule> orders = [];

  void initFilterOrder(List<OrderModule> orders) {
    this.orders = orders;
    filterOrder();
  }

  void changeSelectedOrderStatues(OrderStatues orderStatues) {
    if (selectedOrderStatuese == orderStatues) return;
    selectedOrderStatuese = orderStatues;
    filterOrder();
  }

  void filterOrder() {
    emit(LoadingFilterOrderState());

    if (selectedOrderStatuese == OrderStatues.All) {
      if (orders.isEmpty) {
        emit(EmptyFilterOrderState());
      } else {
        emit(FilterOrderSuccessfullyState(orders: orders));
      }
    } else {
      final filterOrder = orders
          .where(
              (order) => order.orderStatesRefType == selectedOrderStatuese.name)
          .toList();

      if (filterOrder.isEmpty) {
        emit(EmptyFilterOrderState());
      } else {
        emit(FilterOrderSuccessfullyState(orders: filterOrder));
      }
    }
  }
}
