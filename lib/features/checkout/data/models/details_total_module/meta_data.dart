class MetaData {
  int? deliveryCharge;
  int? shippingCost;
  String? code;
  String? name;
  String? description;

  MetaData({
    this.deliveryCharge,
    this.shippingCost,
    this.code,
    this.name,
    this.description,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        deliveryCharge: json['deliveryCharge'] as int?,
        shippingCost: json['shipping_cost'] as int?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'deliveryCharge': deliveryCharge,
        'shipping_cost': shippingCost,
        'code': code,
        'name': name,
        'description': description,
      };
}
