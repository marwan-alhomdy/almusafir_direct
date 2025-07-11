class Workinghours {
  int? id;
  String? type;
  String? typeTime;
  int? weekday;
  String? weekdayIso;
  String? weekdayName;
  String? openingTime;
  String? closingTime;
  DateTime? day;
  DateTime? open;
  DateTime? close;
  int? worknableId;
  String? worknableType;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Workinghours({
    this.id,
    this.type,
    this.typeTime,
    this.weekday,
    this.weekdayIso,
    this.weekdayName,
    this.openingTime,
    this.closingTime,
    this.day,
    this.open,
    this.close,
    this.worknableId,
    this.worknableType,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Workinghours.fromJson(Map<String, dynamic> json) => Workinghours(
        id: json['id'],
        type: json['type'],
        typeTime: json['type_time'],
        weekday: json['weekday'],
        weekdayIso: json['weekday_iso'],
        weekdayName: json['weekday_name'],
        openingTime: json['opening_time'],
        closingTime: json['closing_time'],
        day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
        open: json['open'] == null
            ? null
            : DateTime.parse(json['open'] as String),
        close: json['close'] == null
            ? null
            : DateTime.parse(json['close'] as String),
        // worknableId: json['worknable_id'],
        worknableType: json['worknable_type'],
        isActive: json['is_active'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'type_time': typeTime,
        'weekday': weekday,
        'weekday_iso': weekdayIso,
        'weekday_name': weekdayName,
        'opening_time': openingTime,
        'closing_time': closingTime,
        'day': day?.toIso8601String(),
        'open': open?.toIso8601String(),
        'close': close?.toIso8601String(),
        'worknable_id': worknableId,
        'worknable_type': worknableType,
        'is_active': isActive,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
