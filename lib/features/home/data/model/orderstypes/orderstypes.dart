import 'datum.dart';

class Orderstypes {
  bool? status;
  String? name;
  String? message;
  dynamic error;
  dynamic errors;
  List<OrderType>? orderType;

  Orderstypes({
    this.status,
    this.name,
    this.message,
    this.error,
    this.errors,
    this.orderType,
  });

  factory Orderstypes.fromJson(Map<String, dynamic> json) => Orderstypes(
        status: json['status'] as bool?,
        name: json['name'] as String?,
        message: json['message'] as String?,
        error: json['error'] as dynamic,
        errors: json['errors'] as dynamic,
        orderType: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderType.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'error': error,
        'errors': errors,
        'data': orderType?.map((e) => e.toJson()).toList(),
      };
}
