// ignore_for_file: constant_identifier_names

import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';

enum OrderStatues {
  All(
    labelAr: 'الكل',
    labelEn: 'All',
    color: Colors.transparent,
  ),
  NEW(labelAr: "جديد", labelEn: "New", color: Colors.blue),
  PROCESSING(
      labelAr: "قيد المعالجة", labelEn: "Processing", color: Colors.deepOrange),
  DELIVERY(
      labelAr: "قيد التوصيل", labelEn: "Delivery", color: Colors.deepPurple),
  COMPLETE(labelAr: "مكتمل", labelEn: "Complete", color: Colors.green),
  CANCELLED(labelAr: "ملغي", labelEn: "Cancelled", color: Colors.redAccent);

  final String labelAr;
  final String labelEn;
  final Color color;
  const OrderStatues(
      {required this.labelAr, required this.labelEn, required this.color});
}

extension OrderStatuesX on OrderStatues {
  String get label =>
      LanguageHelper.chooseLanguage(arabic: labelAr, english: labelEn);
}

extension OrderStatuesX2 on String {
  OrderStatues? toOrderStatues() {
    for (OrderStatues statues in OrderStatues.values) {
      if (statues.name == this) {
        return statues;
      }
    }
    return null;
  }
}

extension OrderStatuesX3 on String {
  int getOrderStatuesIndex() {
    return switch (this) {
      "CANCELLED" => -1,
      "NEW" => 0,
      "PROCESSING" => 1,
      "DELIVERY" => 2,
      "COMPLETE" => 3,
      _ => 4
    };
  }
}
