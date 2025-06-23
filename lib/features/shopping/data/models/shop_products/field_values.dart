class FieldValues {
  String? almsaf;
  String? almsaf2;
  String? almsaf22;
  String? aldoam;
  String? hhhhh;
  String? altol;
  dynamic alon;
  String? alozn;

  FieldValues({
    this.almsaf,
    this.almsaf2,
    this.almsaf22,
    this.aldoam,
    this.hhhhh,
    this.altol,
    this.alon,
    this.alozn,
  });

  factory FieldValues.fromJson(Map<String, dynamic> json) => FieldValues(
        almsaf: json['almsaf'] as String?,
        almsaf2: json['almsaf_2'] as String?,
        almsaf22: json['almsaf_2_2'] as String?,
        aldoam: json['aldoam'] as String?,
        hhhhh: json['hhhhh'] as String?,
        altol: json['altol'] as String?,
        alon: json['alon'] as dynamic,
        alozn: json['alozn'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'almsaf': almsaf,
        'almsaf_2': almsaf2,
        'almsaf_2_2': almsaf22,
        'aldoam': aldoam,
        'hhhhh': hhhhh,
        'altol': altol,
        'alon': alon,
        'alozn': alozn,
      };
}
