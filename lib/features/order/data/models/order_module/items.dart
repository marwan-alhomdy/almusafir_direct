import '../product_item_order/product_item_order.dart';

class Items {
  List<ProdcutItemOrder>? data;

  Items({this.data});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ProdcutItemOrder.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
