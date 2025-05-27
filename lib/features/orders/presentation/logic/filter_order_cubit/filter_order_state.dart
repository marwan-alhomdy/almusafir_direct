part of 'filter_order_cubit.dart';

sealed class FilterOrderState extends Equatable {
  const FilterOrderState();

  @override
  List<Object> get props => [];
}

final class FilterOrderInitial extends FilterOrderState {}

//! Loading

class LoadingFilterOrderState extends FilterOrderState {}

//!Successful

class FilterOrderSuccessfulState extends FilterOrderState {
  final List<OrderModel> orders;
  const FilterOrderSuccessfulState({required this.orders});
}
