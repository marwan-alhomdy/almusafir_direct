import 'wash_type.module.dart';

class WashBranchWashType {
  int? washTypeId;
  WashType? washType;

  WashBranchWashType({this.washTypeId, this.washType});

  factory WashBranchWashType.fromJson(Map<String, dynamic> json) =>
      WashBranchWashType(
        washTypeId: json['WashTypeId'],
        washType: json['WashType'] == null
            ? null
            : WashType.fromJson(json['WashType']),
      );

  Map<String, dynamic> toJson() => {
        'WashTypeId': washTypeId,
        'WashType': washType?.toJson(),
      };
}
