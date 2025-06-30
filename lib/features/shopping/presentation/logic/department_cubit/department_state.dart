part of 'department_cubit.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoadingState extends DepartmentState {}

final class DepartmentErrorState extends DepartmentState {
  final String message;
  const DepartmentErrorState({required this.message});
}

final class DepartmentSuccessfullyState extends DepartmentState {
  final List<ShoppingDepartment> shoppingDepartments;
  const DepartmentSuccessfullyState(this.shoppingDepartments);
}
