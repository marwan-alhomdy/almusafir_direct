import 'package:almusafir_direct/core/server/header_server.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';
import '../models/order_module/order_module.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModule>> getCustomerOrders();
}

class OrderRemoteDataSourceeImplWithDio extends OrderRemoteDataSource {
  final ApiService apiService;
  OrderRemoteDataSourceeImplWithDio({required this.apiService});

  @override
  Future<List<OrderModule>> getCustomerOrders() async {
    final response = await apiService.get(
      endPoint: EndPointName.customerOrders,
      headers: HeaderServer.headerWithToken,
    );

    return (response["data"] as List?)
            ?.map((e) => OrderModule.fromJson(e))
            .toList() ??
        [];
  }
}
