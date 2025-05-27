import 'branch_client.module.dart';
import 'delegates.module.dart';
import 'vehicle_wallet.module.dart';

class Vehicle {
  int? id;
  String? number;
  String? plateLettersEn;
  String? plateLettersAr;
  String? plateNumbers;
  int? clientBranchId;
  int? clientCompanyId;
  int? vehicleSizeId;
  String? manufacturer;
  String? model;
  bool? isActive;
  int? weeklyWashLimit;
  int? monthlyWashLimit;
  List<dynamic>? images;
  List<dynamic>? washTypeIds;
  DateTime? createdAt;
  DateTime? updatedAt;
  Delegates? delegates;
  VehicleWallet? vehicleWallet;
  ClientBranch? clientBranch;

  Vehicle({
    this.id,
    this.number,
    this.plateLettersEn,
    this.plateLettersAr,
    this.plateNumbers,
    this.clientBranchId,
    this.clientCompanyId,
    this.vehicleSizeId,
    this.manufacturer,
    this.model,
    this.isActive,
    this.weeklyWashLimit,
    this.monthlyWashLimit,
    this.images,
    this.washTypeIds,
    this.createdAt,
    this.updatedAt,
    this.delegates,
    this.vehicleWallet,
    this.clientBranch,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'],
        number: json['number'],
        plateLettersEn: json['plateLettersEn'],
        plateLettersAr: json['plateLettersAr'],
        plateNumbers: json['plateNumbers'],
        clientBranchId: json['clientBranchId'],
        clientCompanyId: json['clientCompanyId'],
        vehicleSizeId: json['vehicleSizeId'],
        manufacturer: json['manufacturer'],
        model: json['model'],
        isActive: json['isActive'],
        weeklyWashLimit: json['weeklyWashLimit'],
        monthlyWashLimit: json['monthlyWashLimit'],
        images: json['images'],
        washTypeIds: json['washTypeIds'],
        clientBranch: json['ClientBranch'] == null
            ? null
            : ClientBranch.fromJson(
                json['ClientBranch'] as Map<String, dynamic>),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        delegates: json['Delegates'] == null
            ? null
            : Delegates.fromJson(json['Delegates'] as Map<String, dynamic>),
        vehicleWallet: json['VehicleWallet'] == null
            ? null
            : VehicleWallet.fromJson(
                json['VehicleWallet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'plateLettersEn': plateLettersEn,
        'plateLettersAr': plateLettersAr,
        'plateNumbers': plateNumbers,
        'clientBranchId': clientBranchId,
        'clientCompanyId': clientCompanyId,
        'vehicleSizeId': vehicleSizeId,
        'manufacturer': manufacturer,
        'model': model,
        'isActive': isActive,
        'weeklyWashLimit': weeklyWashLimit,
        'monthlyWashLimit': monthlyWashLimit,
        'images': images,
        'washTypeIds': washTypeIds,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'Delegates': delegates?.toJson(),
        'VehicleWallet': vehicleWallet?.toJson(),
        'ClientBranch': clientBranch?.toJson(),
      };
}
