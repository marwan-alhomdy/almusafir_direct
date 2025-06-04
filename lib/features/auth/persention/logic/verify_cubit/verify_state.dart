part of 'verify_cubit.dart';

sealed class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

final class VerifyInitial extends VerifyState {}

final class VerifyLoading extends VerifyState {}

final class VerifyError extends VerifyState {
  final String message;
  const VerifyError({required this.message});
}

final class SendOtpLoading extends VerifyState {}

final class SendOtpSuccess extends VerifyState {}

final class SendOtpError extends VerifyState {
  final String message;
  const SendOtpError({required this.message});
}

final class CheckActivationSuccess extends VerifyState {
  final CurrentUser currentUser;
  const CheckActivationSuccess({required this.currentUser});
}
