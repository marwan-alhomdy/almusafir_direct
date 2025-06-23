import 'meta.dart';

class Children {
  List<dynamic>? data;
  Meta? meta;

  Children({this.data, this.meta});

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        data: json['data'] as List<dynamic>?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'meta': meta?.toJson(),
      };
}
