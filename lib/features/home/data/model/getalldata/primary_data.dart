import 'data.dart';

class PrimaryData {
  int? code;
  bool? status;
  String? message;
  dynamic error;
  dynamic errors;
  DataAllData? data;

  PrimaryData({
    this.code,
    this.status,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory PrimaryData.fromJson(Map<String, dynamic> json) => PrimaryData(
        code: json['code'] as int?,
        status: json['status'] as bool?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : DataAllData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
        'error': error,
        'errors': errors,
        'data': data?.toJson(),
      };
}
