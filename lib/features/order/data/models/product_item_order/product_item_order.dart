import 'package:almusafir_direct/core/data/models/image.dart';

import 'option_value.dart';

class ProdcutItemOrder {
  int? id;
  String? code;
  int? ordersId;
  String? kind;
  num? isNew;
  int? productsId;
  String? customName;
  String? unitsId;
  String? unitsName;
  num? realPrice;
  num? quantity;
  num? subtotalDiscount;
  num? subtotalTax;
  num? subtotal;
  List<OptionValueOrder>? optionValues;
  List<dynamic>? conditions;
  String? customerNotes;
  String? adminNotes;
  String? companysId;
  String? departmentsId;
  dynamic properties;
  dynamic otherData;
  dynamic configData;
  num? sortOrder;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  List<ImageModel>? images;

  ProdcutItemOrder({
    this.id,
    this.code,
    this.ordersId,
    this.kind,
    this.isNew,
    this.productsId,
    this.customName,
    this.unitsId,
    this.unitsName,
    this.realPrice,
    this.quantity,
    this.subtotalDiscount,
    this.subtotalTax,
    this.subtotal,
    this.optionValues,
    this.conditions,
    this.customerNotes,
    this.adminNotes,
    this.companysId,
    this.departmentsId,
    this.properties,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.images,
  });

  factory ProdcutItemOrder.fromJson(Map<String, dynamic> json) {
    return ProdcutItemOrder(
      id: json['id'],
      code: json['code'],
      ordersId: json['orders_id'],
      kind: json['kind'],
      isNew: json['is_new'],
      productsId: json['products_id'],
      customName: json['custom_name'],
      unitsId: json['units_id'],
      unitsName: json['units_name'],
      realPrice: json['real_price'],
      quantity: json['quantity'],
      subtotalDiscount: json['subtotal_discount'],
      subtotalTax: json['subtotal_tax'],
      subtotal: json['subtotal'],
      optionValues: (json['option_values'] as List<dynamic>?)
          ?.map((e) => OptionValueOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: json['conditions'] as List<dynamic>?,
      customerNotes: json['customer_notes'],
      adminNotes: json['admin_notes'],
      companysId: json['companys_id'],
      departmentsId: json['departments_id'],
      properties: json['properties'] as dynamic,
      otherData: json['other_data'] as dynamic,
      configData: json['config_data'] as dynamic,
      sortOrder: json['sort_order'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'orders_id': ordersId,
        'kind': kind,
        'is_new': isNew,
        'products_id': productsId,
        'custom_name': customName,
        'units_id': unitsId,
        'units_name': unitsName,
        'real_price': realPrice,
        'quantity': quantity,
        'subtotal_discount': subtotalDiscount,
        'subtotal_tax': subtotalTax,
        'subtotal': subtotal,
        'option_values': optionValues?.map((e) => e.toJson()).toList(),
        'conditions': conditions,
        'customer_notes': customerNotes,
        'admin_notes': adminNotes,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'properties': properties,
        'other_data': otherData,
        'config_data': configData,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
      };
}
