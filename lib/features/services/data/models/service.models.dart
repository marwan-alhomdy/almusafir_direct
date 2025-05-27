import 'package:flutter/material.dart';

class ServiceMoele {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  ServiceMoele({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

final List<ServiceMoele> services = [
  ServiceMoele(
    icon: Icons.apartment,
    title: 'Apartment Rentals',
    description:
        'Comfortable residential apartments for short and long term stays',
    color: Colors.indigo,
  ),
  ServiceMoele(
    icon: Icons.directions_car,
    title: 'Internal Private Transfers',
    description: 'Private transportation services within city limits',
    color: Colors.teal,
  ),
  ServiceMoele(
    icon: Icons.directions_bus,
    title: 'External Private Transfers',
    description: 'Private transfers between cities or regions',
    color: Colors.deepOrange,
  ),
  ServiceMoele(
    icon: Icons.airport_shuttle,
    title: 'Airport Transfers',
    description: 'Reliable transportation to and from the airport',
    color: Colors.lightBlue,
  ),
  ServiceMoele(
    icon: Icons.star,
    title: 'VIP Airport Reception',
    description: 'Exclusive meet and greet services at the airport',
    color: Colors.orange,
  ),
  ServiceMoele(
    icon: Icons.account_balance,
    title: 'Hajj Visas and Packages',
    description: 'Comprehensive visa services and packages for Hajj pilgrims',
    color: Colors.brown,
  ),
  ServiceMoele(
    icon: Icons.account_balance_wallet,
    title: 'Umrah Visas and Packages',
    description: 'Visa processing and travel packages for Umrah trips',
    color: Colors.green,
  ),
  ServiceMoele(
    icon: Icons.work,
    title: 'Work Visas',
    description: 'Work visa issuance and legal assistance',
    color: Colors.deepPurple,
  ),
  ServiceMoele(
    icon: Icons.terrain,
    title: 'Domestic Land Tours',
    description: 'Organized land-based tours within the country',
    color: Colors.orange,
  ),
  ServiceMoele(
    icon: Icons.directions_boat,
    title: 'Domestic Sea Tours',
    description: 'Scenic boat and cruise tours in local waters',
    color: Colors.blueAccent,
  ),
  ServiceMoele(
    icon: Icons.public,
    title: 'International Tours',
    description: 'Travel packages and guided tours around the world',
    color: Colors.cyan,
  ),
  ServiceMoele(
    icon: Icons.local_hospital,
    title: 'Medical Treatment Coordination Abroad',
    description:
        'Assistance with medical travel and hospital arrangements abroad',
    color: Colors.redAccent,
  ),
  ServiceMoele(
    icon: Icons.verified,
    title: 'Document Authentication',
    description: 'Official document legalization and authentication services',
    color: Colors.lightGreen,
  ),
  ServiceMoele(
    icon: Icons.school,
    title: 'Scholarship Application Processing',
    description: 'Help with applying and preparing documents for scholarships',
    color: Colors.deepOrangeAccent,
  ),
  ServiceMoele(
    icon: Icons.assignment_turned_in,
    title: 'Work Visa Processing',
    description: 'Processing and support for obtaining work permits',
    color: Colors.deepPurpleAccent,
  ),
  ServiceMoele(
    icon: Icons.sticky_note_2,
    title: 'Visit Visa Processing',
    description: 'Handling visit visa applications and approvals',
    color: Colors.orangeAccent,
  ),
  ServiceMoele(
    icon: Icons.explore,
    title: 'Tourist Visa Processing',
    description: 'Tourist visa issuance and travel assistance',
    color: Colors.blueGrey,
  ),
  ServiceMoele(
    icon: Icons.traffic,
    title: 'Traffic Department Transactions',
    description:
        'Support with driving licenses, vehicle registration, and fines',
    color: Colors.lime,
  ),
  ServiceMoele(
    icon: Icons.person,
    title: 'Civil Status Transactions',
    description:
        'Managing national ID, family records, and civil status matters',
    color: Colors.blue,
  ),
  ServiceMoele(
    icon: Icons.book,
    title: 'Passport Transactions',
    description: 'Passport application and renewal services',
    color: Colors.orange,
  ),
  ServiceMoele(
    icon: Icons.flight,
    title: 'Travel Document Processing',
    description: 'Issuance of travel permits and special documentation',
    color: Colors.pinkAccent,
  ),
  ServiceMoele(
    icon: Icons.person_pin_circle,
    title: 'Tour Guides',
    description: 'Professional tour guide services for individuals and groups',
    color: Colors.green.shade700,
  ),
  ServiceMoele(
    icon: Icons.support_agent,
    title: 'Tourism Advisors',
    description: 'Expert advice for travel planning and tourism services',
    color: Colors.indigo.shade400,
  ),
  ServiceMoele(
    icon: Icons.info,
    title: 'Visitor Travel Information',
    description: 'Useful travel information and tips for visitors',
    color: Colors.orange.shade600,
  ),
  ServiceMoele(
    icon: Icons.hotel,
    title: 'Hotel Apartment Management',
    description: 'Management services for hotel apartments and rentals',
    color: Colors.purple.shade400,
  ),
  ServiceMoele(
    icon: Icons.app_registration,
    title: 'ServiceMoele Registration',
    description: 'Register for services and get started quickly',
    color: Colors.blue.shade300,
  ),
];
