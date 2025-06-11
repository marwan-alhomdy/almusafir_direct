import 'data.dart';

class SettingResponse {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  Setting? setting;

  SettingResponse({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.setting,
  });

  factory SettingResponse.fromJson(Map<String, dynamic> json) =>
      SettingResponse(
        status: json['status'] as bool?,
        name: json['name'] as String?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        setting: json['data'] == null
            ? null
            : Setting.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': setting?.toJson(),
      };
}
