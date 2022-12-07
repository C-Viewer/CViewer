import 'package:intl/intl.dart';

class DateTimeFormatters {
  DateTimeFormatters._();

  static final _dayMonthYear = DateFormat('dd.MM.yyyy');
  static final _hourMinuteDayMonthYear = DateFormat('HH:mm, dd.MM.yyyy');

  static String formatDayMonthYear(DateTime dateTime) {
    return _dayMonthYear.format(dateTime);
  }

  static String formatTimeAndDate(DateTime dateTime) {
    return _hourMinuteDayMonthYear.format(dateTime);
  }
}
