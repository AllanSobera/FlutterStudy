import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date, DateFormats format) {
    final formattedDate = DateFormat(format.value).format(date);
    return formattedDate;
  }

  static String? formatDateFromString(String dateString, DateFormats format) {
    final date = DateTime.tryParse(dateString);
    if (date == null) {
      return null;
    }
    final formattedDate = DateFormat(format.value).format(date);
    return formattedDate;
  }
}

enum DateFormats {
  ///format hh:mm
  hh_mm(value: 'hh:mm'),
  ///format HH:mm
  HH_mm(value: 'HH:mm'),
  ///format hh:mm:ss
  hh_mm_ss(value: 'hh:mm:ss'),
  ///format HH:mm:ss
  HH_mm_ss(value: 'HH:mm:ss'),
  ///format dd/MM/yyyy
  dd_mm_yyyy(value: 'dd/MM/yyyy'),
  ///format hh:mm dd/MM/yyyy
  hh_mm_dd_mm_yyyy(value: 'hh:mm dd/MM/yyyy');

  final String value;
  const DateFormats({required this.value});
}