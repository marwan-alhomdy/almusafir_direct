part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthBlocInitial extends AuthState {}

//!Loding
class LoadingAuthState extends AuthState {}

//=========================================================
//!Successful
class LoginSuccessfulState extends AuthState {
  final UserModel user;
  const LoginSuccessfulState({required this.user});
}

class VerifyOtpSuccessfulState extends AuthState {
  final dynamic data;
  const VerifyOtpSuccessfulState({required this.data});
}

class ResendOtpSuccessfulState extends AuthState {
  const ResendOtpSuccessfulState();
}

//==========================================================

//! Error
class ErrorLoginState extends AuthState {
  final String message;
  const ErrorLoginState({required this.message});
}

class ErrorVerifyState extends AuthState {
  final String message;
  const ErrorVerifyState({required this.message});
}
