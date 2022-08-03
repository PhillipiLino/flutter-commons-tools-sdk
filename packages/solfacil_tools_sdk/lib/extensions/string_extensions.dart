import 'package:intl/intl.dart';
import 'package:solfacil_tools_sdk/constants/regex.dart';

extension StringExtension on String? {
  bool get isValidEmail => RegExp(emailRegex).hasMatch(this ?? '');

  bool get isValidPhoneNumber => RegExp(phoneNumberRegex).hasMatch(this ?? '');

  bool get isValidDate => RegExp(dateRegex).hasMatch(this ?? '');

  bool get isValidCPF {
    if (this == null) return false;

    var numbers = this!.onlyDigits();

    if (numbers.length != 11) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    List<int> digits =
        numbers.split('').map((String d) => int.parse(d)).toList();

    int calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    if (digits[9] != dv1) return false;

    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digits[10] != dv2) return false;

    return true;
  }

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
