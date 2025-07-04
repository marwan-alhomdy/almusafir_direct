part of 'filter_order_cubit.dart';

sealed class FilterOrderState extends Equatable {
  const FilterOrderState();

  @override
  List<Object> get props => [];
}

final class FilterOrderInitial extends FilterOrderState {}

final class LoadingFilterOrderState extends FilterOrderState {}

final class EmptyFilterOrderState extends FilterOrderState {}

final class FilterOrderSuccessfullyState extends FilterOrderState {
  final List<OrderModule> orders;
  const FilterOrderSuccessfullyState({required this.orders});
}
