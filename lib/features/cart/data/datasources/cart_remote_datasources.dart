import 'package:almusafir_direct/core/server/header_server.dart';
import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';

abstract class CartRemoteDataSource {
  Future<List<RowCartModel>> getCart(Map<String, dynamic> data);
  Future<List<RowCartModel>> addToCart(Map<String, dynamic> data);
  Future<List<RowCartModel>> deteteCart(Map<String, dynamic> data);
}

class CartRemoteDataSourceeImplWithDio extends CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceeImplWithDio({required this.apiService});

  @override
  @override
  Future<List<RowCartModel>> addToCart(Map<String, dynamic> data) async {
    final response = await apiService.post(
      endPoint: EndPointName.addCard,
      headers: HeaderServer.headerWithToken,
      data: data,
    );
    print(response);
    return (response["data"]["content"] as List?)
            ?.map((e) => RowCartModel.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<RowCartModel>> deteteCart(Map<String, dynamic> data) async {
    final response = await apiService.delete(
      endPoint: EndPointName.destroyAllCard,
      headers: HeaderServer.headerWithToken,
    );
    print(response["data"]);
    return (response["data"]["content"] as List?)
            ?.map((e) => RowCartModel.fromJson(e))
            .toList() ??
        [];
  }

  @override
  Future<List<RowCartModel>> getCart(Map<String, dynamic> data) async {
    final response = await apiService.get(
      endPoint: EndPointName.card,
      headers: HeaderServer.headerWithToken,
      data: data,
    );

    return (response["content"] as List?)
            ?.map((e) => RowCartModel.fromJson(e))
            .toList() ??
        [];
  }
}
