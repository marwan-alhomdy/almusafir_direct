import 'package:flutter/material.dart';

enum BookingType {
  all(
    labelAr: 'الكل',
    labelEn: 'All',
    icon: Icons.all_inclusive,
  ),
  hotel(
    icon: Icons.hotel,
    labelAr: 'فنادق',
    labelEn: 'Hotels',
  ),
  flight(
    icon: Icons.airplane_ticket,
    labelAr: 'رحلات',
    labelEn: 'Flights',
  ),
  transportation(
    icon: Icons.directions_car,
    labelAr: 'مواصلات',
    labelEn: 'Transportation',
  ),
  insurance(
    icon: Icons.insert_chart,
    labelAr: 'تأمين',
    labelEn: 'Insurance',
  ),
  otherServices(
    icon: Icons.more,
    labelAr: 'خدمات أخرى',
    labelEn: 'Other Services',
  );

  final String labelAr;
  final String labelEn;
  final IconData icon;
  const BookingType(
      {required this.icon, required this.labelAr, required this.labelEn});
}
