import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/services/api.service.dart';

abstract class HomeRemoteDataSource {
  Future<DelegateModule> fetchAllData();
}

class HomeRemoteDataSourceImplWithDio extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<DelegateModule> fetchAllData() async {
    final response = await apiService.get(
      endPoint: "delegate-api/all-data",
    );
    return DelegateModule.fromJson(response);
  }
}
