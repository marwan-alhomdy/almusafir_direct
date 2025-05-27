// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum CarWashOrderStatus {
  // حالة الطلب: تم استلام طلبك
  All(
    id: -1,
    background: Color(0xFFB87527), // لون خلفية برتقالي
    foreground: Color(0xFFFFFFFF), // لون نص أبيض
    arabicTitle: 'الكل',
    title: 'All',
  ),
  // حالة الطلب: تم استلام طلبك
  PENDING(
    id: 0,
    background: Color(0xFFB87527), // لون خلفية برتقالي
    foreground: Color(0xFFFFFFFF), // لون نص أبيض
    arabicTitle: 'تم استلام طلبك',
    title: 'Order Received',
  ),

  // حالة الطلب: جاري الغسيل
  START(
    id: 1,
    background: Color(0xFF008fd5), // لون خلفية أزرق
    foreground: Color(0xFFFFFFFF), // لون نص أبيض
    arabicTitle: 'جاري الغسيل',
    title: 'Washing in Progress',
  ),

  // حالة الطلب: تم الغسيل
  END(
    id: 2,
    background: Color(0xFF4CAF50), // لون خلفية أخضر
    foreground: Color(0xFFFFFFFF), // لون نص أبيض
    arabicTitle: 'تم الغسيل',
    title: 'Washing Completed',
  ),

  // حالة الطلب: تم إلغاء الغسيل
  FAILED(
    id: 3,
    background: Color(0xFF9E9E9E), // لون خلفية رمادي
    foreground: Color(0xFFFFFFFF), // لون نص أبيض
    arabicTitle: 'تم إلغاء الغسيل',
    title: 'Washing Cancelled',
  );

  final int id;
  final Color background;
  final Color foreground;
  final String arabicTitle;
  final String title;

  const CarWashOrderStatus({
    required this.id,
    required this.background,
    required this.foreground,
    required this.arabicTitle,
    required this.title,
  });
}

extension OrderStatusCustmeX on int {
  CarWashOrderStatus toCarWashOrderStatus() {
    return switch (this) {
      -1 => CarWashOrderStatus.All,
      0 => CarWashOrderStatus.PENDING,
      1 => CarWashOrderStatus.START,
      2 => CarWashOrderStatus.END,
      _ => CarWashOrderStatus.FAILED,
    };
  }
}

extension OrderStatusCustmeNameX on String? {
  CarWashOrderStatus toCarWashOrderStatus() {
    return switch (this) {
      "PENDING" => CarWashOrderStatus.PENDING,
      "START" => CarWashOrderStatus.START,
      "END" => CarWashOrderStatus.END,
      _ => CarWashOrderStatus.FAILED,
    };
  }
}
