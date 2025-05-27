class WashTypeId {
  int? washTypeId;

  WashTypeId({this.washTypeId});

  factory WashTypeId.fromJson(Map<String, dynamic> json) => WashTypeId(
        washTypeId: json['WashTypeId'],
      );

  Map<String, dynamic> toJson() => {
        'WashTypeId': washTypeId,
      };
}
