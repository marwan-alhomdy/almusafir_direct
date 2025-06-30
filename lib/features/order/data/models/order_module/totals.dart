import 'datum.dart';

class Totals {
  List<Datum>? data;

  Totals({this.data});

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
