import 'package:flutter/material.dart';

import '../../utils/resource/color_app.dart';

enum ExploreFilter {
  all(
    icon: Icons.all_inclusive,
    labelEn: 'All',
    labelAr: 'الكل',
    color: AppColors.mainOneColor,
  ),
  culturalLandmarks(
    icon: Icons.account_balance,
    labelEn: 'Cultural\nLandmarks',
    labelAr: 'المعالم الثقافية',
    color: Colors.orange,
    address: 'اليمن صنعاء',
    description: 'خصم 50% على جميع الرحلات المتاحة لليمن صنعاء',
  ),
  touristDestinations(
    icon: Icons.location_city,
    labelEn: 'Tourist\nDestinations',
    labelAr: 'الوجهات السياحية',
    color: Colors.green,
    address: 'اليمن صنعاء',
    description: 'خصم 50% على جميع الرحلات المتاحة لليمن صنعاء',
  ),
  hotelOffers(
    icon: Icons.hotel,
    labelEn: 'Hotel Offers',
    labelAr: 'عروض الفنادق',
    color: Colors.red,
    address: 'اليمن صنعاء',
    price: 100,
  ),
  ticketOffers(
    icon: Icons.airplane_ticket,
    labelEn: 'Ticket Offers',
    labelAr: 'عروض التذاكر',
    color: Colors.pink,
    address: 'اليمن صنعاء',
    price: 100,
  ),
  carRentalOffers(
    icon: Icons.directions_car,
    labelEn: 'Car Rental\nOffers',
    labelAr: 'عروض السيارات',
    color: Colors.purple,
    price: 100,
  ),
  restaurantsAndCafes(
    icon: Icons.restaurant,
    labelEn: 'Restaurants &\nCafes',
    labelAr: 'مطاعم وكافيهات',
    color: Colors.cyan,
    address: 'اليمن صنعاء',
  ),
  eventsAndFestivals(
    icon: Icons.celebration,
    labelEn: 'Events &\nFestivals',
    labelAr: 'أفواك ومهرجانات',
    color: Colors.brown,
    address: 'اليمن صنعاء',
  ),
  uniqueExperiences(
    icon: Icons.explore,
    labelEn: 'Unique\nExperiences',
    labelAr: 'تجارب فريدة',
    color: Colors.teal,
    price: 100,
  ),
  marketsAndProducts(
    icon: Icons.shopping_bag,
    labelEn: 'Markets &\nProducts',
    labelAr: 'المراكز التجارية والمنتجات',
    color: Colors.indigo,
    address: 'اليمن صنعاء',
  );

  final String labelAr;
  final String labelEn;
  final IconData icon;
  final Color color;
  final num? price;
  final String? address;
  final String? description;

  const ExploreFilter(
      {required this.labelAr,
      required this.labelEn,
      required this.icon,
      required this.color,
      this.price,
      this.address,
      this.description});
}
