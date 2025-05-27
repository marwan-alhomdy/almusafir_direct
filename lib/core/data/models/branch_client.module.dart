class ClientBranch {
  int? id;
  String? nameEn;
  String? nameAr;

  ClientBranch({this.id, this.nameEn, this.nameAr});

  factory ClientBranch.fromJson(Map<String, dynamic> json) => ClientBranch(
        id: json['id'],
        nameEn: json['nameEn'],
        nameAr: json['nameAr'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameEn': nameEn,
        'nameAr': nameAr,
      };
}
