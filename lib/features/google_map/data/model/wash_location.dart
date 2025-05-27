import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'address.dart';
import 'open_day.dart';
import 'wash_branch.module.dart';

class WashLocation {
  int? id;
  String? nameEn;
  String? nameAr;
  bool? isActive;
  double? longitude;
  double? latitude;
  Address? address;
  bool? isMain;
  int? washCompanyId;
  List<dynamic>? openTime;
  List<dynamic>? closeTime;
  List<OpenDay>? openDays;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deleteDate;
  final LatLng? location;
  List<WashBranchWashType>? washBranchWashTypes;

  WashLocation({
    this.id,
    this.nameEn,
    this.nameAr,
    this.isActive,
    this.longitude,
    this.latitude,
    this.address,
    this.isMain,
    this.washCompanyId,
    this.openTime,
    this.closeTime,
    this.openDays,
    this.createdAt,
    this.updatedAt,
    this.deleteDate,
    this.location,
    this.washBranchWashTypes,
  });

  factory WashLocation.fromJson(Map<String, dynamic> json) {
    final latitude = json['Latitude'] ?? 0;
    final longitude = json['Longitude'] ?? 0;
    final location = LatLng(latitude, longitude);

    return WashLocation(
      location: location,
      id: json['id'],
      nameEn: json['nameEn'],
      nameAr: json['nameAr'],
      isActive: json['isActive'],
      longitude: (json['Longitude'] as num?)?.toDouble(),
      latitude: (json['Latitude'] as num?)?.toDouble(),
      address: json['address'] == null
          ? null
          : json['address'] is String
              ? Address(details: json['address'])
              : Address.fromJson(json['address']),
      isMain: json['isMain'],
      washCompanyId: json['washCompanyId'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      openDays: (json['openDays'] as List<dynamic>?)
          ?.map((e) => OpenDay.fromJson(e))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deleteDate: json['deleteDate'] == null
          ? null
          : DateTime.parse(json['deleteDate'] as String),
      washBranchWashTypes: (json['WashBranchWashTypes'] as List<dynamic>?)
          ?.map((e) => WashBranchWashType.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameEn': nameEn,
        'nameAr': nameAr,
        'isActive': isActive,
        'Longitude': longitude,
        'Latitude': latitude,
        'address': address?.toJson(),
        'isMain': isMain,
        'washCompanyId': washCompanyId,
        'openTime': openTime,
        'closeTime': closeTime,
        'openDays': openDays?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'deleteDate': deleteDate,
        'WashBranchWashTypes':
            washBranchWashTypes?.map((e) => e.toJson()).toList(),
      };
}
