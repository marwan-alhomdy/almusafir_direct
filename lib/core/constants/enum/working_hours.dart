import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';

enum WorkingHoursStatues {
  closing(labelAn: "مغلق", labelEn: "Closing", color: Colors.redAccent),
  opening(labelAn: "مفتوح", labelEn: "Opening", color: Colors.green),
  delivery(labelAn: "توصيل", labelEn: "Delivery", color: Colors.blue);

  final String labelAn;
  final String labelEn;
  final Color color;

  const WorkingHoursStatues({
    required this.labelAn,
    required this.labelEn,
    required this.color,
  });
}

extension WorkingHoursEnumX on String? {
  WorkingHoursStatues? toWorkingHoursStatues() {
    for (WorkingHoursStatues working in WorkingHoursStatues.values) {
      if (working.name == this) {
        return working;
      }
    }

    return null;
  }
}

extension WorkingHoursEnumX2 on WorkingHoursStatues {
  String? get label {
    return LanguageHelper.chooseLabelLanguage(
        arabic: labelAn, english: labelEn);
  }
}
