part of 'department_bloc.dart';

sealed class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];
}

class GetShoppingDepartment extends DepartmentEvent {
  const GetShoppingDepartment(this.orderType, this.tagsTypeId);
  final String? orderType;
  final int? tagsTypeId;

  @override
  List<Object> get props => [];
}
