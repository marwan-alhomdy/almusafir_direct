import 'meta_data.dart';

class AutoCouponShipping {
  String? name;
  String? label;
  String? priority;
  bool? removeable;
  String? cartInstance;
  MetaData? metaData;

  AutoCouponShipping({
    this.name,
    this.label,
    this.priority,
    this.removeable,
    this.cartInstance,
    this.metaData,
  });

  factory AutoCouponShipping.fromJson(Map<String, dynamic> json) {
    return AutoCouponShipping(
      name: json['name'] as String?,
      label: json['label'] as String?,
      priority: json['priority'] as String?,
      removeable: json['removeable'] as bool?,
      cartInstance: json['cartInstance'] as String?,
      metaData: json['metaData'] == null
          ? null
          : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'label': label,
        'priority': priority,
        'removeable': removeable,
        'cartInstance': cartInstance,
        'metaData': metaData?.toJson(),
      };
}
