import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/config.dart';
import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/header_server.dart';

abstract class HomeRemoteDataSource {
  Future<DelegateModule> fetchAllData();
}

class HomeRemoteDataSourceImplWithHttp extends HomeRemoteDataSource {
  final http.Client client;
  HomeRemoteDataSourceImplWithHttp({required this.client});
  @override
  Future<DelegateModule> fetchAllData() async {
    final response = await client.get(
      Uri.parse("${BASE_URL}delegate-api/all-data"),
      headers: HeaderServer.headerWithToken,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = json.decode(response.body);
      return DelegateModule.fromJson(data);
    } else {
      final data = json.decode(response.body);
      throw ServerExecption(message: data["message"]);
    }
  }
}
