import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/enum/booking_type.dart';
import '../../../../../../core/widget/button/button_filter.widget.dart';

class FavoritesFilterbar extends StatelessWidget {
  const FavoritesFilterbar(
      {super.key, required this.selectedBookingType, required this.onChanged});
  final BookingType selectedBookingType;
  final Function(BookingType) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: BookingType.values.length,
        itemBuilder: (context, index) {
          final boockingType = BookingType.values[index];
          return ButtonFilterWidget(
            isSelected: boockingType == selectedBookingType,
            onSelected: () => onChanged(boockingType),
            title: LanguageHelper.isArabic
                ? boockingType.labelAr
                : boockingType.labelEn,
          );
        },
      ),
    );
  }
}
