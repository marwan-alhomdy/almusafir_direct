import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/department_type/department_type.dart';
import '../../../domain/usecases/get_type_departments_uescases.dart';

part 'department_type_state.dart';

class DepartmentTypeCubit extends Cubit<DepartmentTypeState> {
  final GetTypeDepartmentsUescases getTypeDepartmentsUescases;
  DepartmentTypeCubit({required this.getTypeDepartmentsUescases})
      : super(DepartmentTypeInitial());

  List<DepartmentType> departmentTypes = [];
  DepartmentType? selectedDepartmentType;
  int? get selectedDepartmentId => selectedDepartmentType?.id;

  void getDepartmentType(String? orderType) async {
    emit(DepartmentTypeLoadingState());
    final failureOrSuccess =
        await getTypeDepartmentsUescases(orderType: orderType ?? "");
    failureOrSuccess.fold(
        (failuer) => emit(DepartmentTypeErrorState(message: failuer.message)),
        (types) {
      selectedDepartmentType = types.firstOrNull;
      departmentTypes = types;
      emit(GetDepartmentTypeSuccessfullyState(types));
    });
  }
}
