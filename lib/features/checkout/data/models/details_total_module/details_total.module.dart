import 'meta_data.dart';

class DetailTotalModule {
  String? code;
  String? title;
  num? value;
  num? priority;
  bool? isSummable;
  MetaData? metaData;

  DetailTotalModule({
    this.code,
    this.title,
    this.value,
    this.priority,
    this.isSummable,
    this.metaData,
  });

  factory DetailTotalModule.fromJson(Map<String, dynamic> json) =>
      DetailTotalModule(
        code: json['code'],
        title: json['title'],
        value: json['value'],
        priority: json['priority'],
        isSummable: json['is_summable'],
        metaData: json['metaData'] == null
            ? null
            : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'title': title,
        'value': value,
        'priority': priority,
        'is_summable': isSummable,
        'metaData': metaData?.toJson(),
      };
}
