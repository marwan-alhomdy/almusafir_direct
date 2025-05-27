import 'data.dart';

class Department {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  Data? data;

  Department({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        status: json['status'] as bool?,
        name: json['name'] as String?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': data?.toJson(),
      };
}
