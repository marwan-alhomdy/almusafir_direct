class VehicleWallet {
  int? id;
  int? remaining;
  int? whasTimes;

  VehicleWallet({this.id, this.remaining, this.whasTimes});

  factory VehicleWallet.fromJson(Map<String, dynamic> json) => VehicleWallet(
        id: json['id'] as int?,
        remaining: json['remaining'] as int?,
        whasTimes: json['whasTimes'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'remaining': remaining,
        'whasTimes': whasTimes,
      };
}
