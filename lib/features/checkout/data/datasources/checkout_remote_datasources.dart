import 'dart:developer';

import 'package:almusafir_direct/core/server/header_server.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/service.module.dart';
import '../../../../core/services/api.service.dart';
import '../models/checkout_module.dart';

abstract class CheckoutRemoteDataSource {
  Future<CheckoutModule> checkout2(Map<String, dynamic> data);

  Future<List<ServiceModul>> getFlights(String orderType);

  Future<List<ServiceModul>> getAirport(Map<String, dynamic> data);

  Future<List<ServiceModul>> getAllVehicleTypes();

  Future<List<ServiceModul>> getLoadsTypes(String orderType);

  Future<List<ServiceModul>> getPaymentMethods(String? orderType);
}

class CheckoutRemoteDataSourceImplWithDio extends CheckoutRemoteDataSource {
  final ApiService apiService;
  CheckoutRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<CheckoutModule> checkout2(Map<String, dynamic> data) async {
    final response = await apiService.post(
      endPoint: EndPointName.checkout2,
      headers: HeaderServer.headerWithToken,
      data: data..addAll({"api_version": "v2"}),
    );

    return CheckoutModule.fromJson(response);
  }

  @override
  Future<List<ServiceModul>> getAirport(Map<String, dynamic> data) async {
    final response =
        await apiService.get(endPoint: EndPointName.airport, data: data);

    return (response["data"] as List?)
            ?.map((e) => ServiceModul.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<ServiceModul>> getAllVehicleTypes() async {
    final response = await apiService.get(
      endPoint: "${EndPointName.vehicletypes}?per_page=30",
      headers: HeaderServer.headerWithToken,
    );

    return (response["data"] as List?)
            ?.map((e) => ServiceModul.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<ServiceModul>> getLoadsTypes(String orderType) async {
    log(orderType.toString());
    final response = await apiService
        .get(endPoint: EndPointName.loadtypes, data: {"order_type": orderType});
    log(response.toString());
    return (response["data"] as List?)
            ?.map((e) => ServiceModul.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<ServiceModul>> getPaymentMethods(String? orderType) async {
    final response =
        await apiService.get(endPoint: EndPointName.paymentMethods);

    return (response["data"] as List?)
            ?.map((e) => ServiceModul.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<ServiceModul>> getFlights(String orderType) async {
    final response = await apiService.get(
      endPoint: "${EndPointName.flights}?order_type=$orderType",
    );

    return (response["data"] as List?)
            ?.map((e) => ServiceModul.fromJson(e))
            .toList() ??
        [];
  }
}
