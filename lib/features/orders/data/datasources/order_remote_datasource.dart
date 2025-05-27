import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/config.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/header_server.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
  Future<OrderModel> createOrder({required Map data});
  Future<Unit> updateOrder({required Map data});
  Future<Unit> cancelOrder({required Map data});
}

class OrderRemoteImplWithHttp extends OrderRemoteDataSource {
  final http.Client client;

  OrderRemoteImplWithHttp({required this.client});

  @override
  Future<List<OrderModel>> fetchOrders() async {
    var response = await client.get(
        Uri.parse('${BASE_URL}delegate-api/all-orders'),
        headers: HeaderServer.headerWithToken);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      return (decodeJson as List<dynamic>)
          .map((e) => OrderModel?.fromJson(e))
          .toList();
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }

  @override
  Future<Unit> cancelOrder({required Map data}) async {
    var response = await client.post(
        Uri.parse('${BASE_URL}worker-mobile/cancel-order'),
        headers: HeaderServer.headerWithToken,
        body: json.encode(data));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }

  @override
  Future<OrderModel> createOrder({required Map data}) async {
    var response = await client.post(
        Uri.parse('${BASE_URL}worker-mobile/create-order'),
        headers: HeaderServer.headerWithToken,
        body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      return OrderModel?.fromJson(decodeJson);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }

  @override
  Future<Unit> updateOrder({required Map data}) async {
    var response = await client.put(
        Uri.parse('${BASE_URL}worker-mobile/update-order/${data["id"]}'),
        headers: HeaderServer.headerWithToken,
        body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }
}
