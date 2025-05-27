import 'datum.dart';

class Adverts {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  List<Datum>? data;

  Adverts({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.data,
  });

  factory Adverts.fromJson(Map<String, dynamic> json) => Adverts(
        status: json['status'] as bool?,
        name: json['name'] as String?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
