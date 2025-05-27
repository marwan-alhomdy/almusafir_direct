import 'package:intl/intl.dart';

class DateTimeHandler {
  // الحصول على التاريخ بصيغة yyyy-MM-dd
  static String formatDate(DateTime? date) {
    return DateFormat('yyyy-MM-dd').format(date ?? DateTime.now()).trim();
  }

  // الحصول على الوقت بصيغة hh:mm
  static String formatTime(DateTime? time) {
    return DateFormat('hh:mm').format(time ?? DateTime.now()).trim();
  }

  static String formatTimeWithAmPm(DateTime? time) {
    return DateFormat('hh:mm a').format(time ?? DateTime.now()).trim();
  }

  // تنسيق التاريخ من String إلى yyyy-MM-dd
  static String formatDateFromString(String? date) {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.tryParse(date ?? "") ?? DateTime.now())
        .trim();
  }

  // تنسيق الوقت من String إلى hh:mm
  static String formatTimeFromString(String? time) {
    return DateFormat('hh:mm')
        .format(DateTime.tryParse(time ?? "") ?? DateTime.now())
        .trim();
  }

  // الحصول على التاريخ والوقت بصيغة yyyy-MM-dd:hh:mm
  static String formatDateTime(DateTime? date) {
    return DateFormat('yyyy-MM-dd:hh:mm').format(date ?? DateTime.now()).trim();
  }

  // تنسيق التاريخ والوقت من String إلى yyyy-MM-dd:hh:mm
  static String formatDateTimeFromString(String? date) {
    return DateFormat('yyyy-MM-dd:hh:mm')
        .format(DateTime.tryParse(date ?? "") ?? DateTime.now())
        .trim();
  }

  // تنسيق التاريخ بصيغة US
  static String formatToUS(DateTime? date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(date ?? DateTime.now())
        .trim();
  }

  // تنسيق التاريخ من String إلى صيغة US
  static String formatToUSFromString(String? date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.tryParse(date ?? "") ?? DateTime.now())
        .trim();
  }
}
