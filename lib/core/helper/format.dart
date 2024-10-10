
import 'package:intl/intl.dart';
class Format {
  static String hours(double hours) {
    final hoursNotNegative = hours < 0.0 ? 0.0 : hours;
    final formatter = NumberFormat.decimalPattern();
    final formatted = formatter.format(hoursNotNegative);
    return '${formatted}h';
  }

  static DateTime parse(String dateasString){
    return DateTime.parse(dateasString);
  }
  static DateTime? tryparse(String dateasString){
    return DateTime.tryParse(dateasString);
  }
  static String date(DateTime date) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(date);
  }

  static String emptydate(DateTime date) {
    return DateFormat('').format(date);
  }

  static String dayOfWeek(DateTime date) {
    return DateFormat.E().format(date);
  }

  static String currency(double pay) {
    if (pay != 0.0) {
      final formatter = NumberFormat.simpleCurrency(decimalDigits: 0);
      return formatter.format(pay);
    }
    return '';
  }
}