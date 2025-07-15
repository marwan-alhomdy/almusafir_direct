import 'package:flutter/material.dart';

import '../../../../core/constants/enum/booking_type.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../widget/favorites/filter/favorites_filterbar.dart';

class MyFavoritesView extends StatefulWidget {
  const MyFavoritesView({super.key});

  @override
  State<MyFavoritesView> createState() => _MyFavoritesViewState();
}

class _MyFavoritesViewState extends State<MyFavoritesView> {
  BookingType selectedBookingType = BookingType.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: Column(
        spacing: 10,
        children: [
          FavoritesFilterbar(
            selectedBookingType: selectedBookingType,
            onChanged: (value) {
              setState(() => selectedBookingType = value);
            },
          ),
          const Divider(height: 0),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
