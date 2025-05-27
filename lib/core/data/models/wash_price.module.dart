import 'vehicle_size.module.dart';

class WashPrice {
  int? id;
  String? name;
  int? washTypeId;
  int? vehicleSizeId;
  num? price;

  VehicleSize? vehicleSize;

  WashPrice({
    this.id,
    this.name,
    this.washTypeId,
    this.vehicleSizeId,
    this.price,
    this.vehicleSize,
  });

  factory WashPrice.fromJson(Map<String, dynamic> json) => WashPrice(
        id: json['id'],
        name: json['name'],
        washTypeId: json['washTypeId'],
        vehicleSizeId: json['vehicleSizeId'],
        price: json['price'],
        vehicleSize: json['VehicleSize'] == null
            ? null
            : VehicleSize.fromJson(json['VehicleSize'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'washTypeId': washTypeId,
        'vehicleSizeId': vehicleSizeId,
        'price': price,
        'VehicleSize': vehicleSize?.toJson(),
      };
}
