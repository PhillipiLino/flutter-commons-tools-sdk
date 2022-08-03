import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class KwhInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int value =
        newValue.selection.baseOffset == 0 ? 0 : int.parse(newValue.text);
    final formatter = NumberFormat(null, 'pt_Br');
    String newText = formatter.format(value);

    return newValue.copyWith(
        text: '$newText kwh',
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
