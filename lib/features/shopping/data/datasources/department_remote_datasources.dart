import 'dart:developer';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/models/department/data.dart';
import '../../../../core/services/api.service.dart';
import '../models/department_type/department_type.dart';
import '../models/shop_products/shop_products.dart';

abstract class DepartmentRemoteDataSource {
  Future<List<ShoppingDepartment>> getDepartments(
      String orderType, String tagsTypeId);
  Future<List<DepartmentType>> getTypeDepartments(String orderType);
  Future<List<ShopProduct>> getShopProducts(
      String? orderType, String? departmentsId);
}

class DepartmentRemoteDataSourceImplWithDio extends DepartmentRemoteDataSource {
  final ApiService apiService;
  DepartmentRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<List<ShoppingDepartment>> getDepartments(
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
            ?.map((e) => ShoppingDepartment.fromJson(e))
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

  @override
  Future<List<ShopProduct>> getShopProducts(
      String? orderType, String? departmentsId) async {
    final response =
        await apiService.get(endPoint: "${EndPointName.shopProducts}?", data: {
      "order_type": orderType,
      'departments_id': departmentsId,
    });

    return (response["data"] as List?)
            ?.map((e) => ShopProduct.fromJson(e))
            .toList() ??
        [];
  }
}
