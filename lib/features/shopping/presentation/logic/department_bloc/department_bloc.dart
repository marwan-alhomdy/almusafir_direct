import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../domain/entities/gruop_department.dart';
import '../../../domain/usecases/get_departments_uescases.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final GetDepartmentsUescases getDepartmentsUescases;
  DepartmentBloc({required this.getDepartmentsUescases})
      : super(DepartmentInitial()) {
    on<GetShoppingDepartment>(getShoppingDepartment,
        transformer: restartable());
  }

  List<GroupDepartment> groupDepartment = [];

  void getShoppingDepartment(
      GetShoppingDepartment event, Emitter<DepartmentState> emit) async {
    emit(DepartmentLoadingState());

    for (var groub in groupDepartment) {
      if (groub.typeId == event.tagsTypeId) {
        emit(DepartmentSuccessfullyState(groub.shoppingDepartments));
        return;
      }
    }

    final failureOrSuccess = await getDepartmentsUescases(
        orderType: event.orderType ?? "",
        tagsTypeId: event.tagsTypeId?.toString() ?? "");

    failureOrSuccess.fold(
      (failuer) => emit(DepartmentErrorState(message: failuer.message)),
      (shoppingDepartments) {
        groupDepartment.add(GroupDepartment(
            typeId: event.tagsTypeId,
            shoppingDepartments: shoppingDepartments));
        emit(DepartmentSuccessfullyState(shoppingDepartments));
      },
    );
  }
}
