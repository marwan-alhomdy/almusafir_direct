part of 'form_service_cubit.dart';

sealed class FormServiceState extends Equatable {
  const FormServiceState();

  @override
  List<Object> get props => [];
}

final class FormServiceInitial extends FormServiceState {}

final class FormServiceLoadingState extends FormServiceState {}

final class FormServiceErrorState extends FormServiceState {
  final String message;
  const FormServiceErrorState({required this.message});
}

final class FormServicesSuccessfullyState extends FormServiceState {
  final List<ServiceModul> services;
  const FormServicesSuccessfullyState({required this.services});
}
