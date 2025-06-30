import 'datum.dart';

class Items {
  List<Datum>? data;

  Items({this.data});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
