import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/change_code_vehicle.usecases.dart';

part 'code_vehicle_state.dart';

class CodeVehicleCubit extends Cubit<CodeVehicleState> {
  final ChangeCodeVehicleUsecases changeCodeVehicleUsecases;
  CodeVehicleCubit({required this.changeCodeVehicleUsecases})
      : super(CodeVehicleInitial());

  final codeVehicleController = TextEditingController();
  void changeCodeVehicle() {
    emit(CodeVehicleLoading());
    changeCodeVehicleUsecases
        .call(code: codeVehicleController.text)
        .then((value) {
      emit(value.fold((failure) => CodeVehicleFailure(failure.message),
          (code) => CodeVehicleSuccess(codeVehicleController.text)));
    });
  }
}
