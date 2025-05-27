import 'data.dart';

class Getalldata {
  int? code;
  bool? status;
  String? message;
  dynamic error;
  dynamic errors;
  Data? data;

  Getalldata({
    this.code,
    this.status,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory Getalldata.fromJson(Map<String, dynamic> json) => Getalldata(
        code: json['code'] as int?,
        status: json['status'] as bool?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
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
