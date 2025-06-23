import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/department/get_type_departments_uescases.dart';

part 'department_type_state.dart';

class DepartmentTypeCubit extends Cubit<DepartmentTypeState> {
  final GetTypeDepartmentsUescases getTypeDepartmentsUescases;
  DepartmentTypeCubit({required this.getTypeDepartmentsUescases})
      : super(DepartmentTypeInitial());
}
