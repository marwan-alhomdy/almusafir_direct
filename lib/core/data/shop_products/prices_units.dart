import 'datum.dart';

class PricesUnits {
  List<UnitsDatum>? data;

  PricesUnits({this.data});

  factory PricesUnits.fromJson(Map<String, dynamic> json) => PricesUnits(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => UnitsDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
