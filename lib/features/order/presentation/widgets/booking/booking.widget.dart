import 'package:almusafir_direct/core/constants/enum/booking_type.dart';
import 'package:flutter/material.dart';

import 'card_booking.widget.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: BookingType.values.length - 1,
        itemBuilder: (context, index) {
          final booking = BookingType.values[index + 1];
          return CardBookingWidget(booking: booking);
        },
      ),
    );
  }
}
