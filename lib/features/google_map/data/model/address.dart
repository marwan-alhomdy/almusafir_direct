class Address {
  String? city;
  String? details;

  Address({this.city, this.details});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json['city'] as String?,
        details: json['details'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'details': details,
      };
}
