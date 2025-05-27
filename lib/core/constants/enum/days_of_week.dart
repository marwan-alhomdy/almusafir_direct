// ignore_for_file: constant_identifier_names

import '../../../helper/language.helper.dart';

enum DaysOfWeek {
  sunday(dayAr: "الأحد", dayEn: "Sunday", shortEn: "Sun"),
  monday(dayAr: "الإثنين", dayEn: "Monday", shortEn: "Mon"),
  tuesday(dayAr: "الثلاثاء", dayEn: "Tuesday", shortEn: "Tue"),
  wednesday(dayAr: "الأربعاء", dayEn: "Wednesday", shortEn: "Wed"),
  thursday(dayAr: "الخميس", dayEn: "Thursday", shortEn: "Thu"),
  friday(dayAr: "الجمعة", dayEn: "Friday", shortEn: "Fri"),
  saturday(dayAr: "السبت", dayEn: "Saturday", shortEn: "Sat"),
  all(dayAr: "الكل", dayEn: "All", shortEn: "All");

  const DaysOfWeek({
    required this.dayAr,
    required this.dayEn,
    required this.shortEn,
  });
  final String dayAr;
  final String dayEn;
  final String shortEn;
}

extension DaysX on DaysOfWeek {
  String get day {
    return LanguageHelper.isArabic ? dayAr : dayEn;
  }
}

extension WeekDaysX on int {
  String dayName(String language, {bool short = false}) {
    if (this < 1 || this > 7) {
      throw ArgumentError(
        "Invalid day number: $this. Must be between 1 and 7.",
      );
    }
    final day = DaysOfWeek.values[this];
    return (language == "ar")
        ? day.dayAr
        : short
            ? day.shortEn
            : day.dayEn;

    // if (language == "ar") {
    //   return switch (this) {
    //     0 => DaysOfWeek.all.dayAr,
    //     1 => DaysOfWeek.sunday.dayAr,
    //     2 => DaysOfWeek.monday.dayAr,
    //     3 => DaysOfWeek.tuesday.dayAr,
    //     4 => DaysOfWeek.wednesday.dayAr,
    //     5 => DaysOfWeek.thursday.dayAr,
    //     6 => DaysOfWeek.friday.dayAr,
    //     7 => DaysOfWeek.saturday.dayAr,
    //     _ =>
    //       throw ArgumentError(
    //         "Invalid day number: $this. Must be between 1 and 7.",
    //       ),
    //   };
    // } else {
    //   if (short) {
    //     return switch (this) {
    //       0 => DaysOfWeek.all.shortEn,
    //       1 => DaysOfWeek.sunday.shortEn,
    //       2 => DaysOfWeek.monday.shortEn,
    //       3 => DaysOfWeek.tuesday.shortEn,
    //       4 => DaysOfWeek.wednesday.shortEn,
    //       5 => DaysOfWeek.thursday.shortEn,
    //       6 => DaysOfWeek.friday.shortEn,
    //       7 => DaysOfWeek.saturday.shortEn,
    //       _ =>
    //         throw ArgumentError(
    //           "Invalid day number: $this. Must be between 1 and 7.",
    //         ),
    //     };
    //   } else {
    //     return switch (this) {
    //       0 => DaysOfWeek.all.dayEn,
    //       1 => DaysOfWeek.sunday.dayEn,
    //       2 => DaysOfWeek.monday.dayEn,
    //       3 => DaysOfWeek.tuesday.dayEn,
    //       4 => DaysOfWeek.wednesday.dayEn,
    //       5 => DaysOfWeek.thursday.dayEn,
    //       6 => DaysOfWeek.friday.dayEn,
    //       7 => DaysOfWeek.saturday.dayEn,
    //       _ =>
    //         throw ArgumentError(
    //           "Invalid day number: $this. Must be between 1 and 7.",
    //         ),
    //     };
    //   }
    // }
  }
}
