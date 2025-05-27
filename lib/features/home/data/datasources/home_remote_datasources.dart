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
      endPoint: "v1/data/all?exclude_item=tags_types,menus,categories,products",
    );
    return Getalldata.fromJson(response);
  }
}
