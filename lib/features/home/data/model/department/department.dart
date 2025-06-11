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
        name: json['name'],
        message: json['message'],
        error: json['error'],
        errors: json['errors'],
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
