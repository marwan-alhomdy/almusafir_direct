import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/enum/booking_type.dart';

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
          final isSelected = boockingType == selectedBookingType;

          return GestureDetector(
            onTap: () => onChanged(boockingType),
            child: Card.filled(
              color: isSelected ? Colors.blue : null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    // Icon(
                    //   boockingType.icon,
                    //   size: 15,
                    //   color: isSelected ? Colors.white : null,
                    // ),
                    Text(
                      LanguageHelper.isArabic
                          ? boockingType.labelAr
                          : boockingType.labelEn,
                      style: AppTextStyles.getMediumStyle(
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
