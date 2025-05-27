part of 'code_vehicle_cubit.dart';

sealed class CodeVehicleState extends Equatable {
  const CodeVehicleState();

  @override
  List<Object> get props => [];
}

final class CodeVehicleInitial extends CodeVehicleState {}

final class CodeVehicleLoading extends CodeVehicleState {}

final class CodeVehicleSuccess extends CodeVehicleState {
  final String code;
  const CodeVehicleSuccess(this.code);

  @override
  List<Object> get props => [code];
}

final class CodeVehicleFailure extends CodeVehicleState {
  final String message;
  const CodeVehicleFailure(this.message);

  @override
  List<Object> get props => [message];
}
