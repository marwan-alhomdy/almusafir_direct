import 'dart:developer';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/models/department/data.dart';
import '../../../../core/server/header_server.dart';
import '../../../../core/services/api.service.dart';
import '../../../shopping/data/models/department_type/department_type.dart';

abstract class ExploreRemoteDataSource {
  Future<List<ShoppingDepartment>> getExplores(
      String orderType, String tagsTypeId);
  Future<List<DepartmentType>> getTypeExplores(String orderType);
}

class ExploreRemoteDataSourceImplWithDio extends ExploreRemoteDataSource {
  final ApiService apiService;
  ExploreRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<List<ShoppingDepartment>> getExplores(
      String orderType, String tagsTypeId) async {
    final response = await apiService.get(
      endPoint: EndPointName.basicDepartments,
      headers: HeaderServer.headerWithToken,
      data: {
        "order_type": orderType,
        "tags_type_id": tagsTypeId,
        "isOpened": true,
        "include": "working_hours"
      },
    );
    log(response.toString());
    return (response["data"] as List?)
            ?.map((e) => ShoppingDepartment.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<DepartmentType>> getTypeExplores(String orderType) async {
    final response = await apiService.get(
      endPoint: "${EndPointName.tagsTypes}?order_type=$orderType",
    );

    return (response["data"] as List?)
            ?.map((e) => DepartmentType.fromJson(e))
            .toList() ??
        [];
  }
}
