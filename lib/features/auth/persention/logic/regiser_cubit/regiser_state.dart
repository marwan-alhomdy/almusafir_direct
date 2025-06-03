part of 'regiser_cubit.dart';

sealed class RegiserState extends Equatable {
  const RegiserState();

  @override
  List<Object> get props => [];
}

final class RegiserInitial extends RegiserState {}

final class LoadingRegiserState extends RegiserState {}

final class ErrorRegiserState extends RegiserState {
  final String message;
  const ErrorRegiserState(this.message);
}

final class SuccessRegiserState extends RegiserState {
  final CurrentUser currentUser;
  const SuccessRegiserState({required this.currentUser});
}

class MoveToActivationState extends RegiserState {
  const MoveToActivationState();
}
