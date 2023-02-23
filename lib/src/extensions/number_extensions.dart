part of solfacil_tools_sdk;

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
    final value = showDecimals ? this : this?.floor();
    NumberFormat formatter = NumberFormat(null, locale);

    formatter.minimumIntegerDigits = 1;
    formatter.minimumFractionDigits = showDecimals ? 2 : 0;
    formatter.maximumFractionDigits = showDecimals ? 2 : 0;

    try {
      return formatter.format(value);
    } catch (e) {
      return formatter.format(0);
    }
  }

  String toPercent({String locale = 'pt_Br', bool showDecimals = true}) {
    final value = (this as double? ?? 0).toLocale(
      locale: locale,
      showDecimals: showDecimals,
    );

    return '$value %';
  }
}
