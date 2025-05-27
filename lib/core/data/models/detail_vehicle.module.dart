import 'vehicle.module.dart';
import 'wash_status.module.dart';

class DetailVehicle {
  Vehicle? vehicle;
  WashStatus? washStatus;

  DetailVehicle({this.vehicle, this.washStatus});

  factory DetailVehicle.fromJson(Map<String, dynamic> json) => DetailVehicle(
        vehicle: json['vehicle'] == null
            ? null
            : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
        washStatus: json['washStatus'] == null
            ? null
            : WashStatus.fromJson(json['washStatus'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'vehicle': vehicle?.toJson(),
        'washStatus': washStatus?.toJson(),
      };
}
