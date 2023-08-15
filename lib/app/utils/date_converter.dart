import 'package:intl/intl.dart';

class DateConverter {
  DateConverter();
  static String parseToID(String originalDate) {
    final parsedDate = DateTime.parse(originalDate);
    final formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);

    return formattedDate;
  }
}
