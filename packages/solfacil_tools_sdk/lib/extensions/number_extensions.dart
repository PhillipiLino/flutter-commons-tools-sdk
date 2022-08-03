import 'package:intl/intl.dart';

extension NumExtensions on num? {
  String toCurrency({
    String locale = 'pt_Br',
    bool showDecimals = true,
  }) {
    NumberFormat currencyFormatter = NumberFormat.simpleCurrency(
      locale: locale,
      decimalDigits: showDecimals ? 2 : 0,
    );
    final noBreakSpace = String.fromCharCode(0x00A0);

    try {
      final formatted =
          currencyFormatter.format(this).replaceAll(noBreakSpace, ' ');

      return formatted;
    } catch (e) {
      return currencyFormatter.format(0).replaceAll(noBreakSpace, ' ');
    }
  }

  String toLocale({String locale = 'pt_Br', bool showDecimals = true}) {
    final pattern = showDecimals ? '#,###.00' : '#,###';
    NumberFormat formatter = NumberFormat(pattern, locale);
    try {
      return formatter.format(this);
    } catch (e) {
      return NumberFormat('#,###,0.00', locale).format(0);
    }
  }

  String toPercent([String locale = 'pt_Br']) {
    var percent = NumberFormat.percentPattern(locale);
    try {
      return percent.format(this);
    } catch (e) {
      return percent.format(0);
    }
  }
}
