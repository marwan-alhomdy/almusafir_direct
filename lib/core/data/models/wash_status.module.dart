class WashStatus {
  String? status;
  int? vehicleBalance;
  int? branchBalance;

  WashStatus({this.status, this.vehicleBalance, this.branchBalance});

  factory WashStatus.fromJson(Map<String, dynamic> json) => WashStatus(
        status: json['status'] as String?,
        vehicleBalance: json['vehicleBalance'] as int?,
        branchBalance: json['branchBalance'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'vehicleBalance': vehicleBalance,
        'branchBalance': branchBalance,
      };
}
