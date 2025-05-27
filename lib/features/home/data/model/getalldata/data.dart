import 'adverts.dart';
import 'current_user.dart';
import 'department.dart';
import 'orderstypes.dart';
import 'settings.dart';

class Data {
  Settings? settings;
  CurrentUser? currentUser;
  Department? department;
  Adverts? adverts;
  Orderstypes? orderstypes;

  Data({
    this.settings,
    this.currentUser,
    this.department,
    this.adverts,
    this.orderstypes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        settings: json['settings'] == null
            ? null
            : Settings.fromJson(json['settings'] as Map<String, dynamic>),
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
