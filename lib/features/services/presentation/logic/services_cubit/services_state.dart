part of 'services_cubit.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

final class ServicesStateLoadingState extends ServicesState {}

final class ServicesStateErrorState extends ServicesState {
  final String message;
  const ServicesStateErrorState({required this.message});
}

final class CheckoutSuccessfullyState extends ServicesState {}
