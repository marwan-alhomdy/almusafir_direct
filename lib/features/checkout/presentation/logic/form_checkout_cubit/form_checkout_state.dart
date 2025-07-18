part of 'form_checkout_cubit.dart';

abstract class FormCheckoutState extends Equatable {
  const FormCheckoutState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends FormCheckoutState {}

final class ServicesStateLoadingState extends FormCheckoutState {}

final class Step1DetailsCheckoutLoadingState extends FormCheckoutState {}

final class Step1DetailsCheckoutErrorState extends FormCheckoutState {
  final String message;
  const Step1DetailsCheckoutErrorState({required this.message});
}

final class ServicesStateErrorState extends FormCheckoutState {
  final String message;
  const ServicesStateErrorState({required this.message});
}

class CheckoutSuccessfullyState extends FormCheckoutState {
  final CheckoutModule checkoutModule;
  const CheckoutSuccessfullyState(this.checkoutModule);
}

class Step1DetailsCheckoutSuccessfullyState extends FormCheckoutState {
  final CheckoutModule checkoutModule;
  const Step1DetailsCheckoutSuccessfullyState(this.checkoutModule);
}
