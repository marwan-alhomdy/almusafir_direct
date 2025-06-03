import 'package:almusafir_direct/core/server/header_server.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';
import '../model/getalldata/getalldata.dart';

abstract class HomeRemoteDataSource {
  Future<Getalldata> fetchAllData();
}

class HomeRemoteDataSourceImplWithDio extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<Getalldata> fetchAllData() async {
    final response = await apiService.get(
        endPoint: EndPointName.getAllDate,
        data: {"api_version": "v2"},
        headers: HeaderServer.headerWithToken);

    return Getalldata.fromJson(response);
  }
}
