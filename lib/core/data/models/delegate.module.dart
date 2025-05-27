import 'vehicle.module.dart';

class DelegateModule {
  int? id;
  String? username;
  String? code;
  String? name;
  String? mobile;
  int? vehicleId;
  bool? isActive;
  int? clientBranchId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? clientCompanyId;
  Vehicle? vehicle;

  DelegateModule({
    this.id,
    this.username,
    this.code,
    this.name,
    this.mobile,
    this.vehicleId,
    this.isActive,
    this.clientBranchId,
    this.createdAt,
    this.updatedAt,
    this.clientCompanyId,
    this.vehicle,
  });

  factory DelegateModule.fromJson(Map<String, dynamic> json) => DelegateModule(
        id: json['id'] as int?,
        username: json['username'] as String?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        mobile: json['mobile'] as String?,
        vehicleId: json['vehicleId'] as int?,
        isActive: json['isActive'] as bool?,
        clientBranchId: json['clientBranchId'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        clientCompanyId: json['clientCompanyId'] as int?,
        vehicle: json['Vehicle'] == null
            ? null
            : Vehicle.fromJson(json['Vehicle'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'code': code,
        'name': name,
        'mobile': mobile,
        'vehicleId': vehicleId,
        'isActive': isActive,
        'clientBranchId': clientBranchId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'clientCompanyId': clientCompanyId,
        'Vehicle': vehicle?.toJson(),
      };
}
