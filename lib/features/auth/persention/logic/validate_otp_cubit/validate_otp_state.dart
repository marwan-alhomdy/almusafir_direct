part of 'validate_otp_cubit.dart';

sealed class ValidateOtpState extends Equatable {
  const ValidateOtpState();

  @override
  List<Object> get props => [];
}

final class ValidateOtpInitial extends ValidateOtpState {}

final class ValidateOtpLoading extends ValidateOtpState {}

final class ValidateOtpSuccess extends ValidateOtpState {
  const ValidateOtpSuccess();
}

final class CheckActivationSuccess extends ValidateOtpState {
  final CurrentUser currentUser;
  const CheckActivationSuccess({required this.currentUser});
}

final class ValidateOtpError extends ValidateOtpState {
  final String message;
  const ValidateOtpError({required this.message});
}

class ResendOtpSuccessfulState extends ValidateOtpState {
  const ResendOtpSuccessfulState();
}

final class SendOtpLoading extends ValidateOtpState {}

final class SendOtpSuccess extends ValidateOtpState {}

final class SendOtpError extends ValidateOtpState {
  final String message;
  const SendOtpError({required this.message});
}
