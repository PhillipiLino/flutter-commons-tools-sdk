import 'package:intl/intl.dart';

extension DateFormatExtension on DateFormat {
  DateTime? tryParse(String inputString, [bool utc = false]) {
    try {
      final formattedDate = parse(inputString, utc);
      return formattedDate;
    } on FormatException catch (_) {
      return null;
    }
  }
}
