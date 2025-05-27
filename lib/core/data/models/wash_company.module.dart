class WashCompany {
  int? id;
  String? nameEn;
  String? nameAr;
  String? logo;

  WashCompany({this.id, this.nameEn, this.nameAr, this.logo});

  factory WashCompany.fromJson(Map<String, dynamic> json) => WashCompany(
        id: json['id'],
        nameEn: json['nameEn'],
        nameAr: json['nameAr'],
        logo: json['logo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameEn': nameEn,
        'nameAr': nameAr,
        'logo': logo,
      };
}
