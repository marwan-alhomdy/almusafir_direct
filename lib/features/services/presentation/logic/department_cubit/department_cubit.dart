import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../domain/entities/gruop_department.dart';
import '../../../domain/usecases/department/get_departments_uescases.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final GetDepartmentsUescases getDepartmentsUescases;
  DepartmentCubit({required this.getDepartmentsUescases})
      : super(DepartmentInitial());

  List<GroupDepartment> groupDepartment = [];

  void getShoppingDepartment(String? orderType, int? tagsTypeId) async {
    emit(DepartmentLoadingState());

    for (var groub in groupDepartment) {
      if (groub.typeId == tagsTypeId) {
        emit(DepartmentSuccessfullyState(groub.shoppingDepartments));
        return;
      }
    }

    final failureOrSuccess = await getDepartmentsUescases(
        orderType: orderType ?? "", tagsTypeId: tagsTypeId?.toString() ?? "");

    failureOrSuccess.fold(
      (failuer) => emit(DepartmentErrorState(message: failuer.message)),
      (shoppingDepartments) {
        groupDepartment.add(GroupDepartment(
            typeId: tagsTypeId, shoppingDepartments: shoppingDepartments));
        emit(DepartmentSuccessfullyState(shoppingDepartments));
      },
    );
  }
}
