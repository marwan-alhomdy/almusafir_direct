class CurrentUser {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  List<dynamic>? data;

  CurrentUser({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        status: json['status'] as bool?,
        name: json['name'] as String?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        data: json['data'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': data,
      };
}
