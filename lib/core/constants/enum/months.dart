enum Months {
  january(monthAr: "يناير", monthEn: "January"),
  february(monthAr: "فبراير", monthEn: "February"),
  march(monthAr: "مارس", monthEn: "March"),
  april(monthAr: "إبريل", monthEn: "April"),
  may(monthAr: "مايو", monthEn: "May"),
  june(monthAr: "يونيو", monthEn: "June"),
  july(monthAr: "يوليو", monthEn: "July"),
  august(monthAr: "أغسطس", monthEn: "August"),
  september(monthAr: "سبتمبر", monthEn: "September"),
  october(monthAr: "أكتوبر", monthEn: "October"),
  november(monthAr: "نوفمبر", monthEn: "November"),
  december(monthAr: "ديسمبر", monthEn: "December");

  const Months({required this.monthAr, required this.monthEn});
  final String monthAr;
  final String monthEn;
}

extension MonthsX on int {
  String monthName(String language) {
    if (language == "ar") {
      return switch (this) {
        1 => Months.january.monthAr,
        2 => Months.february.monthAr,
        3 => Months.march.monthAr,
        4 => Months.april.monthAr,
        5 => Months.may.monthAr,
        6 => Months.june.monthAr,
        7 => Months.july.monthAr,
        8 => Months.august.monthAr,
        9 => Months.september.monthAr,
        10 => Months.october.monthAr,
        11 => Months.november.monthAr,
        _ => Months.december.monthAr,
      };
    } else {
      return switch (this) {
        1 => Months.january.monthEn,
        2 => Months.february.monthEn,
        3 => Months.march.monthEn,
        4 => Months.april.monthEn,
        5 => Months.may.monthEn,
        6 => Months.june.monthEn,
        7 => Months.july.monthEn,
        8 => Months.august.monthEn,
        9 => Months.september.monthEn,
        10 => Months.october.monthEn,
        11 => Months.november.monthEn,
        _ => Months.december.monthEn,
      };
    }
  }
}
