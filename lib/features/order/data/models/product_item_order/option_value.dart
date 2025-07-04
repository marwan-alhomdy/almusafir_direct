import 'value.dart';

class OptionValueOrder {
  int? id;
  String? name;
  List<ValueOption>? values;
  num? subtotal;

  OptionValueOrder({this.id, this.name, this.values, this.subtotal});

  factory OptionValueOrder.fromJson(Map<String, dynamic> json) =>
      OptionValueOrder(
        id: json['id'],
        name: json['name'] as String?,
        values: (json['values'] as List<dynamic>?)
            ?.map((e) => ValueOption.fromJson(e as Map<String, dynamic>))
            .toList(),
        subtotal: json['subtotal'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'values': values?.map((e) => e.toJson()).toList(),
        'subtotal': subtotal,
      };
}
