import 'package:almusafir_direct/core/data/models/image.dart';

class RowCartModel {
  String? rowId;
  int? id;
  String? name;
  int? qty;
  num? price;
  List<dynamic>? options;
  List<dynamic>? conditions;
  String? comment;
  num? subtotal;
  bool? isNew;
  Object? unitsId;
  String? unitsName;
  ImageModel? image;
  bool? isLoading;

  RowCartModel({
    this.rowId,
    this.id,
    this.name,
    this.qty,
    this.price,
    this.options,
    this.conditions,
    this.comment,
    this.subtotal,
    this.isNew,
    this.unitsId,
    this.unitsName,
    this.image,
    this.isLoading,
  });

  factory RowCartModel.fromJson(Map<String, dynamic> json) => RowCartModel(
        rowId: json['rowId'],
        id: json['id'],
        name: json['name'],
        qty: json['qty'],
        price: json['price'],
        options: json['options'] as List<dynamic>?,
        conditions: json['conditions'] as List<dynamic>?,
        comment: json['comment'],
        subtotal: json['subtotal'],
        isNew: json['is_new'],
        unitsId: json['units_id'],
        unitsName: json['units_name'],
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'rowId': rowId,
        'id': id,
        'name': name,
        'qty': qty,
        'price': price,
        'options': options,
        'conditions': conditions,
        'comment': comment,
        'subtotal': subtotal,
        'is_new': isNew,
        'units_id': unitsId,
        'units_name': unitsName,
        'image': image?.toJson(),
      };
}
