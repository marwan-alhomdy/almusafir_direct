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
  final CurrentUser currentUser;
  const LoginSuccessfulState({required this.currentUser});
}

class MoveToActivationState extends AuthState {
  const MoveToActivationState();
}
//==========================================================

//! Error
class ErrorLoginState extends AuthState {
  final String message;
  const ErrorLoginState({required this.message});
}
