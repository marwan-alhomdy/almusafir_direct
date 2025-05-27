class VehicleSize {
  int? id;
  String? name;
  String? nameAr;

  VehicleSize({this.id, this.name, this.nameAr});

  factory VehicleSize.fromJson(Map<String, dynamic> json) => VehicleSize(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameAr: json['nameAr'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nameAr': nameAr,
      };
}
