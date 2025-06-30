import 'data.dart';

class CurrentUser {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  User? data;

  CurrentUser({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      status: json['status'] as bool?,
      name: json['name'] as String?,
      message: json['message'] as String?,
      error: json['error'] as dynamic,
      errors: json['errors'] as dynamic,
      data: json['data'] == null || json['data'] is List
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': data?.toJson(),
      };
}
