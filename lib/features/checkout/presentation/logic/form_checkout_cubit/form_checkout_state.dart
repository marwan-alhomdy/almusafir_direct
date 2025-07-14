part of 'form_checkout_cubit.dart';

abstract class FormCheckoutState extends Equatable {
  const FormCheckoutState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends FormCheckoutState {}

final class ServicesStateLoadingState extends FormCheckoutState {}

final class ServicesStateErrorState extends FormCheckoutState {
  final String message;
  const ServicesStateErrorState({required this.message});
}

final class CheckoutSuccessfullyState extends FormCheckoutState {}
