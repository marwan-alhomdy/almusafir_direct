import '../../../../../core/data/current_user/current_user.dart';
import '../../../../../core/data/models/department/department.dart';
import '../adverts/adverts.dart';
import '../orderstypes/orderstypes.dart';
import '../settings/settings.dart';

class DataAllData {
  SettingResponse? settings;
  CurrentUser? currentUser;
  Department? department;
  Adverts? adverts;
  Orderstypes? orderstypes;

  DataAllData({
    this.settings,
    this.currentUser,
    this.department,
    this.adverts,
    this.orderstypes,
  });

  factory DataAllData.fromJson(Map<String, dynamic> json) => DataAllData(
        settings: json['settings'] == null
            ? null
            : SettingResponse.fromJson(
                json['settings'] as Map<String, dynamic>),
        currentUser: json['current_user'] == null
            ? null
            : CurrentUser.fromJson(
                json['current_user'] as Map<String, dynamic>),
        department: json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
        adverts: json['adverts'] == null
            ? null
            : Adverts.fromJson(json['adverts'] as Map<String, dynamic>),
        orderstypes: json['orderstypes'] == null
            ? null
            : Orderstypes.fromJson(json['orderstypes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'settings': settings?.toJson(),
        'current_user': currentUser?.toJson(),
        'department': department?.toJson(),
        'adverts': adverts?.toJson(),
        'orderstypes': orderstypes?.toJson(),
      };
}
