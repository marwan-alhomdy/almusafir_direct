import '../../../../cart/data/models/row_cart.module.dart';
import 'conditions.dart';

class CartData {
  Conditions? conditions;
  List<RowCartModel>? contentItems;

  CartData({this.conditions, this.contentItems});

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        conditions: json['conditions'] == null
            ? null
            : Conditions.fromJson(json['conditions'] as Map<String, dynamic>),
        contentItems: (json['content_items'] as List<dynamic>?)
            ?.map((e) => RowCartModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'conditions': conditions?.toJson(),
        'content_items': contentItems?.map((e) => e.toJson()).toList(),
      };
}
