class StatisticalPointModule {
  int? sumPoints;
  int? sumPointsAdd;
  int? sumPointsRemove;
  int? sumPointsOut;
  int? sumPointsAvailable;
  int? sumTotal;
  int? pointPrice;
  int? sumTotalAdd;
  int? sumTotalRemove;
  int? sumTotalOut;
  int? sumTotalAvailable;

  StatisticalPointModule({
    this.sumPoints,
    this.sumPointsAdd,
    this.sumPointsRemove,
    this.sumPointsOut,
    this.sumPointsAvailable,
    this.sumTotal,
    this.pointPrice,
    this.sumTotalAdd,
    this.sumTotalRemove,
    this.sumTotalOut,
    this.sumTotalAvailable,
  });

  factory StatisticalPointModule.fromJson(Map<String, dynamic> json) {
    return StatisticalPointModule(
      sumPoints: json['sum_points'] as int?,
      sumPointsAdd: json['sum_points_add'] as int?,
      sumPointsRemove: json['sum_points_remove'] as int?,
      sumPointsOut: json['sum_points_out'] as int?,
      sumPointsAvailable: json['sum_points_available'] as int?,
      sumTotal: json['sum_total'] as int?,
      pointPrice: json['point_price'] as int?,
      sumTotalAdd: json['sum_total_add'] as int?,
      sumTotalRemove: json['sum_total_remove'] as int?,
      sumTotalOut: json['sum_total_out'] as int?,
      sumTotalAvailable: json['sum_total_available'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'sum_points': sumPoints,
        'sum_points_add': sumPointsAdd,
        'sum_points_remove': sumPointsRemove,
        'sum_points_out': sumPointsOut,
        'sum_points_available': sumPointsAvailable,
        'sum_total': sumTotal,
        'point_price': pointPrice,
        'sum_total_add': sumTotalAdd,
        'sum_total_remove': sumTotalRemove,
        'sum_total_out': sumTotalOut,
        'sum_total_available': sumTotalAvailable,
      };
}
