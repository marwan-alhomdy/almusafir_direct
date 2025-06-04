part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class LoadingRegisterState extends RegisterState {}

final class ErrorRegisterState extends RegisterState {
  final String message;
  const ErrorRegisterState(this.message);
}

final class SuccessRegisterState extends RegisterState {
  final CurrentUser currentUser;
  const SuccessRegisterState({required this.currentUser});
}

class MoveToActivationState extends RegisterState {
  const MoveToActivationState();
}
