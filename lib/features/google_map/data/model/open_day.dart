class OpenDay {
  bool? open;
  DateTime? shift1OpenTime;
  DateTime? shift2OpenTime;
  DateTime? shift1CloseTime;
  DateTime? shift2CloseTime;

  OpenDay({
    this.open,
    this.shift1OpenTime,
    this.shift2OpenTime,
    this.shift1CloseTime,
    this.shift2CloseTime,
  });

  factory OpenDay.fromJson(Map<String, dynamic> json) => OpenDay(
        open: json['open'],
        shift1OpenTime: json['shift1OpenTime'] == null
            ? null
            : DateTime.parse(json['shift1OpenTime'] as String),
        shift2OpenTime: json['shift2OpenTime'] == null
            ? null
            : DateTime.parse(json['shift2OpenTime'] as String),
        shift1CloseTime: json['shift1CloseTime'] == null
            ? null
            : DateTime.parse(json['shift1CloseTime'] as String),
        shift2CloseTime: json['shift2CloseTime'] == null
            ? null
            : DateTime.parse(json['shift2CloseTime'] as String),
      );

  Map<String, dynamic> toJson() => {
        'open': open,
        'shift1OpenTime': shift1OpenTime?.toIso8601String(),
        'shift2OpenTime': shift2OpenTime?.toIso8601String(),
        'shift1CloseTime': shift1CloseTime?.toIso8601String(),
        'shift2CloseTime': shift2CloseTime?.toIso8601String(),
      };
}
