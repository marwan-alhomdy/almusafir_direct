import 'dart:developer';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/models/department/data.dart';
import '../../../../core/services/api.service.dart';
import '../models/department_type/department_type.dart';

abstract class DepartmentRemoteDataSource {
  Future<List<ShoppingDepartments>> getDepartments(
      String orderType, String tagsTypeId);
  Future<List<DepartmentType>> getTypeDepartments(String orderType);
}

class DepartmentRemoteDataSourceImplWithDio extends DepartmentRemoteDataSource {
  final ApiService apiService;
  DepartmentRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<List<ShoppingDepartments>> getDepartments(
      String orderType, String tagsTypeId) async {
    final response = await apiService.get(
      endPoint: EndPointName.basicDepartments,
      data: {
        "order_type": orderType,
        "tags_type_id": tagsTypeId,
        // "isOpened": false
      },
    );
    log(response.toString());
    return (response["data"] as List?)
            ?.map((e) => ShoppingDepartments.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<DepartmentType>> getTypeDepartments(String orderType) async {
    final response = await apiService.get(
      endPoint: "${EndPointName.tagsTypes}?order_type=$orderType",
    );

    return (response["data"] as List?)
            ?.map((e) => DepartmentType.fromJson(e))
            .toList() ??
        [];
  }
}
