part of 'other_services_cubit.dart';

sealed class OtherServicesState extends Equatable {
  const OtherServicesState();

  @override
  List<Object> get props => [];
}

final class OtherServicesInitial extends OtherServicesState {}

final class OtherServicesLoadingState extends OtherServicesState {}

final class OtherServicesErrorState extends OtherServicesState {
  final String message;
  const OtherServicesErrorState({required this.message});
}

final class FetchOtherServicesSuccessfullyState extends OtherServicesState {
  final List<ShopProduct> products;
  const FetchOtherServicesSuccessfullyState(this.products);
}
