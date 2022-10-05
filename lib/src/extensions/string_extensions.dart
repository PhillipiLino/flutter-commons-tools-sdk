import 'package:intl/intl.dart';
import 'package:solfacil_tools_sdk/src/constants/regex.dart';

extension NullableStringExtension on String? {
  bool get isValidEmail => RegExp(emailRegex).hasMatch(this ?? '');

  bool get isValidPhoneNumber => RegExp(phoneNumberRegex).hasMatch(this ?? '');

  bool get isValidDate => RegExp(dateRegex).hasMatch(this ?? '');

  bool matchRegex(String regex) => RegExp(regex).hasMatch(this ?? '');

  num fromCurrency([String locale = 'pt_Br']) {
    NumberFormat currencyFormatter =
        NumberFormat.simpleCurrency(locale: locale);

    final noBreakSpace = String.fromCharCode(0x00A0);
    final text = this?.replaceAll(' ', noBreakSpace) ?? '';

    try {
      return currencyFormatter.parse(text);
    } catch (e) {
      return 0;
    }
  }

  String removeDiacritics() {
    var text = this;
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      text = text?.replaceAll(withDia[i], withoutDia[i]);
    }

    return text ?? '';
  }

  String onlyDigits() => this?.replaceAll(RegExp(r'\D'), '') ?? '';
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
