import 'vehicle.module.dart';

class OrderModel {
  int? id;
  int? washBranchId;
  num? cost;
  String? vehicleSize;
  String? washType;
  List<dynamic>? imagesBefor;
  List<dynamic>? imagesAfter;
  String? status;
  DateTime? whasDate;
  String? wahsTime;
  int? workerId;
  int? vehicleId;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  Vehicle? vehicle;

  OrderModel({
    this.id,
    this.washBranchId,
    this.cost,
    this.vehicleSize,
    this.washType,
    this.imagesBefor,
    this.imagesAfter,
    this.status,
    this.whasDate,
    this.wahsTime,
    this.workerId,
    this.vehicleId,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.vehicle,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        washBranchId: json['washBranchId'],
        cost: json['cost'],
        vehicleSize: json['vehicleSize'],
        washType: json['washType'],
        imagesBefor: json['imagesBefor'],
        imagesAfter: json['imagesAfter'],
        status: json['status'],
        whasDate: json['whasDate'] == null
            ? null
            : DateTime.parse(json['whasDate'] as String),
        wahsTime: json['wahsTime'],
        workerId: json['workerId'],
        vehicleId: json['vehicleId'],
        note: json['note'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        vehicle: json['vehicle'] == null
            ? (json['Vehicle'] == null
                ? null
                : Vehicle.fromJson(json['Vehicle'] as Map<String, dynamic>))
            : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'washBranchId': washBranchId,
        'cost': cost,
        'vehicleSize': vehicleSize,
        'washType': washType,
        'imagesBefor': imagesBefor,
        'imagesAfter': imagesAfter,
        'status': status,
        'whasDate': whasDate?.toIso8601String(),
        'wahsTime': wahsTime,
        'workerId': workerId,
        'vehicleId': vehicleId,
        'note': note,
        'vehicle': vehicle?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
