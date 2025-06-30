part of 'payment_methods_cubit.dart';

sealed class PaymentMethodsState extends Equatable {
  const PaymentMethodsState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodsInitial extends PaymentMethodsState {}

class GetPaymentMethodsSuccessfulState extends PaymentMethodsState {
  final List<ServiceModul> paymentMethods;
  const GetPaymentMethodsSuccessfulState({required this.paymentMethods});
}

//! Loading

class LoadingPaymentMethodsState extends PaymentMethodsState {}

//! Error

class ErrorPaymentMethodsState extends PaymentMethodsState {
  const ErrorPaymentMethodsState({required this.message});
  final String message;
}
