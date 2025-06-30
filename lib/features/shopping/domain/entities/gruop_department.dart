import '../../../../core/data/models/department/data.dart';

class GroupDepartment {
  final int? typeId;
  final List<ShoppingDepartment> shoppingDepartments;
  GroupDepartment({
    required this.typeId,
    required this.shoppingDepartments,
  });
}
