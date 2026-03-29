part of 'input_formatters.dart';

class CPFAndCNPJInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.onlyDigits();
    if (text.length < 12) {
      return CPFInputFormatter().formatEditUpdate(oldValue, newValue);
    }

    return CNPJInputFormatter().formatEditUpdate(oldValue, newValue);
  }
}
