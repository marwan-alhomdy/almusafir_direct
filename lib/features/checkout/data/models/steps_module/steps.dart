import '../process_data_module/process_data.dart';

class Steps {
  String? previous;
  String? current;
  String? next;
  bool? stepStatus;
  ProcessData? stepData;

  Steps({
    this.previous,
    this.current,
    this.next,
    this.stepStatus,
    this.stepData,
  });

  factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        previous: json['previous'],
        current: json['current'],
        next: json['next'],
        stepStatus: json['step_status'],
        // stepData: json['step_data'] == null
        //     ? null
        //     : ProcessData.fromJson(json['step_data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'previous': previous,
        'current': current,
        'next': next,
        'step_status': stepStatus,
        'step_data': stepData?.toJson(),
      };
}
