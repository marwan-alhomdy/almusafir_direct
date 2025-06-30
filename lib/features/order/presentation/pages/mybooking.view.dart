import 'package:flutter/material.dart';

import '../../../../core/constants/enum/booking_type.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../widgets/booking/booking.widget.dart';
import '../widgets/filter/booking_filterbar.dart';

class MyBookingView extends StatefulWidget {
  const MyBookingView({super.key});

  @override
  State<MyBookingView> createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  BookingType selectedBookingType = BookingType.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(),
      body: Column(
        spacing: 10,
        children: [
          BookingFilterbar(
            selectedBookingType: selectedBookingType,
            onChanged: (value) {
              setState(() => selectedBookingType = value);
            },
          ),
          Divider(height: 0),
          Expanded(child: BookingWidget()),
        ],
      ),
    );
  }
}
