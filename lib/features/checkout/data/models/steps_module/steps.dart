import 'step_data.dart';

class Steps {
  String? previous;
  String? current;
  String? next;
  bool? stepStatus;
  StepData? stepData;

  Steps({
    this.previous,
    this.current,
    this.next,
    this.stepStatus,
    this.stepData,
  });

  factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        previous: json['previous'] as String?,
        current: json['current'] as String?,
        next: json['next'] as String?,
        stepStatus: json['step_status'],
        stepData: json['step_data'] == null
            ? null
            : StepData.fromJson(json['step_data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'previous': previous,
        'current': current,
        'next': next,
        'step_status': stepStatus,
        'step_data': stepData?.toJson(),
      };
}
