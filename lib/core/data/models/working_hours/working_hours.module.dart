import 'workinghours.dart';

class WorkingHoursModule {
  WorkingHoursModule({this.workinghours});
  late final List<Workinghours>? workinghours;

  factory WorkingHoursModule.fromJson(Map<String, dynamic> json) =>
      WorkingHoursModule(
        workinghours: (json['data'] as List<dynamic>?)
            ?.map((e) => Workinghours.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      'data': workinghours?.map((e) => e.toJson()).toList(),
    };
  }
}
