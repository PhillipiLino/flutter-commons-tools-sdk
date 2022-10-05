import 'package:flutter/services.dart';

import 'cnpj_input_formatter.dart';
import 'cpf_input_formatter.dart';

class CPFAndCNPJInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length < 12) {
      return CPFInputFormatter().formatEditUpdate(oldValue, newValue);
    }

    return CNPJInputFormatter().formatEditUpdate(oldValue, newValue);
  }
}
