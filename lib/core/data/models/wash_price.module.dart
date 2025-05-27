import '../../../features/google_map/data/model/wash_type.module.dart';
import 'vehicle_size.module.dart';

class WashPrice {
  int? id;
  String? name;
  int? washTypeId;
  int? vehicleSizeId;
  num? price;
  WashType? washType;
  VehicleSize? vehicleSize;

  WashPrice({
    this.id,
    this.name,
    this.washTypeId,
    this.vehicleSizeId,
    this.price,
    this.washType,
    this.vehicleSize,
  });

  factory WashPrice.fromJson(Map<String, dynamic> json) => WashPrice(
        id: json['id'],
        name: json['name'],
        washTypeId: json['washTypeId'],
        vehicleSizeId: json['vehicleSizeId'],
        price: json['price'],
        washType: json['washType'] == null
            ? null
            : WashType.fromJson(json['washType'] as Map<String, dynamic>),
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
        'washType': washType?.toJson(),
        'VehicleSize': vehicleSize?.toJson(),
      };
}
