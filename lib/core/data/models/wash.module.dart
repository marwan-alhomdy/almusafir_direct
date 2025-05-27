import '../../../features/google_map/data/model/wash_type.module.dart';
import 'vehicle_size.module.dart';
import 'wash_price.module.dart';

class WashModule {
  List<VehicleSize>? vehicleSizes;
  List<WashType>? washTypes;
  List<WashPrice>? washPrices;

  WashModule({this.vehicleSizes, this.washTypes, this.washPrices});

  factory WashModule.fromJson(Map<String, dynamic> json) {
    return WashModule(
      vehicleSizes: (json['vehicleSizes'] as List<dynamic>?)
          ?.map((e) => VehicleSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      washTypes: (json['washTypes'] as List<dynamic>?)
          ?.map((e) => WashType.fromJson(e as Map<String, dynamic>))
          .toList(),
      washPrices: (json['washPrices'] as List<dynamic>?)
          ?.map((e) => WashPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'vehicleSizes': vehicleSizes?.map((e) => e.toJson()).toList(),
        'washTypes': washTypes?.map((e) => e.toJson()).toList(),
        'washPrices': washPrices?.map((e) => e.toJson()).toList(),
      };
}
