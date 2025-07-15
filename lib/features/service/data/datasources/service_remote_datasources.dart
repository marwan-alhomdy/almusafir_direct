import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/shop_products/shop_products.dart';
import '../../../../core/server/header_server.dart';
import '../../../../core/services/api.service.dart';

abstract class ServiceRemoteDataSource {
  Future<List<ShopProduct>> getProducts(String? orderType);
}

class ServiceRemoteDataSourceImplWithDio extends ServiceRemoteDataSource {
  final ApiService apiService;
  ServiceRemoteDataSourceImplWithDio({required this.apiService});

  @override
  Future<List<ShopProduct>> getProducts(String? orderType) async {
    final response = await apiService.get(
        endPoint: EndPointName.shopProducts,
        headers: HeaderServer.headerWithToken,
        data: {"order_type": orderType});

    return (response["data"] as List?)
            ?.map((e) => ShopProduct.fromJson(e))
            .toList() ??
        [];
  }
}
