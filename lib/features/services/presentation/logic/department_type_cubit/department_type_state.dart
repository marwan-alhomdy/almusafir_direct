part of 'department_type_cubit.dart';

sealed class DepartmentTypeState extends Equatable {
  const DepartmentTypeState();

  @override
  List<Object> get props => [];
}

final class DepartmentTypeInitial extends DepartmentTypeState {}

final class DepartmentTypeLoadingState extends DepartmentTypeState {}

final class DepartmentTypeErrorState extends DepartmentTypeState {
  final String message;
  const DepartmentTypeErrorState({required this.message});
}

final class GetDepartmentTypeSuccessfullyState extends DepartmentTypeState {
  final List<DepartmentType> departmentTypes;
  const GetDepartmentTypeSuccessfullyState(this.departmentTypes);
}
