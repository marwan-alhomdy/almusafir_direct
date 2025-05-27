class StatisticsModel {
  final String? id;
  final String? driverName;
  final String? email;
  final String? avgCurrentMonthScore;
  final String? avgGeneralScore;
  final String? openedOrdersCount;
  final String? completedOrdersCount;
  final List<DriverStatistics>? drivers;

  StatisticsModel({
    required this.id,
    required this.driverName,
    required this.email,
    required this.avgCurrentMonthScore,
    required this.avgGeneralScore,
    required this.openedOrdersCount,
    required this.completedOrdersCount,
    required this.drivers,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      id: json['id'],
      driverName: json['driverName'],
      email: json['email'],
      avgCurrentMonthScore: json['avgCurrentMonthScore'],
      avgGeneralScore: json['avgGeneralScore'],
      openedOrdersCount: json['openedOrdersCount'],
      completedOrdersCount: json['completedOrdersCount'],
      drivers: (json['drivers'] as List)
          .map((driverJson) => DriverStatistics.fromJson(driverJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driverName': driverName,
      'email': email,
      'avgCurrentMonthScore': avgCurrentMonthScore,
      'avgGeneralScore': avgGeneralScore,
      'openedOrdersCount': openedOrdersCount,
      'completedOrdersCount': completedOrdersCount,
      'drivers': drivers?.map((driver) => driver.toJson()).toList(),
    };
  }
}

class DriverStatistics {
  final String? id;
  final String? driverName;
  final String? avgCurrentMonthScore;
  final String? avgGeneralScore;

  DriverStatistics({
    required this.id,
    required this.driverName,
    required this.avgCurrentMonthScore,
    required this.avgGeneralScore,
  });

  factory DriverStatistics.fromJson(Map<String?, dynamic> json) {
    return DriverStatistics(
      id: json['id'],
      driverName: json['driverName'],
      avgCurrentMonthScore: json['avgCurrentMonthScore'],
      avgGeneralScore: json['avgGeneralScore'],
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'driverName': driverName,
      'avgCurrentMonthScore': avgCurrentMonthScore,
      'avgGeneralScore': avgGeneralScore,
    };
  }
}
