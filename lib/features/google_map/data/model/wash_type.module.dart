class WashType {
  int? id;
  String? name;
  String? nameAr;

  WashType({this.id, this.name, this.nameAr});

  factory WashType.fromJson(Map<String, dynamic> json) => WashType(
        id: json['id'],
        name: json['name'],
        nameAr: json['nameAr'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nameAr': nameAr,
      };
}
