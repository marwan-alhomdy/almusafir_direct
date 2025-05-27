class Ffff {
  int? id;
  int? orderId;
  int? moneyIn;
  dynamic moneyOut;
  int? driverId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic updatedBy;

  Ffff({
    this.id,
    this.orderId,
    this.moneyIn,
    this.moneyOut,
    this.driverId,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
  });

  factory Ffff.fromJson(Map<String, dynamic> json) => Ffff(
        id: json['id'] as int?,
        orderId: json['orderId'] as int?,
        moneyIn: json['moneyIn'] as int?,
        moneyOut: json['moneyOut'] as dynamic,
        driverId: json['driverId'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        updatedBy: json['updatedBy'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderId': orderId,
        'moneyIn': moneyIn,
        'moneyOut': moneyOut,
        'driverId': driverId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'updatedBy': updatedBy,
      };
}
