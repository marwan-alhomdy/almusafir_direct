import 'package:almusafir_direct/core/server/header_server.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';
import '../model/getalldata/primary_data.dart';

abstract class HomeRemoteDataSource {
  Future<PrimaryData> fetchAllData();
}

class HomeRemoteDataSourceImplWithDio extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<PrimaryData> fetchAllData() async {
    final response = await apiService.get(
        endPoint: EndPointName.getAllDate,
        data: {"api_version": "v2"},
        headers: HeaderServer.headerWithToken);

    return PrimaryData.fromJson(response);
  }
}
